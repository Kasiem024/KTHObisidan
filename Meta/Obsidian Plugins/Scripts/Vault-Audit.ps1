# Vault Audit — checks every note against Meta/Vault Standard.md
#
# Usage (PowerShell 5.1+):
#   powershell -NoProfile -ExecutionPolicy Bypass -File "<this file>"
# Optional:
#   -Root "G:\My Drive\KTHObsidian"     vault path (default: 2 levels above this script)
#   -Detail                             list offending files, not just counts
#
# IMPORTANT (learned the hard way):
#   * Keep this file pure ASCII. PowerShell 5.1 reads .ps1 as ANSI, so literal Swedish
#     characters get corrupted. Swedish tag/folder names are therefore matched with
#     regex wildcards (e.g. 'f.rel.sning') or read from the vault itself.
#   * Always read/write files as UTF-8 and preserve the original BOM.
#
# Scope exclusions come from Meta/Vault Standard.md section 6.

param(
  [string]$Root,
  [switch]$Detail
)
$ErrorActionPreference='Stop'
if(-not $Root){
  $d=Get-Item -LiteralPath $PSScriptRoot
  while($d -ne $null -and -not (Test-Path -LiteralPath (Join-Path $d.FullName 'KTH'))){ $d=$d.Parent }
  if($d){ $Root=$d.FullName }
}
if(-not $Root -or -not (Test-Path -LiteralPath (Join-Path $Root 'KTH'))){ throw "Vault root (folder containing KTH) not found - pass -Root explicitly" }
$enc=New-Object System.Text.UTF8Encoding($false)
function RT($p){
  $b=[System.IO.File]::ReadAllBytes($p)
  if($b.Length -ge 3 -and $b[0] -eq 0xEF -and $b[1] -eq 0xBB -and $b[2] -eq 0xBF){ return $enc.GetString($b,3,$b.Length-3) }
  return $enc.GetString($b)
}
# ---------------- vocabulary (Swedish matched by pattern to stay ASCII) ----------------
$typePat  = '^(begrepp|f.rel.sning|lektion|.vning|labb|seminarium|studieguide|tenta|.vrigt|index)$'
$subjPat  = '^(programmering|n.tverk|matematik|ekonomi|h.rdvara|databaser|samh.lle|s.kerhet)$'
$structPat= '^(KTH|MOC|meta|index|nograph|excalidraw)$'
# ---------------- scope: what counts as an authored study note ----------------
function InScope($full,$name){
  if($full -match '\\\.obsidian\\' -or $full -match '\\\.trash\\' -or $full -match '\\node_modules\\'){ return $false }
  if($full -match '\\Litteraturlista\\'){ return $false }          # course literature + conversions
  if($full -match '\\Ericsson\\'){ return $false }                 # work notes, not studies
  if($full -match 'Obsidian Plugins\\Templates'){ return $false }  # templates
  if($full -match '\\Kurs Mapp Mall\\'){ return $false }           # empty skeleton
  if($name -match '\.(opt|ai)\.md$'){ return $false }              # book text dumps
  if($name -match '\.excalidraw\.md$'){ return $false }            # drawings
  if($name -eq '_index.md'){ return $false }                       # generated indexes
  return $true
}
$navNames=@('Dashboard.md','Vault Health Report.md','index.md','README.md')
function IsNav($full,$name){
  if($navNames -contains $name){ return $true }
  if($full -match '\\Atlas\\' -and $name -match ' MOC\.md$'){ return $true }
  if($full -match '\\Meta\\'){ return $true }
  return $false
}
# ---------------- collect ----------------
$all=Get-ChildItem -LiteralPath $Root -Recurse -File
$md =$all | Where-Object { $_.Extension -eq '.md' -and (InScope $_.FullName $_.Name) }
$names=New-Object 'System.Collections.Generic.HashSet[string]'([StringComparer]::OrdinalIgnoreCase)
$paths=New-Object 'System.Collections.Generic.HashSet[string]'([StringComparer]::OrdinalIgnoreCase)
foreach($a in $all){
  if($a.FullName -match '\\\.obsidian\\' -or $a.FullName -match '\\\.trash\\'){ continue }
  [void]$names.Add($a.BaseName); [void]$names.Add($a.Name)
  $rp=($a.FullName.Substring($Root.Length+1) -replace '\\','/')
  [void]$paths.Add($rp); [void]$paths.Add(($rp -replace '\.md$',''))
}
$res=[ordered]@{}
function Bucket($k){
  if(-not $script:res.Contains($k)){ $script:res[$k]=New-Object System.Collections.Generic.List[string] }
  return ,$script:res[$k]
}
$casing=@{}; $unknown=@{}
foreach($f in $md){
  $rel=$f.FullName.Substring($Root.Length+1)
  $t=RT $f.FullName
  # Excalidraw drawings are not authored notes (some are not named *.excalidraw.md)
  if($t -match '(?s)\A---\r?\n.*?excalidraw.*?\r?\n---'){ continue }
  $fm=[regex]::Match($t,'(?s)\A---\r?\n(.*?)\r?\n---')
  $tags=@(); $body=$t
  if(-not $fm.Success){ (Bucket 'noFrontmatter').Add($rel) }
  else{
    $blk=$fm.Groups[1].Value; $body=$t.Substring($fm.Length)
    $am=[regex]::Match($blk,'(?m)^tags:[ \t]*\[(.*?)\]')
    $lm=[regex]::Match($blk,'(?ms)^tags:[ \t]*\r?\n((?:[ \t]*-[ \t]*\S.*\r?\n?)+)')
    if($am.Success){ foreach($x in ($am.Groups[1].Value -split ',')){ $v=$x.Trim().Trim('"').Trim("'"); if($v){$tags+=$v} } }
    elseif($lm.Success){ (Bucket 'listStyleTags').Add($rel); foreach($l in ($lm.Groups[1].Value -split '\r?\n')){ $im=[regex]::Match($l,'^\s*-\s*(.+?)\s*$'); if($im.Success){ $v=$im.Groups[1].Value.Trim(); if($v){$tags+=$v} } } }
    else{ (Bucket 'frontmatterWithoutTags').Add($rel) }
    if(-not (IsNav $f.FullName $f.Name)){
      if($blk -notmatch '(?m)^created:'){ (Bucket 'missingCreated').Add($rel) }
      if($blk -notmatch '(?m)^updated:'){ (Bucket 'missingUpdated').Add($rel) }
    }
  }
  $dups=@($tags | Group-Object | Where-Object { $_.Count -gt 1 })
  if($dups.Count -gt 0){ (Bucket 'duplicateTags').Add($rel + ' :: ' + (($dups|ForEach-Object{$_.Name}) -join ',')) }
  foreach($tg in $tags){
    $ok=$false
    if($tg -cmatch '^[A-Z]{2}\d{4}$' -or $tg -cmatch '^[A-Z]{2}\d{4}/[A-Za-z0-9]+$' -or $tg -cmatch '^year\d{4}$'){ $ok=$true }
    elseif($tg -cmatch $structPat){ $ok=$true }
    elseif($tg -match $typePat -and $tg -ceq $tg.ToLowerInvariant()){ $ok=$true }
    elseif($tg -match $subjPat -and $tg -ceq $tg.ToLowerInvariant()){ $ok=$true }
    if(-not $ok){
      $lc=$tg.ToLowerInvariant()
      if($lc -match $typePat -or $lc -match $subjPat -or $lc -eq 'kth' -or $lc -eq 'moc' -or ($tg -match '^[A-Za-z]{2}\d{4}$')){
        if($casing.ContainsKey($tg)){$casing[$tg]++}else{$casing[$tg]=1}
      } else {
        if($unknown.ContainsKey($tg)){$unknown[$tg]++}else{$unknown[$tg]=1}
      }
    }
  }
  $h1=[regex]::Matches($body,'(?m)^#[ \t]+\S').Count
  if($h1 -eq 0){ (Bucket 'noH1').Add($rel) } elseif($h1 -gt 1){ (Bucket 'multipleH1').Add("$rel ($h1)") }
  # Meta docs quote the old syntax deliberately when documenting it
  if(($t -match 'this\.file\.(ctime|mtime)') -and ($f.FullName -notmatch '\\Meta\\')){ (Bucket 'oldDataviewDates').Add($rel) }
  # path-derived expectations
  $seg=$rel -split '\\'
  if($seg.Length -ge 3 -and $seg[0] -eq 'KTH' -and $seg[1] -match '^\d{4}\s' -and $seg[2] -cmatch '^[A-Z]{2}\d{4}'){
    $code=($seg[2] -split ' ')[0]; $yr='year'+([regex]::Match($seg[1],'\d{4}').Value)
    if($tags -notcontains 'KTH'){ (Bucket 'missingKTHtag').Add($rel) }
    if($tags -notcontains $yr){ (Bucket 'missingYearTag').Add($rel) }
    if($tags -notcontains $code){ (Bucket 'missingCourseCode').Add($rel) }
    if(@($tags | Where-Object { $_ -match $typePat }).Count -eq 0){ (Bucket 'missingTypeTag').Add($rel) }
    if(@($tags | Where-Object { $_ -match $subjPat }).Count -eq 0){ (Bucket 'missingSubjectTag').Add($rel) }
  }
  # broken links (ignore embeds)
  foreach($lk in [regex]::Matches($body,'(?<!!)\[\[([^\]\|#\^]+)')){
    $tgt=$lk.Groups[1].Value.Trim(); if($tgt -eq ''){ continue }
    $t2=$tgt.TrimEnd('/')
    if($names.Contains($t2) -or $paths.Contains($t2) -or $names.Contains($t2+'.md') -or $paths.Contains($t2+'.md')){ continue }
    (Bucket 'brokenWikilinks').Add("$rel  ->  $tgt")
  }
}
# folder conformance
$forel=$null
foreach($d in (Get-ChildItem -LiteralPath (Join-Path $Root 'KTH') -Recurse -Directory)){ if($d.Name -match '^F.rel.sningar$'){ $forel=$d.Name; break } }
$allowed=@('Anteckningar','Begrepp','Filer'); if($forel){ $allowed+=$forel }
foreach($t in (Get-ChildItem -LiteralPath (Join-Path $Root 'KTH') -Directory)){
  foreach($c in (Get-ChildItem -LiteralPath $t.FullName -Directory)){
    if($c.Name -match '^[A-Z]{2}\d{4}'){
      foreach($n in $allowed){ if(-not (Test-Path -LiteralPath (Join-Path $c.FullName $n))){ (Bucket 'courseMissingFolder').Add($c.Name + ' -> ' + $n) } }
      if(-not (Test-Path -LiteralPath (Join-Path $c.FullName '_index.md'))){ (Bucket 'courseMissingIndex').Add($c.Name) }
    }
    foreach($s in (Get-ChildItem -LiteralPath $c.FullName -Directory)){
      if(($allowed -notcontains $s.Name) -and $s.Name -ne 'Litteraturlista' -and $s.Name -notmatch '^SEM\d'){ (Bucket 'nonConformingFolder').Add($s.FullName.Substring($Root.Length+1)) }
    }
  }
}
# literature naming
foreach($f in ($all | Where-Object { $_.DirectoryName -match '\\Litteraturlista$' -and $_.Extension -eq '.pdf' })){
  $b=$f.BaseName
  if($b -match '(?i)\d+(st|nd|rd|th)\s+Edition'){ (Bucket 'litWrongEditionFormat').Add($b) }
  if($b -match '(?i)Upplagan'){ (Bucket 'litWrongEditionFormat').Add($b) }
  if($b -ne $b.Trim() -or $b -match '\s{2,}'){ (Bucket 'litBadSpacing').Add($b) }
  if($b -cmatch '\b[A-Z]{2}\d{4}\b'){ (Bucket 'litHasCourseCode').Add($b) }
}
# ---------------- report ----------------
Write-Output "=== VAULT AUDIT  $(Get-Date -Format 'yyyy-MM-dd HH:mm') ==="
Write-Output ("root={0}" -f $Root)
Write-Output ("notesInScope={0}  (of {1} markdown files)" -f $md.Count, @($all | Where-Object { $_.Extension -eq '.md' }).Count)
Write-Output ""
$clean=$true
foreach($k in $res.Keys){
  $c=$res[$k].Count
  if($c -eq 0){ continue }
  $clean=$false
  Write-Output ("{0,-26} {1}" -f $k,$c)
  if($Detail){ foreach($x in $res[$k]){ Write-Output "      $x" } }
}
if($casing.Count -gt 0){ $clean=$false; Write-Output ("{0,-26} {1}" -f 'tagCasingViolations',$casing.Count); foreach($k in ($casing.Keys|Sort-Object)){ Write-Output "      $k = $($casing[$k])" } }
if($unknown.Count -gt 0){ $clean=$false; Write-Output ("{0,-26} {1}" -f 'tagsOutsideVocabulary',$unknown.Count); foreach($k in ($unknown.Keys|Sort-Object)){ Write-Output "      $k = $($unknown[$k])" } }
Write-Output ""
if($clean){ Write-Output "RESULT: clean - no deviations from the standard." }
else { Write-Output "RESULT: deviations found (see above). Known/accepted items are tracked in Meta/Vault Findings & Backlog.md." }

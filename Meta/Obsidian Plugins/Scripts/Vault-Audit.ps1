# Vault Audit - checks every note against Meta/Vault Standard.md
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
#
# WHAT THIS COUNTS
#   notesInScope - the population every content check runs over, printed as
#   "notesInScope=N (of M markdown files)". M is every .md in the vault; N is M minus the
#   exclusions in InScope below: .obsidian/, .trash/, node_modules/, .kiro/, anything under a
#   Filer/ folder or a Litteraturlista/ folder, Ericsson/, and the Templater templates. Quote
#   this figure from the script, never from prose - Get-NoteStructureCensus.ps1 must report the
#   same N, and if it does not, one of the two scope predicates has drifted and every figure
#   downstream is measuring a different population (F68).
#   Every other number the audit prints is a count of FILES that break one named rule, so 0 is
#   the only clean value; the checks themselves are listed under CHECKS below.

param(
  [string]$Root,
  [switch]$Detail,
  # CI mode. Skips the two checks that depend on state git does not store, so they would
  # fail on every fresh clone no matter how clean the vault is:
  #   courseMissingFolder - empty category folders are not tracked (git stores no empty dirs)
  #   brokenWikilinks     - links into Litteraturlista/, which .gitignore excludes
  # Everything else is reproducible from the repository and still runs.
  [switch]$ContentOnly
)
$ErrorActionPreference='Stop'
if(-not $Root){
  $d=Get-Item -LiteralPath $PSScriptRoot
  while($d -ne $null -and -not (Test-Path -LiteralPath (Join-Path $d.FullName 'KTH'))){ $d=$d.Parent }
  if($d){ $Root=$d.FullName }
}
$Root = (Get-Item -LiteralPath $Root).FullName
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
$structPat= '^(KTH|MOC|meta|index|nograph|excalidraw|nosr)$'
# ---------------- scope: what counts as an authored study note ----------------
function InScope($full,$name){
  if($full -match '\\\.obsidian\\' -or $full -match '\\\.trash\\' -or $full -match '\\node_modules\\'){ return $false }
  if($full -match '\\\.kiro\\'){ return $false }                  # agent context, not study content
  # Standard section 6: NOTHING under a Filer/ folder is an authored note - Excalidraw
  # drawings, copyrighted course literature and its conversions, and third-party course
  # material downloaded from Canvas (KTH templates, grading criteria, seminar slides,
  # other students' example theses). The literature naming rules do not apply to the
  # Canvas files either, because the official document titles legitimately contain course
  # codes. Stating the rule once here is deliberate: the three narrower exclusions this
  # replaced (Litteraturlista, Filer\Canvas, *.excalidraw.md) happened to cover every file
  # only by coincidence, which is not the same as enforcing the rule.
  if($full -match '\\Filer\\'){ return $false }
  if($full -match '\\Litteraturlista\\'){ return $false }          # also outside a Filer/ folder
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
  # Excalidraw drawings are not authored notes (some are not named *.excalidraw.md, e.g.
  # "CM1008 Lean Canvas Grupp 10.md", which is identified only by its tag).
  #
  # The test is deliberately confined to the FIRST frontmatter block. An earlier version was
  # '(?s)\A---\r?\n.*?excalidraw.*?\r?\n---', and because (?s) lets . cross newlines that
  # matched from the opening --- to ANY later --- in the document, so every note merely
  # MENTIONING excalidraw in its prose was skipped. Meta/Vault Standard.md and
  # Meta/Vault Findings & Backlog.md were silently exempt from every content check below,
  # while notesInScope still counted them - it reported 516 and audited 514.
  $fmEarly=[regex]::Match($t,'(?s)\A---\r?\n(.*?)\r?\n---')
  if($fmEarly.Success -and $fmEarly.Groups[1].Value -match 'excalidraw'){ continue }
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
    # Standard section 3: description is required on every note in scope. It feeds the
    # published site's search results and social previews. Notes tagged excalidraw are
    # the only exception and are skipped above.
    if($blk -notmatch '(?m)^description:'){ (Bucket 'missingDescription').Add($rel) }
    else{
      $dv=[regex]::Match($blk,'(?m)^description:[ \t]*(.*)$').Groups[1].Value.Trim()
      if($dv -eq '' -or $dv -eq '""' -or $dv -eq "''"){ (Bucket 'emptyDescription').Add($rel) }
      # A description must read as plain text: no card delimiters, no wikilink
      # brackets, nothing lifted out of a Dataview query, and no raw markdown. The
      # markdown cases are all harvest residue - a generator took the first content
      # line without checking it was prose, so 21 notes published a heading, a bullet,
      # a $...$ formula or a quiz item as their meta description and social preview.
      elseif($dv -match '::|;;|\[\[' -or $dv -cmatch '\b(FROM|WHERE|SORT|FLATTEN)\b'){ (Bucket 'malformedDescription').Add($rel) }
      elseif($dv -match '#{2,}' -or $dv -match '\$' -or $dv -match '^"?\s*-\s' -or $dv -match '^"?\s*\d+\.\s'){ (Bucket 'malformedDescription').Add($rel) }
      # A summary is not a quiz item. Four notes had a flashcard's question AND its
      # answer as their description, with the separator already stripped, so no
      # delimiter test could see it. A question mark followed by a new sentence is
      # the signature that survives that stripping.
      elseif($dv -match '\?\s+\p{Lu}'){ (Bucket 'malformedDescription').Add($rel) }
    }
  }
  $dups=@($tags | Group-Object | Where-Object { $_.Count -gt 1 })
  if($dups.Count -gt 0){ (Bucket 'duplicateTags').Add($rel + ' :: ' + (($dups|ForEach-Object{$_.Name}) -join ',')) }
  foreach($tg in $tags){
    $ok=$false
    if($tg -cmatch '^[A-Z]{2}\d{3}[0-9X]$' -or $tg -cmatch '^[A-Z]{2}\d{3}[0-9X]/[A-Za-z0-9]+$' -or $tg -cmatch '^year\d{4}$'){ $ok=$true }
    elseif($tg -cmatch $structPat){ $ok=$true }
    elseif($tg -match $typePat -and $tg -ceq $tg.ToLowerInvariant()){ $ok=$true }
    elseif($tg -match $subjPat -and $tg -ceq $tg.ToLowerInvariant()){ $ok=$true }
    if(-not $ok){
      $lc=$tg.ToLowerInvariant()
      if($lc -match $typePat -or $lc -match $subjPat -or $lc -eq 'kth' -or $lc -eq 'moc' -or ($tg -match '^[A-Za-z]{2}\d{3}[0-9Xx]$')){
        if($casing.ContainsKey($tg)){$casing[$tg]++}else{$casing[$tg]=1}
      } else {
        if($unknown.ContainsKey($tg)){$unknown[$tg]++}else{$unknown[$tg]=1}
      }
    }
  }
  # Code is not prose. Blank out fenced blocks and inline code spans before the structural
  # checks below, preserving the line count so the (?m)^ anchors still line up. Without this,
  # any note that DOCUMENTS the vault's own syntax is reported for quoting it: Vault
  # Standard.md's "# <Concept>" example counted as a second H1, its "## Flashcards" example
  # tripped the Flashcards-last rule, and "[[Other Concept]]" and "![[image.png]]" were read
  # as a broken link and an alt-less embed. Ten findings, all quotation artifacts.
  # The closing fence needs \r? before $ : in .NET multiline mode $ matches BEFORE the \n and
  # does not absorb a preceding \r, so '[ \t]*$' silently fails on every CRLF file. This vault
  # has both - Vault Standard.md is LF (8 fenced blocks) and Vault Findings & Backlog.md is
  # CRLF (6 blocks), and without the \r? the pattern matched 0 of the latter's.
  $prose=[regex]::Replace($body,'(?ms)^[ \t]*(```|~~~).*?^[ \t]*\1[ \t]*\r?$',{ param($m) ($m.Value -replace '[^\r\n]','') })
  $prose=[regex]::Replace($prose,'`[^`\r\n]*`',{ param($m) ' ' * $m.Value.Length })
  $h1=[regex]::Matches($prose,'(?m)^#[ \t]+\S').Count
  if($h1 -eq 0){ (Bucket 'noH1').Add($rel) } elseif($h1 -gt 1){ (Bucket 'multipleH1').Add("$rel ($h1)") }
  # Standard section 4: "## Flashcards" is always the last section. This is a hard
  # invariant, not a preference - the published site's card transformer only rewrites
  # content that sits under that heading, so anything after it would render as raw
  # "::" syntax on the page.
  $h2s=@([regex]::Matches($prose,'(?m)^##[ \t]+(.+?)[ \t]*$') | ForEach-Object { $_.Groups[1].Value.Trim() })
  if($h2s.Count -gt 0 -and ($h2s -contains 'Flashcards') -and $h2s[$h2s.Count-1] -ne 'Flashcards'){
    (Bucket 'flashcardsNotLastSection').Add($rel + ' :: last is "' + $h2s[$h2s.Count-1] + '"')
  }
  # Meta docs quote the old syntax deliberately when documenting it
  if(($t -match 'this\.file\.(ctime|mtime)') -and ($f.FullName -notmatch '\\Meta\\')){ (Bucket 'oldDataviewDates').Add($rel) }
  # Inline Dataview expressions (`= ...`) publish as literal text: Quartz has no Dataview
  # engine, and unlike fenced query blocks these are not hidden by custom.scss. Five notes
  # had one as their H1, so the page heading read "=this.file.name".
  if(($t -match '`\s*=\s*this\.') -and ($f.FullName -notmatch '\\Meta\\')){ (Bucket 'inlineDataviewExpression').Add($rel) }
  # path-derived expectations
  $seg=$rel -split '\\'
  if($seg.Length -ge 3 -and $seg[0] -eq 'KTH' -and $seg[1] -match '^\d{4}\s' -and $seg[2] -cmatch '^[A-Z]{2}\d{3}[0-9X]'){
    $code=($seg[2] -split ' ')[0]; $yr='year'+([regex]::Match($seg[1],'\d{4}').Value)
    if($tags -notcontains 'KTH'){ (Bucket 'missingKTHtag').Add($rel) }
    if($tags -notcontains $yr){ (Bucket 'missingYearTag').Add($rel) }
    if($tags -notcontains $code){ (Bucket 'missingCourseCode').Add($rel) }
    if(@($tags | Where-Object { $_ -match $typePat }).Count -eq 0){ (Bucket 'missingTypeTag').Add($rel) }
    if(@($tags | Where-Object { $_ -match $subjPat }).Count -eq 0){ (Bucket 'missingSubjectTag').Add($rel) }
  }
  # Standard section 4: every image embed needs alt text after a pipe. Without it the
  # site emits alt="", making the diagram invisible to screen readers. A numeric value
  # is a width, not alt text, so it does not count.
  foreach($em in [regex]::Matches($prose,'!\[\[([^\]]+)\]\]')){
    $inner=$em.Groups[1].Value
    $leaf=($inner -split '\|')[0]
    if($leaf -notmatch '\.(png|jpg|jpeg|gif|webp|svg)$'){ continue }
    $alt=''
    if($inner -match '\|(.*)$'){ $alt=$matches[1].Trim() }
    if($alt -eq '' -or $alt -match '^\d+(x\d+)?$'){ (Bucket 'imageEmbedWithoutAlt').Add($rel + ' :: ' + $leaf) }
  }
  # broken links (ignore embeds). Skipped in -ContentOnly: many targets live in
  # Litteraturlista/, which is gitignored, so a clone can never resolve them.
  if(-not $ContentOnly){
    foreach($lk in [regex]::Matches($prose,'(?<!!)\[\[([^\]\|#\^]+)')){
      $tgt=$lk.Groups[1].Value.Trim(); if($tgt -eq ''){ continue }
      $t2=$tgt.TrimEnd('/')
      if($names.Contains($t2) -or $paths.Contains($t2) -or $names.Contains($t2+'.md') -or $paths.Contains($t2+'.md')){ continue }
      (Bucket 'brokenWikilinks').Add("$rel  ->  $tgt")
    }
  }
}
# folder conformance
$forel=$null
foreach($d in (Get-ChildItem -LiteralPath (Join-Path $Root 'KTH') -Recurse -Directory)){ if($d.Name -match '^F.rel.sningar$'){ $forel=$d.Name; break } }
$allowed=@('Anteckningar','Begrepp','Filer'); if($forel){ $allowed+=$forel }
foreach($t in (Get-ChildItem -LiteralPath (Join-Path $Root 'KTH') -Directory)){
  foreach($c in (Get-ChildItem -LiteralPath $t.FullName -Directory)){
    if($c.Name -match '^[A-Z]{2}\d{3}[0-9X]'){
      # Skipped in -ContentOnly: an empty category folder is not tracked by git.
      if(-not $ContentOnly){
        foreach($n in $allowed){ if(-not (Test-Path -LiteralPath (Join-Path $c.FullName $n))){ (Bucket 'courseMissingFolder').Add($c.Name + ' -> ' + $n) } }
      }
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
  if($b -cmatch '\b[A-Z]{2}\d{3}[0-9X]\b'){ (Bucket 'litHasCourseCode').Add($b) }
}
# ---------------- tag index: every Filer/ file must be excluded in Obsidian ----------------
# Standard section 6. Being out of THIS script's scope is not enough: Obsidian indexes tags
# from every Markdown file it can see, so a C code listing inside a converted book puts
# "#include" in the tag pane and OCR page anchors put 42 "#page-N-M" tags there. Measured
# 2026-09-05: 52 of the vault's 70 distinct inline tags existed only in Filer/ files.
#
# The only mechanism that removes them is userIgnoreFilters in .obsidian/app.json -
# MetadataCache.getTags() skips ignored paths and the tag pane is built from getTags().
# This check exists because that setting is invisible from inside a note: nothing else
# would ever notice it being emptied, and its syntax fails silently when it is wrong.
#
# Filter semantics are reproduced from obsidian-1.13.7.asar, updateUserIgnoreFilters:
#   /re/  -> new RegExp(inner, "i")            matches anywhere in the path
#   other -> new RegExp("^" + escaped, "i")    anchored PREFIX, not a path fragment
# A bare "Obsidian Plugins/" therefore matched nothing at all for months.
$filerMd = @($all | Where-Object { $_.Extension -eq '.md' -and $_.FullName -match '\\Filer\\' })
if($filerMd.Count -gt 0){
  $ignoreRx=@()
  $appJson=Join-Path $Root '.obsidian\app.json'
  if(Test-Path -LiteralPath $appJson){
    try{
      $cfg=[System.IO.File]::ReadAllText($appJson,[System.Text.Encoding]::UTF8) | ConvertFrom-Json
      if($cfg.PSObject.Properties.Name -contains 'userIgnoreFilters' -and $cfg.userIgnoreFilters){
        foreach($raw in @($cfg.userIgnoreFilters)){
          $s=$raw.Trim()
          if($s.Length -eq 0){ continue }
          if($s.Length -gt 2 -and $s.StartsWith('/') -and $s.EndsWith('/')){ $pat=$s.Substring(1,$s.Length-2) }
          else{ $pat='^'+[regex]::Escape($s) }
          try{ $ignoreRx += [regex]::new($pat,[System.Text.RegularExpressions.RegexOptions]::IgnoreCase) }
          catch{ (Bucket 'tagIndexBadFilter').Add($raw) }   # Obsidian drops it and logs to console
        }
      }
    } catch { (Bucket 'tagIndexBadFilter').Add('.obsidian/app.json is not valid JSON') }
  }
  # A missing or filter-less app.json means nothing is excluded, so every file is reported.
  foreach($f in $filerMd){
    $relFwd=($f.FullName.Substring($Root.Length+1) -replace '\\','/')
    $covered=$false
    foreach($rx in $ignoreRx){ if($rx.IsMatch($relFwd)){ $covered=$true; break } }
    if(-not $covered){ (Bucket 'tagIndexNotExcluded').Add($relFwd) }
  }
}
# ---------------- report ----------------
Write-Output "=== VAULT AUDIT  $(Get-Date -Format 'yyyy-MM-dd HH:mm') ==="
Write-Output ("root={0}" -f $Root)
Write-Output ("notesInScope={0}  (of {1} markdown files)" -f $md.Count, @($all | Where-Object { $_.Extension -eq '.md' }).Count)
if($ContentOnly){
  Write-Output "mode=ContentOnly - skipping courseMissingFolder and brokenWikilinks."
  Write-Output "  These need state git does not store (empty folders, gitignored Litteraturlista)."
  Write-Output "  Run the audit locally with no switches for the full check."
}
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
if($clean){
  Write-Output "RESULT: clean - no deviations from the standard."
  exit 0
}
else {
  Write-Output "RESULT: deviations found (see above). Known/accepted items are tracked in Meta/Vault Findings & Backlog.md."
  Write-Output "Re-run with -Detail to list the offending files."
  # Non-zero so automation can gate on this. Without it the script only ever printed its
  # verdict and always exited 0, which would make any CI step pass unconditionally.
  exit 1
}

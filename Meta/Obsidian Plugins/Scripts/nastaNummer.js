/*
 * nastaNummer.js — Templater user script
 *
 * Returnerar nästa löpnummer för en given typ i den aktuella mappen.
 * Letar upp befintliga filer vars namn innehåller "{prefix} <siffra>"
 * (t.ex. "Föreläsning 3") och returnerar högsta funna numret + 1.
 *
 * Användning i en template:
 *   <% tp.user.nastaNummer(tp, "Föreläsning") %>
 */

function nastaNummer(tp, prefix) {
  const folderPath = tp.file.folder(true);
  const folder = app.vault.getAbstractFileByPath(folderPath);
  const re = new RegExp(prefix + "\\s+(\\d+)");
  let max = 0;

  if (folder && Array.isArray(folder.children)) {
    for (const child of folder.children) {
      // Endast markdown-filer, och räkna inte filen som just skapas.
      if (child.extension === "md" && child.basename !== tp.file.title) {
        const m = child.basename.match(re);
        if (m) max = Math.max(max, parseInt(m[1], 10));
      }
    }
  }

  return max + 1;
}

module.exports = nastaNummer;

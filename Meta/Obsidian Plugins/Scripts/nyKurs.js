/*
 * nyKurs.js — Templater user script
 *
 * Skapar en komplett kursmappstruktur under KTH/{termin}/{KURSKOD Kursnamn}/:
 *   Föreläsningar, Begrepp, Anteckningar, Filer/Litteraturlista
 * Returnerar den vault-relativa sökvägen till kursmappen (eller null vid avbrott
 * eller om kursen redan finns). Mallen "Ny kurs" gör sedan noten till _index.
 */
async function nyKurs(tp) {
  const nuvarandeTermin =
    tp.file.folder(true).split("/")[1] || tp.date.now("YYYY") + " Höst";

  const termin = await tp.system.prompt("Termin", nuvarandeTermin);
  if (!termin) return null;
  const kurskod = await tp.system.prompt("Kurskod (t.ex. HI1033)");
  if (!kurskod) return null;
  const kursnamn = await tp.system.prompt("Kursnamn (t.ex. Databasteknik)");
  if (!kursnamn) return null;

  const base = `KTH/${termin.trim()}/${kurskod.trim()} ${kursnamn.trim()}`;

  // Avbryt om kursen redan finns (skydda befintligt _index).
  if (app.vault.getAbstractFileByPath(base + "/_index.md")) return null;

  const undermappar = ["Föreläsningar", "Begrepp", "Anteckningar", "Filer/Litteraturlista"];
  for (const m of undermappar) {
    const p = `${base}/${m}`;
    if (!app.vault.getAbstractFileByPath(p)) {
      await app.vault.createFolder(p).catch(() => {});
    }
  }

  return base;
}

module.exports = nyKurs;

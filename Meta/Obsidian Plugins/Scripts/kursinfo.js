/*
 * kursinfo.js — Templater user script
 *
 * Härleder kursinformation från mappstrukturen:
 *   KTH/{termin}/{KURSKOD Kursnamn}/{typ}/anteckning.md
 * Kursmappen hittas via mönstret "två bokstäver + fyra siffror" (t.ex. HI1031).
 *
 * ÄMNE (subject) läses i första hand från kursens _index.md (enda källan till
 * sanning). Saknas det används fallback-kartan nedan.
 *
 * Användning i en template:
 *   <%* const k = tp.user.kursinfo(tp); %>
 *   <% k.kurskod %>  <% k.kursnamn %>  <% k.termin %>  <% k.subjectTags %>
 */

// Fallback om _index saknar ämnestaggar. Normalt behövs den inte.
const AMNE_PER_KURS = {
  HI1031: ["databaser", "programmering"],
  HI1032: ["nätverk"],
  HI2002: ["nätverk"],
  EN2720: ["nätverk", "säkerhet"],
};

// Taggar som INTE räknas som ämne (struktur/typ/metadata).
const ICKE_AMNE = new Set([
  "index", "KTH", "föreläsning", "lektion", "begrepp", "seminarium",
  "studieguide", "tenta", "labb", "övning", "övrigt", "meta",
]);

// Läs ämnestaggar ur {kursmapp}/_index.md
function amnenFranIndex(courseFolderPath, kurskod) {
  try {
    const f = app.vault.getAbstractFileByPath(courseFolderPath + "/_index.md");
    if (!f) return null;
    const fm = app.metadataCache.getFileCache(f)?.frontmatter;
    if (!fm || fm.tags == null) return null;
    const tags = Array.isArray(fm.tags) ? fm.tags : String(fm.tags).split(/[,\s]+/);
    const amnen = tags
      .map((t) => String(t).trim())
      .filter((t) => t && t !== kurskod && !ICKE_AMNE.has(t) && !/^year\d+$/i.test(t));
    return amnen.length ? amnen : null;
  } catch (e) {
    return null;
  }
}

function kursinfo(tp) {
  const folderPath = tp.file.folder(true); // vault-relativt, alltid "/" även på Windows
  const parts = folderPath.split("/");
  const idx = parts.findIndex((p) => /^[A-Za-zÅÄÖåäö]{2}\d{4}\b/.test(p));

  let hasCourse = false;
  let courseSegment = "";
  let courseFolderPath = "";
  let kurskod = "";
  let kursnamn = "";
  let termin = "";

  if (idx !== -1) {
    hasCourse = true;
    courseSegment = parts[idx]; // "HI1031 Distribuerade informationssystem"
    courseFolderPath = parts.slice(0, idx + 1).join("/");
    const tokens = courseSegment.split(" ");
    kurskod = tokens[0];
    kursnamn = tokens.slice(1).join(" ");
    termin = idx >= 1 ? parts[idx - 1] : "";
  }

  const year = tp.date.now("YYYY");
  const subjects = amnenFranIndex(courseFolderPath, kurskod) || AMNE_PER_KURS[kurskod] || [];

  return {
    folderPath,
    hasCourse,
    courseSegment,
    courseFolderPath,
    kurskod,
    kursnamn,
    termin,
    year,
    subjects,
    subjectTags: subjects.join(", "),
    hasSubjects: subjects.length > 0,
  };
}

module.exports = kursinfo;

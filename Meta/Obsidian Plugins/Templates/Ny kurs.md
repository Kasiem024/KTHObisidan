<%_*
/* Ny kurs — kör via "Templater: Create new note from template".
   Skapar mappstrukturen och gör den här noten till kursens _index.md. */
const base = await tp.user.nyKurs(tp);
if (base) {
  await tp.file.move(base + "/_index");
  tR += await tp.file.include("[[Kurs Index Template]]");
}
_%>
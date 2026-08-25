<%_*
/* Mappstyrd auto-mall.
   Väljer rätt mall utifrån den NÄRMASTE mappen och delegerar till den.
   Kopplas i Templater-inställningarna: Folder Templates → mapp "KTH" → denna fil.

   SÄKERHETSSPÄRR (viktig på Google Drive-synkade valv):
   Templaters "trigger on file creation" kan råka utlösas på filer som synkas
   IN från en annan enhet. Om filen redan har innehåll rör vi den därför inte. */
const befintligt = tp.file.content;
if (befintligt && befintligt.trim().length > 0) {
  tR += befintligt; // filen har redan innehåll – lämna orörd
} else {
  const typ = tp.file.folder(); // närmaste mappnamn, t.ex. "Föreläsningar"
  let mall = null;
  if (typ === "Föreläsningar" || typ === "Föreläsningar & Lektioner") mall = "[[Föreläsning Template]]";
  else if (typ === "Begrepp") mall = "[[Begrepp Template]]";
  else if (typ === "Seminarier" || typ === "Seminarium") mall = "[[Seminarium Template]]";
  else if (typ === "Anteckningar") mall = "[[Default Template]]";

  if (mall) {
    tR += await tp.file.include(mall);
  }
  // Okänd mapp (t.ex. kursroten, Filer, Litteraturlista): gör ingenting.
}
_%>
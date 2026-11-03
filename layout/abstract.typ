#import "/layout/fonts.typ": *

#let abstract(body, lang: "en", keywords: ()) = {
  let titleLabel = if lang == "en" { "Abstract" } else if lang == "el" { "Περίληψη" } else { "Abstract" }
  let keywordsLabel = if lang == "en" { "Keywords:" } else if lang == "el" { "Λέξεις Κλειδιά:" } else { "Keywords:" }

  set page(
    margin: (left: 30mm, right: 30mm, top: 40mm, bottom: 40mm),
    numbering: none,
    number-align: center,
  )

  set text(
    font: fonts.body,
    size: 12pt,
    lang: lang
  )

  set par(
    leading: 1em,
    justify: true
  )

  // --- Abstract ---
  align(center, text(font: fonts.body, 1em, weight: "semibold", titleLabel))

  body

  // --- Keywords ---
  v(2em)
  par(justify: false)[#text(weight: "semibold", keywordsLabel) #keywords.join(", ")]
}

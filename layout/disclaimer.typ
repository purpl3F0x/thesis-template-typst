#import "/layout/fonts.typ": *
#import "/layout/i18n.typ": *

#let disclaimer(
  title: "",
  degree: "",
  author: "",
  submissionDate: none,
  lang: "en",
) = {
  set page(
    margin: (left: 30mm, right: 30mm, top: 40mm, bottom: 40mm),
    numbering: none,
    number-align: center,
  )

  set text(
    font: fonts.body, 
    size: 11pt, 
    lang: lang
  )

  set par(leading: 1em, justify: true)

  // --- Disclaimer ---
  // Signature block at top
  text(size: 9pt, "." * 28)
  linebreak()
  text(weight: 400, author)
  linebreak()
  text(tr(lang, "graduate"))

  v(1fr)

  let year = if submissionDate != none { str(submissionDate.year()) } else { "Year" }

  // Copyright notice
  text([Copyright #sym.copyright #text(weight: 700, underline(author + ", " + year))])
  linebreak()
  text(tr(lang, "rights"))

  v(8mm)

  text(tr(lang, "copying"))

  v(5mm)

  text(tr(lang, "views"))
}

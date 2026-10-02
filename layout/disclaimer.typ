#import "/layout/fonts.typ": *

#let disclaimer(
  title: "",
  degree: "",
  author: "",
  submissionDate: none,
) = {
  set page(
    margin: (left: 30mm, right: 30mm, top: 40mm, bottom: 40mm),
    numbering: none,
    number-align: center,
  )

  set text(
    font: fonts.body, 
    size: 11pt, 
    lang: "en"
  )

  set par(leading: 1em, justify: true)

  // --- Disclaimer ---
  // Signature block at top
  text(size: 9pt, "." * 28)
  linebreak()
  text(weight: 400, author)
  linebreak()
  text([Graduate of #text(weight: 700, "School of Electrical and Computer Engineering, National Technical University of Athens")])

  v(1fr)

  let year = if submissionDate != none { str(submissionDate.year()) } else { "Year" }

  // Copyright notice
  text([Copyright #sym.copyright #text(weight: 700, underline(author + ", " + year))])
  linebreak()
  text("All rights reserved.")

  v(8mm)

  text("You may not copy, reproduce, distribute, publish, display, modify, create derivative works, transmit, or in any way exploit this thesis or part of it for commercial purposes. You may reproduce, store or distribute this thesis for non-profit educational or research purposes, provided that the source is cited, and the present copyright notice is retained. Inquiries for commercial use should be addressed to the original author.")

  v(5mm)

  text("The ideas and conclusions presented in this paper are the author's and do not necessarily reflect the official views of the National Technical University of Athens.")
}

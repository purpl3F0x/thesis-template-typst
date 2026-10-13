#import "/layout/fonts.typ": *
#import "/layout/i18n.typ": *

#let titlepage(
  title: "",
  titleGreek: "",
  degree: "",
  program: "",
  examiner: "",
  supervisors: (),
  author: "",
  startDate: none,
  submissionDate: none,
  division: "Division",
  committee: (),
  city: "Athens",
  lang: "en",
) = {
  
  set page(
    margin: (left: 25mm, right: 25mm, top: 20mm, bottom: 25mm),
    numbering: none,
    number-align: center,
  )

  set text(
    font: fonts.body,
    size: 11pt,
    lang: lang,
  )

  set par(leading: 1em)

  // --- Title Page (NTUA Format) ---

  // Header with logo and university info
  grid(
    columns: (45mm, 1fr),
    gutter: 0mm,
    align: center,
    align(center, image("/figures/ntua_logo.svg", width: 30mm)),
    align(left + horizon, block(width: 100%)[
      #set text(top-edge: 2pt)
      #text(font: fonts.sans, size: 12pt, tr(lang, "university"))

      #text(font: fonts.sans, size: 12pt, tr(lang, "school"))

      #text(size: 12pt, tr(lang, "division-prefix") + division)
    ]),
  )

  v(25mm)

  // Title of Thesis label
  align(center, text(font: fonts.sans, weight: 700, size: 16pt, underline(title)))

  v(10mm)

  // Degree label and Thesis Title
  align(center, text(font: fonts.sans, size: 16pt, weight: 700, tr(lang, "thesis")))

  v(10mm)

  // Author label and name
  align(center, text(font: fonts.sans, weight: 400, size: 14pt, underline(author)))

  v(20mm)

  // Supervisor section
  if supervisors.len() > 0 {
    let supervisor = supervisors.at(0)
    grid(
      columns: (auto, 1fr),
      column-gutter: 0.3em,
      row-gutter: 0.9em,
      text(size: 12pt, tr(lang, "supervisor")), text(size: 12pt, supervisor.at("name", default: "Full Name") + ","),
      [], text(size: 12pt, supervisor.at("status", default: "Status, University")),
    )
  }

  v(10mm)

  // Committee approval
  align(left, text(
    size: 10pt,
    tr(lang, "approved") + underline(day-month-year(submissionDate, lang)),
  ))

  v(8mm)

  // Signature lines for committee members (dotted)
  let committee_display = if committee.len() > 0 {
    committee
  } else {
    (
      (name: "Full name", status: "Status, University"),
      (name: "Full name", status: "Status, University"),
      (name: "Full name", status: "Status, University"),
    )
  }

  grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 10mm,
    ..committee_display.map(member => align(center, [
      #text(size: 10pt, "." * 36)
      #v(3mm)
      #text(size: 10pt, align(
        center,
        member.at("name", default: "Full name") + "\n" + member.at("status", default: "Status, University"),
      ))
    ]))
  )

  v(15mm)

  align(center, text(size: 11pt, city + ", " + month-year(submissionDate, lang)))
}

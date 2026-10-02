#import "/layout/fonts.typ": *

#let cover(
  title: "",
  degree: "",
  program: "",
  author: "",
  division: "Division",
  supervisors: (),
  submissionDate: none,
  city: "Athens",
) = {
  set page(
    margin: (left: 25mm, right: 25mm, top: 20mm, bottom: 25mm),
    numbering: none,
    number-align: center,
  )

  set text(
    font: fonts.body, 
    size: 11pt, 
    lang: "en"
  )
  
  set par(leading: 1em)

  // --- Cover (same as titlepage but without committee) ---
  
  // Header with logo and university info
  grid(
    columns: (45mm, 1fr),
    gutter: 0mm,
    align: center,
    align(center, image("/figures/ntua_logo.svg", width: 30mm)),
    align(left + horizon, block(width: 100%)[
      #set text(top-edge: 2pt)
      #text(font: fonts.sans, size: 12pt, "National Technical University of Athens")
      
      #text(font: fonts.sans, size: 12pt, "School of Electrical and Computer Engineering")
      
      #text(size: 12pt, "Division: " + division)
    ])
  )

  v(25mm)

  // Title of Thesis label
  align(center, text(font: fonts.sans, weight: 700, size: 16pt, underline(title)))
  
  v(10mm)

  // Degree label and Thesis Title
  align(center, text(font: fonts.sans, size: 16pt, weight: 700, "Diploma Thesis"))
  
  v(10mm)

  // Author label and name
  align(center, text(font: fonts.sans, weight: 400, size: 14pt, underline(author)))
  
  v(25mm)

  // Supervisor section
  if supervisors.len() > 0 {
    let supervisor = supervisors.at(0)
    grid(
      columns: (auto, 1fr),
      column-gutter: 0.3em,
      row-gutter: 0.9em,
      text(size: 12pt, "Supervisor: "),
      text(size: 12pt, supervisor.at("name", default: "Full Name") + ","),
      [],
      text(size: 12pt, supervisor.at("status", default: "Status, University"))
    )
  }

  v(25mm)

  let dateStr = if submissionDate != none { submissionDate.display("[month repr:long] [year]") } else { "Month Year" }
  align(center, text(size: 11pt, city + ", " + dateStr))
}
#import "/utils/formfield.typ": *
#import "/layout/fonts.typ": *

#let registrationCertificate(
  author: "",
  title: "",
  degree: "",
  program: "",
  examiner: "",
  startDate: datetime,
  submissionDate: datetime,
  currentDate: datetime,
  body,
) = {

  // Set the document's basic properties.
  set page(
    margin: (left: 20mm, right: 20mm, top: 20mm, bottom: 20mm),
  )

  // Set body font family.
  set text(
    font: fonts.body, 
    size: 12pt, 
    lang: "el"
  )

  align(
    right,
    stack(
      dir: ttb,
      spacing: 10pt,
      image("/figures/ntua_logo.svg", width: 15%),
      text(font: fonts.sans, weight: "bold", "Εθνικό Μετσόβιο Πολυτεχνείο")
    )
  )

  v(1.5cm)
  
  let degreeLabel = if degree == "Bachelor" { "πτυχιακής" } else { "διπλωματικής" }
  align(left, text(font: fonts.sans, 1.3em, weight: "bold", "Βεβαίωση εγγραφής της " + degreeLabel + " εργασίας"))

  grid(
    columns: 2,
    row-gutter: 10mm,
    column-gutter: 6mm,
    formField("Όνομα/επώνυμο φοιτητή/τριας", author, length: 90%),
    formField("Πρόγραμμα σπουδών", program, length: 90%),
    formField("Τίτλος εργασίας", title, length: 90%)
  )

  v(1.5cm)

  "Με το παρόν βεβαιώνουμε ότι ο/η υποψήφιος/α έχει εγγραφεί στις " + startDate.display("[day].[month].[year]") + " για τη " + degreeLabel + " εργασία. \n"
  body

  v(1.5cm)

  grid(
    columns: 2,
    column-gutter: 2cm,
    formField("Ημερομηνία", currentDate.display("[day].[month].[year]"), length: 90%),
    formField(examiner, " ", length: 90%)
  )
}

#import "/layout/lab_report_template.typ": *

#import "@preview/codelst:2.0.2": codelst, sourcecode, sourcefile
#import "@preview/showybox:2.0.3": showybox


#let my_sourcefile(file, lang: auto, ..args) = {
  showybox(
    frame: (
      body-color: rgb(245, 245, 245), // Light background (like VSCode light theme)
      border-color: rgb("#333"), // Light gray border
      title-color: rgb(200, 200, 200), // Darker gray title for contrast
      radius: 1pt, // Rounded corners
      thickness: 0.4pt, // Thin border for a clean look
    ),
    breakable: true,
    width: 100%, // Fill the available width
    align: center,
    title: grid(
      columns: (1fr, 1fr),
      // Two equal-width columns for title and language
      // gutter: 1em,
      // Space between columns
      text(
        font: "DejaVu Sans Mono", // Monospaced font for code
        size: 9pt,
        fill: rgb(42, 42, 42), // Dark gray title text
        weight: 600,
        file.split("/").at(-1),
      ),
    ),
  )[
    #set text(size: 9pt, font: "DejaVu Sans Mono", fill: rgb(10, 10, 10)) // Black text for the code
    #sourcefile(read(file), file: file, lang: lang, ..args, frame: none)
  ]
}

#lab_report(
  title: "Title of the Lab Report",
  teachers: ("Teacher 1", "Teacher 2"),
  author: ("Author0 - AM el676767", "Author1 - AM el424242"), // For 1 author pass a string so the template changes "του φοιτητή" instead of "των φοιτητών"
  submissionDate: datetime.today(),
  division: "Τμήμα (αφήστε κενό για αποκρυψη)",
  city: "Αθήνα",
  class: "Μάθημα",
  {
    "Hello Darkness my old friend"
    my_sourcefile("./lab_report.typ")
  },
)


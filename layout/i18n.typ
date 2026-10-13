// Texts of the template in English ("en") and Greek ("el").
// The language is chosen with `language` in metadata.typ.

#let strings = (
  en: (
    // cover, title page, copyright page
    university: "National Technical University of Athens",
    school: "School of Electrical and Computer Engineering",
    division-prefix: "Division: ",
    thesis: "Diploma Thesis",
    supervisor: "Supervisor: ",
    approved: "Approved by the three-member scientific committee on ",
    graduate: [Graduate of #text(weight: 700, "School of Electrical and Computer Engineering, National Technical University of Athens")],
    rights: "All rights reserved.",
    copying: "You may not copy, reproduce, distribute, publish, display, modify, create derivative works, transmit, or in any way exploit this thesis or part of it for commercial purposes. You may reproduce, store or distribute this thesis for non-profit educational or research purposes, provided that the source is cited, and the present copyright notice is retained. Inquiries for commercial use should be addressed to the original author.",
    acknowledgement: "Acknowledgements",
    views: "The ideas and conclusions presented in this paper are the author's and do not necessarily reflect the official views of the National Technical University of Athens.",
    // main text
    contents: "Contents",
    chapter: "Chapter",
    figure: "Figure",
    table: "Table",
    list-of-figures: "List of Figures",
    list-of-tables: "List of Tables",
    appendix: "Appendix A: Supplementary Material",
    bibliography: "Bibliography",
    quotes: (single: ("‘", "’"), double: ("“", "”")),
  ),
  el: (
    // cover, title page, copyright page: the texts of the thesis template of
    // the School library (lib.ece.ntua.gr/files/theses_templates/thesis_template_gr.pdf)
    university: "Εθνικό Μετσόβιο Πολυτεχνείο",
    school: "Σχολή Ηλεκτρολόγων Μηχανικών και Μηχανικών Υπολογιστών",
    // in Greek the division is written in full, e.g. "Τομέας Ηλεκτρικής Ισχύος"
    division-prefix: "",
    thesis: "Διπλωματική Εργασία",
    supervisor: "Επιβλέπων: ",
    approved: "Εγκρίθηκε από την τριμελή εξεταστική επιτροπή την ",
    graduate: [Διπλωματούχος Ηλεκτρολόγος Μηχανικός και Μηχανικός Υπολογιστών Ε.Μ.Π.],
    rights: "Με επιφύλαξη παντός δικαιώματος. All rights reserved.",
    copying: "Απαγορεύεται η αντιγραφή, αποθήκευση και διανομή της παρούσας εργασίας, εξ ολοκλήρου ή τμήματος αυτής, για εμπορικό σκοπό. Επιτρέπεται η ανατύπωση, αποθήκευση και διανομή για σκοπό μη κερδοσκοπικό, εκπαιδευτικής ή ερευνητικής φύσης, υπό την προϋπόθεση να αναφέρεται η πηγή προέλευσης και να διατηρείται το παρόν μήνυμα. Ερωτήματα που αφορούν τη χρήση της εργασίας για κερδοσκοπικό σκοπό πρέπει να απευθύνονται προς τον συγγραφέα.",
    acknowledgement: "Ευχαριστίες",
    views: "Οι απόψεις και τα συμπεράσματα που περιέχονται σε αυτό το έγγραφο εκφράζουν τον συγγραφέα και δεν πρέπει να ερμηνευθεί ότι αντιπροσωπεύουν τις επίσημες θέσεις του Εθνικού Μετσόβιου Πολυτεχνείου.",
    // main text
    contents: "Περιεχόμενα",
    chapter: "Κεφάλαιο",
    figure: "Σχήμα",
    table: "Πίνακας",
    list-of-figures: "Κατάλογος Σχημάτων",
    list-of-tables: "Κατάλογος Πινάκων",
    appendix: "Παράρτημα Α: Συμπληρωματικό Υλικό",
    bibliography: "Βιβλιογραφία",
    quotes: (single: ("‘", "’"), double: ("«", "»")),
  ),
)

#let tr(lang, key) = strings.at(lang, default: strings.en).at(key)

// Typst prints month names only in English, so the Greek ones are listed here.
#let months-el = ("Ιανουάριος", "Φεβρουάριος", "Μάρτιος", "Απρίλιος", "Μάιος", "Ιούνιος",
  "Ιούλιος", "Αύγουστος", "Σεπτέμβριος", "Οκτώβριος", "Νοέμβριος", "Δεκέμβριος")
#let months-el-gen = ("Ιανουαρίου", "Φεβρουαρίου", "Μαρτίου", "Απριλίου", "Μαΐου", "Ιουνίου",
  "Ιουλίου", "Αυγούστου", "Σεπτεμβρίου", "Οκτωβρίου", "Νοεμβρίου", "Δεκεμβρίου")

// "January 2025" / "Ιανουάριος 2025"
#let month-year(date, lang) = {
  if date == none { return if lang == "el" { "Μήνας Έτος" } else { "Month Year" } }
  if lang == "el" { months-el.at(date.month() - 1) + " " + str(date.year()) }
  else { date.display("[month repr:long] [year]") }
}

// "01 01 2025" / "1η Ιανουαρίου 2025" (as in the template of the School library)
#let day-month-year(date, lang) = {
  if date == none { return "" }
  if lang == "el" { str(date.day()) + "η " + months-el-gen.at(date.month() - 1) + " " + str(date.year()) }
  else { date.display("[day] [month] [year]") }
}

// Enter your thesis data here:
// Language of the thesis: "en" (English) or "el" (Greek). It sets the
// hyphenation, the quotation marks and the labels (Chapter/Κεφάλαιο,
// Figure/Σχήμα, Table/Πίνακας, Contents/Περιεχόμενα ...), and the cover,
// title page and copyright page. With "el" the cover shows titleGreek;
// write the names, division and location below in the same language.
#let language = "en"
#let titleEnglish = "Your Thesis Title Here"
#let titleGreek = "Ο Τίτλος της Διπλωματικής σας Εργασίας"
#let degree = "Master"
#let program = "Electrical and Computer Engineering"
#let examiner = "Professor"
#let supervisors = ((name: "Supervisor Name", status: "Associate Professor, NTUA"),)
#let author = "Your Name"
#let division = "Telecommunications and Information Technology"
#let committee = (
  (name: "Committee Chair", status: "Professor, NTUA"),
  (name: "Committee Member 2", status: "Associate Professor, NTUA"),
  (name: "Committee Member 3", status: "Assistant Professor, NTUA"),
)
#let location = "Athens"
#let startDate = datetime(day: 1, month: 9, year: 2024)
#let submissionDate = datetime(day: 1, month: 1, year: 2025)
#let feedbacklogSubmissionDate = datetime.today()
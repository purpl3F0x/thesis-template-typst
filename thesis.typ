#import "/layout/thesis_template.typ": *
#import "/metadata.typ": *

#set document(title: titleEnglish, author: author, keywords: keywordsEnglish)

#show: thesis.with(
  title: titleEnglish,
  titleGreek: titleGreek,
  degree: degree,
  program: program,
  examiner: examiner,
  supervisors: supervisors,
  author: author,
  submissionDate: submissionDate,
  is_print: true,
  abstract_en: include "/content/abstract_en.typ",
  abstract_el: include "/content/abstract_el.typ",
  keywords_en: keywordsEnglish,
  keywords_el: keywordsGreek,
  extended_abstract_el: include "/content/extended_abstract_el.typ",
  acknowledgement: include "/content/acknowledgement.typ",
  division: division,
  committee: committee,
  city: location,
)

#include "/content/introduction.typ"
#include "/content/background.typ"
#include "/content/related_work.typ"
#include "/content/requirements.typ"
#include "/content/system_design.typ"
#include "/content/evaluation.typ"
#include "/content/summary.typ"
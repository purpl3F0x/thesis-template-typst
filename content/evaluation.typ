#import "/utils/todo.typ": TODO
#import "/utils/diagram.typ": diagram
#import "@preview/lilaq:0.6.0" as lq

= Case Study / Evaluation
#TODO[
  If you did an evaluation / case study, describe it here.
]

== Design 
#TODO[
  Describe the design / methodology of the evaluation and why you did it like that. e.g. what kind of evaluation have you done (e.g. questionnaire, personal interviews, simulation, quantitative analysis of metrics), what kind of participants, what kind of questions, what was the procedure?
]

== Objectives
#TODO[
  Derive concrete objectives / hypotheses for this evaluation from the general ones in the introduction.
]

== Results
#TODO[
  Summarize the most interesting results of your evaluation (without interpretation). Additional results can be put into the appendix.
]

@fig:example-plot shows an example plot created with Lilaq.

#let users = lq.linspace(0, 100, num: 21)
#diagram(
  lq.diagram(
    width: 11cm,
    height: 6.5cm,
    xlabel: [Concurrent users],
    ylabel: [Response time (ms)],
    legend: (position: top + left),
    lq.plot(users, users.map(u => 20 + 0.012 * u * u), label: [Baseline]),
    lq.plot(users, users.map(u => 18 + 0.4 * u), label: [Proposed system]),
  ),
  caption: [Example plot: response time of the baseline and the proposed system under increasing load.],
  short-caption: [Example plot: response time under load],
) <fig:example-plot>

== Findings
#TODO[
  Interpret the results and conclude interesting findings
]

== Discussion
#TODO[
  Discuss the findings in more detail and also review possible disadvantages that you found
]

== Limitations
#TODO[
  Describe limitations and threats to validity of your evaluation, e.g. reliability, generalizability, selection bias, researcher bias
]
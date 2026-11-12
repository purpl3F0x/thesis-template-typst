#import "/utils/todo.typ": TODO

= Background
#TODO[
  Describe each proven technology / concept shortly that is important to understand your thesis. Point out why it is interesting for your thesis. Make sure to incorporate references to important literature here.
]

== e.g. User Feedback
#TODO[
  This section would summarize the concept User Feedback using definitions, historical overviews and pointing out the most important aspects of User Feedback.
]

== e.g. Representational State Transfer
#TODO[
  This section would summarize the architectural style Representational State Transfer (REST) using definitions, historical overviews and pointing out the most important aspects of the architecture.
]

== e.g. Scrum
#TODO[
  This section would summarize the agile method Scrum using definitions, historical overviews and pointing out the most important aspects of Scrum.
]

== e.g. Mathematical Model
// Equation examples: keep what you need and delete the rest.
Inline math is written between dollar signs without spaces, e.g. $T_1 = 1.25 (t_90 - t_10)$, and units as text after a thin space, e.g. $I_0 = 10 thin "kA"$. A display equation has spaces inside the dollar signs. It is numbered, and a label after it lets you refer to it: @eq:heidler is the Heidler function, a common model of the lightning current.

$ i(t) = I_0 / eta (t \/ tau_1)^n / (1 + (t \/ tau_1)^n) e^(-t \/ tau_2) $ <eq:heidler>

An equation that should not be numbered is written with `math.equation`:

#math.equation(block: true, numbering: none, $ e^(j pi) + 1 = 0 $)

Several lines are aligned at `&` and separated with `\`. For the double-exponential current $i(t) = I_0 (e^(-alpha t) - e^(-beta t))$ the total charge is

$ Q &= integral_0^oo i(t) dif t = I_0 integral_0^oo (e^(-alpha t) - e^(-beta t)) dif t \
    &= I_0 (1 / alpha - 1 / beta) = I_0 (beta - alpha) / (alpha beta). $ <eq:charge>

Piecewise definitions use `cases`, as in @eq:step, matrices use `mat`, as in @eq:impedance, and sums, roots and text inside an equation are written as in @eq:rms:

$ u(t) = cases(
  0 & "if" t < 0,
  U_0 (1 - e^(-t \/ tau)) & "if" t >= 0,
) $ <eq:step>

$ mat(V_1; V_2) = mat(Z_11, Z_12; Z_21, Z_22) mat(I_1; I_2) $ <eq:impedance>

$ I_"rms" = sqrt(1 / N sum_(k=1)^N i_k^2) $ <eq:rms>

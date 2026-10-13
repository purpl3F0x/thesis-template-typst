// Examples of equations, matrices and tables in Typst.
// Each example shows its code in a grey box and the result right below it.
// It is a separate document; the thesis does not use it.
//
//   typst compile math_examples.typ
//
// Works with Typst 0.12 and newer.
#import "/layout/fonts.typ": *

#set document(title: "Equations, matrices and tables in Typst")
#set page(paper: "a4", margin: (x: 22mm, y: 20mm), numbering: "1", number-align: center)
#set text(font: fonts.body, size: 11pt, lang: "en")
#set par(justify: true)
#set heading(numbering: "1.")
#show heading: set block(above: 1.6em, below: 0.9em)

// Equations are numbered per section, (1.1), (1.2), ... as in the thesis.
#set math.equation(numbering: n => numbering("(1.1)", counter(heading).get().first(), n))
#show heading.where(level: 1): it => {
  counter(math.equation).update(0)
  it
}

#show raw.where(block: true): set text(size: 9pt)

// One example: an optional introduction, the code (grey) and, below it, the
// result of that code, kept together on one page.
#let example(code, intro: none, breakable: false) = block(breakable: breakable, width: 100%, above: 1em, below: 1.3em, {
  if intro != none { block(width: 100%, below: 0.8em, intro) }
  block(width: 100%, fill: luma(245), stroke: (left: 2pt + luma(180)), inset: (x: 8pt, y: 6pt), below: 0pt,
    raw(code.text, lang: "typ", block: true))
  block(width: 100%, stroke: (left: 2pt + rgb("#3d7a5a")), inset: (x: 10pt, y: 8pt), above: 0pt,
    eval(code.text, mode: "markup"))
})

#align(center)[
  #text(size: 18pt, weight: 700)[Equations, matrices and tables in Typst]
  #v(0.2em)
  Examples for the thesis template. Each grey box is the code; the result is right below it. \
  Copy what you need into your thesis.
]

#outline(depth: 1, indent: 1em)

= Inline and display equations

#example(intro: [Math is written between dollar signs. Without spaces inside the dollar signs it stays in the line; with spaces it becomes a display equation on its own line, which gets a number.], ```
Inline: $a^2 + b^2 = c^2$. Display:
$ a^2 + b^2 = c^2 $
```)

#example(intro: [A label after the equation lets you refer to it with `@`. The reference prints the word and the number.], ```
$ E = m c^2 $ <eq:einstein>
As @eq:einstein shows, mass and energy are equivalent.
```)

#example(intro: [An equation that should not get a number:], ```
#math.equation(block: true, numbering: none, $ e^(i pi) + 1 = 0 $)
```)

#example(intro: [The numbering, the word used in references and the position of the number are parameters of `math.equation`. A `set` rule changes them from that point on; inside a block like here, only for that block.], ```
#set math.equation(numbering: "(a)", supplement: [Eq.])
$ x + y = 1 $ <eq:local>
Now the reference reads @eq:local.
```)

#example(```
#set math.equation(numbering: "(1)", number-align: left)
$ y = a x + b $
```)

= Letters, symbols and text

#example(intro: [Greek letters and symbols are written by name. Variants follow a dot.], ```
$ alpha, beta, gamma, delta, epsilon, epsilon.alt, theta, theta.alt, lambda, mu, pi, rho, sigma, tau, phi, phi.alt, omega $
$ Gamma, Delta, Theta, Lambda, Pi, Sigma, Phi, Psi, Omega $
```)

#example(```
$ x != y, quad x <= y, quad x >= y, quad x approx y, quad x prop y, quad x tilde.equiv y $
$ A subset.eq B, quad x in A, quad x in.not B, quad forall x exists y, quad A => B, quad A <=> B $
$ x -> oo, quad f: A -> B, quad x |-> x^2, quad nabla, quad partial, quad dots.c, quad times, quad dot.op $
```)

#example(intro: [Text inside math goes between quotes. Letters in other styles:], ```
$ v = "distance" / "time", quad P_"loss" = R I^2, quad T_"rise", quad P_"απώλειες" = R I^2 $
$ bold(F) = m bold(a), quad upright(d) x, quad bb(R), quad cal(L), quad frak(g), quad sans(A), quad mono(x) $
```)

#example(intro: [Accents, primes, lines and braces:], ```
$ hat(x), quad tilde(x), quad macron(x), quad dot(x), quad dot.double(x), quad arrow(v), quad overline(z), quad underline(w) $
$ f'(x), quad f''(x), quad (cancel(2) x) / cancel(2) = x $
$ underbrace(1 + 1 + dots.c + 1, n "times") = n, quad overbrace(a + b + c, "sum") $
```)

#example(intro: [Spacing: `thin`, `med`, `thick`, `quad`, `wide`, or any length with `#h`.], ```
$ a thin b med c thick d quad e wide f #h(2cm) g $
$ integral_0^1 f(x) thin dif x $
```)

= Fractions, roots, indices and large operators

#example(```
$ a / b, quad frac(a + 1, b), quad (a + b) / (c + d), quad a \/ b, quad binom(n, k) $
$ sqrt(x), quad root(3, x), quad x^(2 n), quad x_(i j), quad x_i^2, quad e^(-t \/ tau) $
```)

#example(intro: [Limits are placed above and below in display equations and beside in the text.], ```
$ sum_(k=1)^n k = (n (n + 1)) / 2, quad product_(i=1)^n x_i, quad integral_0^oo e^(-x) dif x = 1, quad integral.double_S f dif S, quad integral.cont_C bold(E) dot.op dif bold(l) $
$ lim_(x -> 0) (sin x) / x = 1, quad max_i a_i, quad op("argmin", limits: #true)_(x in RR) f(x) $
In the text: $sum_(k=1)^n k$ and $lim_(x -> 0) f(x)$.
```)

#example(intro: [Indices in any corner, and control of where they go:], ```
$ attach(X, t: a, b: b, tl: c, bl: d, tr: e, br: f), quad scripts(sum)_(k=1)^n, quad limits(A)_(i=1)^n $
$ display(sum_k x_k) "versus" inline(sum_k x_k) $
```)

= Brackets and delimiters

#example(intro: [Brackets grow with their content. `lr` sets their size explicitly, `mid` makes a bar in the middle grow too.], ```
$ (a / b), quad [a / b], quad {a / b}, quad lr(( a / b ), size: #150%) $
$ abs(x), quad norm(bold(v)), quad floor(x), quad ceil(x), quad round(x) $
$ lr(⟨ psi mid(|) phi ⟩), quad lr({ x mid(|) x > 0 }) $
```)

= Several lines and alignment

#example(intro: [`\` starts a new line and `&` marks the point where the lines are aligned. The whole block gets one number.], ```
$ f(x) &= (x + 1)^2 \
       &= x^2 + 2 x + 1 $
```)

#example(intro: [A second `&&` adds a column, for example for comments:], ```
$ Q &= integral_0^oo i(t) dif t && "definition" \
    &= I_0 (1 / alpha - 1 / beta) && "for" i(t) = I_0 (e^(-alpha t) - e^(-beta t)) $
```)

#example(```
$ x &= 1 & quad y &= 2 \
  z &= 3 & quad w &= 4 $
```)

#example(intro: [Cases, with their parameters:], ```
$ f(x) = cases(
  x^2 & "if" x >= 0,
  -x  & "otherwise",
) $
$ cases(x + y = 2, x - y = 0, delim: "[", gap: #1em) $
$ cases(reverse: #true, 1 "for" x > 0, 0 "for" x <= 0) = H(x) $
```)

= Matrices and vectors

#example(intro: [Elements are separated with `,` and rows with `;`.], ```
$ mat(1, 2; 3, 4), quad mat(delim: "[", 1, 2; 3, 4), quad mat(delim: "|", a, b; c, d) = a d - b c $
$ vec(x, y, z), quad vec(1, 2, delim: "["), quad mat(a_11, dots.c, a_(1 n); dots.v, dots.down, dots.v; a_(m 1), dots.c, a_(m n)) $
```)

#example(intro: [Lines inside the matrix (`augment`), spacing (`gap`) and alignment (`align`):], ```
$ mat(1, 0, 2; 0, 1, 3; augment: #2), quad mat(1, 2; 3, 4; augment: #(hline: 1, vline: 1)) $
$ mat(1, 2; 3, 4; gap: #1em), quad mat(10, 2; 3, 400; align: #right) $
$ #math.mat((1, 2), (3, 4), row-gap: 0.4em, column-gap: 2em) $
```)

= Variables, functions and loops

#example(intro: [Values from code are put into math with `#`. Here they are computed, rounded and printed with a decimal comma.], ```
#let U = 230
#let R = 47
#let num(x, digits: 2) = str(calc.round(x, digits: digits)).replace(".", ",")
$ I = U / R = #U / #R approx #num(U / R) thin "A" $
```)

#example(intro: [A function with parameters that returns an equation:], ```
#let heidler(I0: $I_0$, n: $n$) = $ i(t) = #I0 / eta (t \/ tau_1)^#n / (1 + (t \/ tau_1)^#n) e^(-t \/ tau_2) $
#heidler()
#heidler(I0: $10 thin "kA"$, n: 10)
```)

#example(intro: [Terms of a series made in a loop:], ```
#let term(k) = if k == 0 { $1$ } else if k == 1 { $x$ } else { $x^#k / #k!$ }
#let taylor(n) = $ e^x approx #range(n + 1).map(term).join($+$) + dots.c $
#taylor(4)
```)

#example(intro: [Matrices made from data or by a function:], ```
#let identity(n) = math.mat(..range(n).map(i => range(n).map(j => if i == j { 1 } else { 0 })))
#let A = ((2, 1), (5, 3))
#let det2(m) = m.at(0).at(0) * m.at(1).at(1) - m.at(0).at(1) * m.at(1).at(0)
$ I_4 = #identity(4), quad det #math.mat(..A) = #det2(A) $
```)

#example(intro: [A `show` rule changes how every equation after it looks:], ```
#show math.equation: set text(fill: rgb("#1d4e89"))
#show math.equation.where(block: true): set block(above: 1.5em, below: 1.5em)
$ F = m a $
```)

#block(breakable: false)[
The per-chapter numbering of this document, (1.1), (1.2), …, is made with these lines at the top of the file:

```typ
#set math.equation(numbering: n => numbering("(1.1)", counter(heading).get().first(), n))
#show heading.where(level: 1): it => {
  counter(math.equation).update(0)
  it
}
```
]

= Tables

#example(intro: [A table with a header row. Cells hold text or math.], ```
#table(
  columns: 3,
  table.header[*Quantity*][*Symbol*][*Unit*],
  [Current], $I$, [A],
  [Voltage], $U$, [V],
  [Resistance], $R$, $Omega$,
)
```)

#example(intro: [Column widths and alignment, lines, background and spacing are parameters. `fill` can be a function of the column `x` and the row `y`, here for alternating rows.], ```
#table(
  columns: (auto, 1fr, 1fr),
  align: (left, center, center),
  stroke: 0.5pt + gray,
  fill: (x, y) => if y == 0 { luma(225) } else if calc.even(y) { luma(245) },
  inset: 6pt,
  table.header[*Stroke*][*$T_1$ (μs)*][*$T_2$ (μs)*],
  [First], [10], [350],
  [Subsequent], [0.25], [100],
  [Switching], [250], [2500],
)
```)

#example(intro: [Merged cells (`colspan`, `rowspan`) and extra lines:], ```
#table(
  columns: 4,
  align: center + horizon,
  table.header(
    table.cell(rowspan: 2)[*Parameter*], table.cell(colspan: 3)[*Test*],
    [*1*], [*2*], [*3*],
  ),
  table.hline(stroke: 1.5pt),
  [$I_"peak"$ (kA)], [10], [20], [30],
  [$T_1$ (μs)], [1.2], [1.3], [1.2],
)
```)

#example(intro: [A table made from data, with a column computed in code:], ```
#let data = ((10, 2), (20, 4), (30, 7))
#table(
  columns: 3,
  align: right,
  table.header[$U$ (V)][$I$ (A)][$R = U \/ I$ ($Omega$)],
  ..data.map(row => ([#row.at(0)], [#row.at(1)], [#calc.round(row.at(0) / row.at(1), digits: 2)])).flatten(),
)
```)

#example(intro: [In a figure the table gets a caption, a number and a label. The `show` rule puts the caption above it, as is usual for tables.], ```
#show figure.where(kind: table): set figure.caption(position: top)
#figure(
  table(columns: 2, [$a$], [$b$], [$c$], [$d$]),
  caption: [A table with its caption on top.],
) <tab:example>
@tab:example is referenced like an equation.
```)

= Numbers and units

#example(intro: [Units are written as text after a thin space. A comma inside math is followed by a space, so for a decimal comma write it as `#[,]`, or use a function like `num` in Section 7.], ```
$I = 10 thin "kA"$, $T_1 = 1.2 thin "μs"$, $q = 1.6 times 10^(-19) thin "C"$, $f = 50 thin "Hz"$ \
$1,25$ (with a space) and $1#[,]25$ (decimal comma)
```)

= Where to find more

All symbols, with their names, are listed at #link("https://typst.app/docs/reference/symbols/sym/")[typst.app/docs/reference/symbols/sym], and every function used here, with all its parameters, at #link("https://typst.app/docs/reference/math/")[typst.app/docs/reference/math] and #link("https://typst.app/docs/reference/model/table/")[typst.app/docs/reference/model/table].

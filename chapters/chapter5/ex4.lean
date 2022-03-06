/-
Give a natural deduction proof of 𝑃 from ¬𝑃→(𝑄∨𝑅), ¬𝑄, and ¬𝑅.
-/

open classical

variables (P Q R: Prop)

variable h: ¬ P → (Q ∨ R)
variable hnQ: ¬ Q
variable hnR: ¬ R

example : P :=
  show P, from by_contradiction(
    assume hnP: ¬ P,
    have hQoR: Q ∨ R, from h(hnP),
    show false, from or.elim(hQoR)(
      assume hQ: Q, hnQ(hQ)
    )(
      assume hR: R, hnR(hR)
    )
  )
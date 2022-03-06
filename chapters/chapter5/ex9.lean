/-
open classical
variables {A B C : Prop}

example (h : ¬ B → ¬ A) : A → B :=
sorry

example (h : A → B) : ¬ A ∨ B :=
sorry
-/

open classical
variables {A B C : Prop}

example (h : ¬ B → ¬ A) : A → B :=
  assume hA: A,
  show B, from (
    by_contradiction(
      assume hnB: ¬ B,
      have hnA: ¬ A, from h(hnB),
      show false, from hnA(hA)
    )
  )

example (h : A → B) : ¬ A ∨ B :=
  or.elim(em(A))(
    λ hA: A,
    have B, from h(hA),
    show ¬ A ∨ B, from or.inr this
  )(
    assume : ¬ A, or.inl this
  )
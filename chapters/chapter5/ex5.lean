/-
Give a natural deduction proof of ¬𝐴∨𝐵 from 𝐴→𝐵.
You may use the law of the excluded middle.
-/

open classical

variables (A B: Prop)

example (h: A → B) : ¬ A ∨ B :=
  or.elim(em(A))(
    λ hA: A,
    have hB: B, from h(hA),
    show ¬ A ∨ B, from or.inr(hB)
  )(
    λ hnA: ¬ A,
    show ¬ A ∨ B, from or.inl(hnA)
  )

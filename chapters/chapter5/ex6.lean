/-
Give a natural deduction proof of 𝐴→((𝐴∧𝐵)∨(𝐴∧¬𝐵)).
You may use the law of the excluded middle.
-/

open classical

example (A B: Prop):  A → ((A ∧ B)∨(A ∧ ¬B)) :=
  λ hA: A,
  or.elim(em(B))(
    λ hB: B,
    have hAB: A ∧ B, from ⟨hA, hB⟩,
    show (A ∧ B)∨(A ∧ ¬B), from  or.inl hAB
  )(
    λ hnB: ¬ B,
    have hAnB: A ∧ ¬B, from ⟨hA, hnB⟩,
    show (A ∧ B)∨(A ∧ ¬B), from  or.inr hAnB
  )
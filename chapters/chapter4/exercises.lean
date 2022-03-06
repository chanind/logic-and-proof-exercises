/-
Prove the following in Lean:

variables A B C D : Prop

example : A ∧ (A → B) → B :=
sorry

example : A → ¬ (¬ A ∧ B) :=
sorry

example : ¬ (A ∧ B) → (A → ¬ B) :=
sorry

example (h₁ : A ∨ B) (h₂ : A → C) (h₃ : B → D) : C ∨ D :=
sorry

example (h : ¬ A ∧ ¬ B) : ¬ (A ∨ B) :=
sorry

example : ¬ (A ↔ ¬ A) :=
sorry
-/

variables A B C D : Prop

example : A ∧ (A → B) → B :=
λ h: A ∧ (A → B),
have hA: A, from and.elim_left h,
have A → B, from and.elim_right h,
show B, from this hA

example : A → ¬ (¬ A ∧ B) :=
assume hA: A,
assume hnAB: ¬ A ∧ B,
show false, from (
  have hnA: ¬ A, from and.elim_left hnAB,
  hnA(hA)
)

example : ¬ (A ∧ B) → (A → ¬ B) :=
  assume h:  ¬ (A ∧ B),
  assume hA: A,
  assume hB: B,
  show false, from (
    have hAB: A ∧ B, from ⟨ hA, hB ⟩,
    h(hAB)
  )

example (h₁ : A ∨ B) (h₂ : A → C) (h₃ : B → D) : C ∨ D :=
or.elim(h₁)(
  assume hA, or.inl(h₂(hA))
)(
  assume hB, or.inr(h₃(hB))
)

example (h : ¬ A ∧ ¬ B) : ¬ (A ∨ B) :=
have hnA: ¬ A, from and.elim_left(h),
have hnB: ¬ B, from and.elim_right(h),
assume hAoB: A ∨ B,
show false, from (
  or.elim(hAoB)(
    assume hA, hnA(hA)
  )(
    assume hB, hnB(hB)
  )
)

example : ¬ (A ↔ ¬ A) :=
assume h: A ↔ ¬ A,
show false, from (
  have hAtnA: A → ¬ A, from  iff.mp(h),
  have hnAtA: ¬ A → A, from  iff.mpr(h),
  have hnA: ¬ A, from (
    assume hA: A,
    show false, from hAtnA(hA)(hA)
  )
  have hA: A, from hnAtA(hnA),
  hnA(hA)
)
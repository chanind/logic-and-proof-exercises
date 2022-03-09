/-
Fill in the sorry.

section
  variable U : Type
  variables A B : U → Prop

  example : (∀ x, A x ∧ B x) → ∀ x, A x :=
  sorry
end
-/

section
  variable U : Type
  variables A B : U → Prop

  example : (∀ x, A x ∧ B x) → ∀ x, A x :=
  assume h: (∀ x, A(x) ∧ B(x)),
  assume x: U,
  have hAxBx: A(x) ∧ B(x), from h(x),
  show A(x), from and.elim_left(hAxBx)
end
/-
Fill in the sorry.

section
  variable U : Type
  variables A B : U → Prop

  variable h1 : ∀ x, A x → B x
  variable h2 : ∃ x, A x

  example : ∃ x, B x :=
  sorry
end
-/

section
  variable U : Type
  variables A B : U → Prop

  variable h1 : ∀ x, A x → B x
  variable h2 : ∃ x, A x

  example : ∃ x, B x :=
  exists.elim(h2) $
  assume (x: U) (hAx: A(x)),
  have hBx: B(x), from h1 x hAx,
  show ∃ x, B x, from exists.intro(x)(hBx)
end
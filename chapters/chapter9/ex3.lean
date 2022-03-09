/-
Fill in the sorry.

section
  variable U : Type
  variables A B C : U → Prop

  variable h1 : ∀ x, A x ∨ B x
  variable h2 : ∀ x, A x → C x
  variable h3 : ∀ x, B x → C x

  example : ∀ x, C x :=
  sorry
end
-/

section
  variable U : Type
  variables A B C : U → Prop

  variable h1 : ∀ x, A x ∨ B x
  variable h2 : ∀ x, A x → C x
  variable h3 : ∀ x, B x → C x

  example : ∀ x, C x :=
  assume x: U,
  have hAxoBx: A(x) ∨ B(x), from h1(x),
  show C(x), from or.elim(hAxoBx)(
    λ hAx: A(x),
    show C(x), from h2 x hAx
  )(
    λ hBx: B(x),
    show C(x), from h3 x hBx
  )
end
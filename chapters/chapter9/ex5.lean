/-
Fill in the sorry.

section
  variable U : Type
  variables A B : U → Prop

  example : (∃ x, A x) → ∃ x, A x ∨ B x :=
  sorry
end
-/

section
  variable U : Type
  variables A B : U → Prop

  example : (∃ x, A x) → ∃ x, A x ∨ B x :=
  assume h: (∃ x, A x),
  exists.elim(h)(
    assume (x: U) (hAx: A(x)),
    have hAxoBx: A(x) ∨ B(x), from or.inl(hAx),
    show ∃ x, A x ∨ B x, from exists.intro(x)(hAxoBx)
  )
end
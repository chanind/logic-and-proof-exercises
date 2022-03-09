/-
Fill in the sorry.

variable  U : Type
variables A B C : U → Prop

example (h1 : ∃ x, A x ∧ B x) (h2 : ∀ x, B x → C x) :
    ∃ x, A x ∧ C x :=
sorry
-/

variable  U : Type
variables A B C : U → Prop

example (h1 : ∃ x, A x ∧ B x) (h2 : ∀ x, B x → C x) : ∃ x, A x ∧ C x :=
  exists.elim(h1) $
    assume (x: U) (hAxBx: A(x) ∧ B(x)),
    have hBxtoCx: B(x) → C(x), from h2(x),
    have hCx: C(x), from hBxtoCx(and.elim_right(hAxBx)),
    have hAxCx: A(x) ∧ C(x), from ⟨and.elim_left(hAxBx), hCx⟩,
    show  ∃ x, A x ∧ C x, from exists.intro(x)(hAxCx)
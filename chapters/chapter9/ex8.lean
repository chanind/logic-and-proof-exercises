/-
Complete these proofs.

variable  U : Type
variables A B C : U → Prop

example : (¬ ∃ x, A x) → ∀ x, ¬ A x :=
sorry

example : (∀ x, ¬ A x) → ¬ ∃ x, A x :=
sorry
-/

variable  U : Type
variables A B C : U → Prop

example : (¬ ∃ x, A x) → ∀ x, ¬ A x :=
assume hNotExistsAx: (¬ ∃ x, A x),
assume x: U,
assume hAx: A(x),
show false, from (
  have hExistsAx: ∃ x, A x,
  from exists.intro(x)(hAx),
  hNotExistsAx(hExistsAx)
)

example : (∀ x, ¬ A x) → ¬ ∃ x, A x :=
assume hNeverA: (∀ x, ¬ A x),
assume hExistAx: ∃ x, A x,
show false, from (
  exists.elim(hExistAx)(
    assume (x: U) (hAx: A(x)),
    have hnAx: ¬ A(x), from hNeverA(x),
    hnAx(hAx)
  )
)

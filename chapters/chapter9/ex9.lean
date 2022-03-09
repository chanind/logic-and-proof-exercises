/-
Fill in the sorry.

variable  U : Type
variables R : U → U → Prop

example : (∃ x, ∀ y, R x y) → ∀ y, ∃ x, R x y :=
sorry
-/

variable  U : Type
variables R : U → U → Prop

example : (∃ x, ∀ y, R x y) → ∀ y, ∃ x, R x y :=
λ h₁: (∃ x, ∀ y, R x y),
show ∀ y, ∃ x, R x y,
from exists.elim(h₁)(
  assume (x: U) (h₂: ∀ y, R(x)(y)),
  assume y: U,
  have h_Rxy: R(x)(y), from h₂(y),
  show ∃ x, R x y, from exists.intro(x)(h_Rxy)
)
/-
Prove the following facts about indexed unions and intersections,
using the theorems Inter.intro, Inter.elim, Union.intro, and
Union.elim listed above.

variables {I U : Type}
variables (A : I → set U) (B : I → set U) (C : set U)

example : (⋂ i, A i) ∩ (⋂ i, B i) ⊆ (⋂ i, A i ∩ B i) :=
sorry

example : C ∩ (⋃i, A i) ⊆ ⋃i, C ∩ A i :=
sorry
-/

import data.set
open set

/- from the textbook -/
section
  variables {I U : Type}
  variables {A B : I → set U}

  theorem Inter.intro {x : U} (h : ∀ i, x ∈ A i) : x ∈ ⋂ i, A i :=
  by simp; assumption

  @[elab_simple]
  theorem Inter.elim {x : U} (h : x ∈ ⋂ i, A i) (i : I) : x ∈ A i :=
  by simp at h; apply h

  theorem Union.intro {x : U} (i : I) (h : x ∈ A i) : x ∈ ⋃ i, A i :=
  by {simp, existsi i, exact h}

  theorem Union.elim {b : Prop} {x : U}
  (h₁ : x ∈ ⋃ i, A i) (h₂ : ∀ (i : I), x ∈ A i → b) : b :=
  by {simp at h₁, cases h₁ with i h, exact h₂ i h}
end

variables {I U : Type}
variables (A : I → set U) (B : I → set U) (C : set U)

example : (⋂ i, A i) ∩ (⋂ i, B i) ⊆ (⋂ i, A i ∩ B i) :=
assume x: U,
assume h: x ∈ (⋂ i, A i) ∩ (⋂ i, B i),
have h_ni_x_in_Ai: x ∈ (⋂ i, A i), from and.elim_left h,
have h_ni_x_in_Bi: x ∈ (⋂ i, B i), from and.elim_right h,
show x ∈ (⋂ i, A i ∩ B i), from Inter.intro (
  assume i: I,
  have h_x_in_Ai: x ∈ A i, from Inter.elim h_ni_x_in_Ai i,
  have h_x_in_Bi: x ∈ B i, from Inter.elim h_ni_x_in_Bi i,
  show x ∈ A i ∩ B i, from ⟨h_x_in_Ai, h_x_in_Bi⟩
)

example : C ∩ (⋃i, A i) ⊆ ⋃i, C ∩ A i :=
assume x: U,
assume hl: x ∈ C ∩ (⋃i, A i),
have h_x_in_C: x ∈ C, from and.elim_left hl,
have x ∈ (⋃i, A i), from and.elim_right hl,
show x ∈ (⋃i, C ∩ A i), from Union.elim ‹x ∈ (⋃i, A i)› (
  assume i: I,
  assume hxAi: x ∈ A i,
  have x ∈ C ∩ A i, from and.intro h_x_in_C hxAi,
  show x ∈ (⋃i, C ∩ A i), from Union.intro i ‹x ∈ C ∩ A i›
)
/-
Fill in the sorry’s.

example : ∀ x, x ∈ A ∩ C → x ∈ A ∪ B :=
sorry

example : ∀ x, x ∈ (A ∪ B)ᶜ → x ∈ Aᶜ :=
sorry
-/

import data.set
open set

variable  {U : Type}
variables (A B C : set U)


/- using propositional logic style -/

example : ∀ x, x ∈ A ∩ C → x ∈ A ∪ B :=
λ x,
λ h: x ∈ A ∩ C,
have h_x_in_A: x ∈ A, from and.elim_left h,
show x ∈ A ∪ B, from or.inl h_x_in_A

example : ∀ x, x ∈ (A ∪ B)ᶜ → x ∈ Aᶜ :=
λ x,
λ h: x ∈ (A ∪ B)ᶜ,
assume h_x_in_A: x ∈ A,
have h_x_in_A_or_B: x ∈ A ∪ B, from or.inl h_x_in_A,
show false, from h(h_x_in_A_or_B)


/- using set-specific theorems style -/

#check @mem_inter
#check @mem_of_mem_inter_left
#check @mem_of_mem_inter_right
#check @mem_union_left
#check @mem_union_right
#check @mem_or_mem_of_mem_union
#check @not_mem_empty

example : ∀ x, x ∈ A ∩ C → x ∈ A ∪ B :=
λ x,
λ h: x ∈ A ∩ C,
have h_x_in_A: x ∈ A, from mem_of_mem_inter_left h,
show x ∈ A ∪ B, from mem_union_left B h_x_in_A


example : ∀ x, x ∈ (A ∪ B)ᶜ → x ∈ Aᶜ :=
λ x,
λ h: x ∈ (A ∪ B)ᶜ,
assume h_x_in_A: x ∈ A,
have h_x_in_A_or_B: x ∈ A ∪ B, from mem_union_left B h_x_in_A,
show false, from h(h_x_in_A_or_B)
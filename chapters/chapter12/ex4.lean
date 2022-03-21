/- 
Prove the following fact about power sets. You can use the theorems subset.trans and subset.refl

variable  {U : Type}
variables A B C : set U

-- For this exercise these two facts are useful
example (h1 : A ⊆ B) (h2 : B ⊆ C) : A ⊆ C :=
subset.trans h1 h2

example : A ⊆ A :=
subset.refl A

example (h : A ⊆ B) : powerset A ⊆ powerset B :=
sorry

example (h : powerset A ⊆ powerset B) : A ⊆ B :=
sorry
-/

import data.set
open set

variable  {U : Type}
variables A B C : set U

-- For this exercise these two facts are useful
example (h1 : A ⊆ B) (h2 : B ⊆ C) : A ⊆ C :=
subset.trans h1 h2

example : A ⊆ A :=
subset.refl A

example (h : A ⊆ B) : powerset A ⊆ powerset B :=
assume a: set U,
-- could also write a ⊆ A instead
assume h_a_in_powA: a ∈ powerset A,
-- a ⊆ B is the same as a ∈ powerset B in lean
show a ⊆ B, from subset.trans h_a_in_powA h

-- h is basically saying "things that are subsets of A are also subsets of B"
example (h : powerset A ⊆ powerset B) : A ⊆ B :=
-- then, we say, well, A is a subset of A
have h_A_sub_A: A ⊆ A, from subset.refl A,
-- so A is then a subset of B
show A ⊆ B, from h h_A_sub_A

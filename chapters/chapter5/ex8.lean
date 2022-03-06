/-
Prove ¬ (A ∧ B) → ¬ A ∨ ¬ B by replacing the sorry’s below by proofs.

open classical
variables {A B C : Prop}

-- Prove ¬ (A ∧ B) → ¬ A ∨ ¬ B by replacing the sorry's below
-- by proofs.

lemma step1 (h₁ : ¬ (A ∧ B)) (h₂ : A) : ¬ A ∨ ¬ B :=
have ¬ B, from sorry,
show ¬ A ∨ ¬ B, from or.inr this

lemma step2 (h₁ : ¬ (A ∧ B)) (h₂ : ¬ (¬ A ∨ ¬ B)) : false :=
have ¬ A, from
  assume : A,
  have ¬ A ∨ ¬ B, from step1 h₁ ‹A›,
  show false, from h₂ this,
show false, from sorry

theorem step3 (h : ¬ (A ∧ B)) : ¬ A ∨ ¬ B :=
by_contradiction
  (assume h' : ¬ (¬ A ∨ ¬ B),
    show false, from step2 h h')
-/

open classical
variables {A B C : Prop}

-- Prove ¬ (A ∧ B) → ¬ A ∨ ¬ B by replacing the sorry's below
-- by proofs.

lemma step1 (h₁ : ¬ (A ∧ B)) (h₂ : A) : ¬ A ∨ ¬ B :=
have ¬ B, from (
  λ hB: B,
  have A ∧ B, from ⟨ h₂, hB ⟩,
  show false, from h₁ this
),
show ¬ A ∨ ¬ B, from or.inr this

lemma step2 (h₁ : ¬ (A ∧ B)) (h₂ : ¬ (¬ A ∨ ¬ B)) : false :=
have ¬ A, from
  assume : A,
  have ¬ A ∨ ¬ B, from step1 h₁ ‹A›,
  show false, from h₂ this,
show false, from
have hnAonB: ¬A ∨ ¬B, from or.inl ‹¬A›,
h₂ hnAonB

theorem step3 (h : ¬ (A ∧ B)) : ¬ A ∨ ¬ B :=
by_contradiction
  (assume h' : ¬ (¬ A ∨ ¬ B),
    show false, from step2 h h')
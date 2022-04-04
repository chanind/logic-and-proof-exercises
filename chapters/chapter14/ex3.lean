/-
Only one of the following two theorems is provable. Figure out which one is true, and replace the sorry command with a complete proof.

section
  parameters {A : Type} {a b c : A} {R : A → A → Prop}
  parameter (Rab : R a b)
  parameter (Rbc : R b c)
  parameter (nRac : ¬ R a c)

  -- Prove one of the following two theorems:

  theorem R_is_strict_partial_order :
    irreflexive R ∧ transitive R :=
  sorry

  theorem R_is_not_strict_partial_order :
    ¬(irreflexive R ∧ transitive R) :=
  sorry
end
-/

section
  parameters {A : Type} {a b c : A} {R : A → A → Prop}
  parameter (Rab : R a b)
  parameter (Rbc : R b c)
  parameter (nRac : ¬ R a c)

  -- Prove one of the following two theorems:

  theorem R_is_strict_partial_order :
    irreflexive R ∧ transitive R :=
  sorry

  theorem R_is_not_strict_partial_order :
    ¬(irreflexive R ∧ transitive R) :=
    assume h: irreflexive R ∧ transitive R,
    have transR: transitive R, from and.elim_right h,
    have Rac: R a c, from transR Rab Rbc,
    show false, from nRac Rac
end
/-
The following exercise shows that in the presence of reflexivity,
the rules for symmetry and transitivity are equivalent to a single rule.

theorem foo {A : Type} {a b c : A} : a = b → c = b → a = c :=
sorry

-- notice that you can now use foo as a rule. The curly braces mean that
-- you do not have to give A, a, b, or c

section
  variable A : Type
  variables a b c : A

  example (h1 : a = b) (h2 : c = b) : a = c :=
  foo h1 h2
end

section
  variable {A : Type}
  variables {a b c : A}

  -- replace the sorry with a proof, using foo and rfl, without using eq.symm.
  theorem my_symm (h : b = a) : a = b :=
  sorry

  -- now use foo and my_symm to prove transitivity
  theorem my_trans (h1 : a = b) (h2 : b = c) : a = c :=
  sorry
end
-/

theorem foo {A : Type} {a b c : A} : a = b → c = b → a = c :=
  assume h_a_eq_b: a = b,
  assume h_c_eq_b: c = b,
  have h_b_eq_c: b = c, from eq.symm h_c_eq_b,
  show a = c, from eq.trans h_a_eq_b h_b_eq_c

-- notice that you can now use foo as a rule. The curly braces mean that
-- you do not have to give A, a, b, or c

section
  variable A : Type
  variables a b c : A

  example (h1 : a = b) (h2 : c = b) : a = c :=
  foo h1 h2
end

section
  variable {A : Type}
  variables {a b c : A}

  -- replace the sorry with a proof, using foo and rfl, without using eq.symm.
  theorem my_symm (h : b = a) : a = b :=
    have h_a_eq_a: a = a, from rfl,
    show a = b, from foo h_a_eq_a h
    

  -- now use foo and my_symm to prove transitivity
  theorem my_trans (h1 : a = b) (h2 : b = c) : a = c :=
  have h_c_eq_b: c = b, from my_symm h2,
  show a = c, from foo h1 h_c_eq_b
end
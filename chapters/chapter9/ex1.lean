/-
Fill in the sorry.

section
  variable A : Type
  variable f : A → A
  variable P : A → Prop
  variable  h : ∀ x, P x → P (f x)

  -- Show the following:
  example : ∀ y, P y → P (f (f y)) :=
  sorry
end
-/

section
  variable A : Type
  variable f : A → A
  variable P : A → Prop
  variable  h : ∀ x, P x → P (f x)

  -- Show the following:
  example : ∀ y, P y → P (f (f y)) :=
  assume y: A,
  assume Py: P y,
  have Pfy_to_Pffy: P(f(y)) → P(f(f(y))), from h(f(y)),
  have Pfy: P(f(y)), from h(y)(Py),
  show P(f(f(y))), from Pfy_to_Pffy(Pfy)
end
-/
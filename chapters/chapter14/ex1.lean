/-
Replace the sorry commands in the following proofs to show that we can
create a partial order R'​ out of a strict partial order R.

section
parameters {A : Type} {R : A → A → Prop}
parameter (irreflR : irreflexive R)
parameter (transR : transitive R)

local infix < := R

def R' (a b : A) : Prop := R a b ∨ a = b
local infix ≤ := R'

theorem reflR' (a : A) : a ≤ a := sorry

theorem transR' {a b c : A} (h1 : a ≤ b) (h2 : b ≤ c):
  a ≤ c :=
sorry

theorem antisymmR' {a b : A} (h1 : a ≤ b) (h2 : b ≤ a) :
  a = b :=
sorry

end
-/

section
  parameters {A : Type} {R : A → A → Prop}
  parameter (irreflR : irreflexive R)
  parameter (transR : transitive R)

  local infix < := R

  def R' (a b : A) : Prop := R a b ∨ a = b
  local infix ≤ := R'

  theorem reflR' (a : A) : a ≤ a :=
    have haa: a = a, from eq.refl a,
    show a ≤ a, from or.inr(haa)

  theorem transR' {a b c : A} (h1 : a ≤ b) (h2 : b ≤ c):
    a ≤ c :=
    or.elim(h1)(
      λ h_a_lt_b: a < b,
      or.elim(h2)(
        λ h_b_lt_c: b < c,
        have a < c, from transR h_a_lt_b h_b_lt_c,
        show a ≤ c, from or.inl this
      )(
        λ h_b_eq_c: b = c,
        have a < c, from eq.subst h_b_eq_c h_a_lt_b,
        show a ≤ c, from or.inl this
      )
    )(
      λ h_a_eq_b: a = b,
       or.elim(h2)(
        λ h_b_lt_c: b < c,
        have a < c, from eq.substr h_a_eq_b h_b_lt_c,
        show a ≤ c, from or.inl this
      )(
        λ h_b_eq_c: b = c,
        have a = c, from eq.subst h_b_eq_c h_a_eq_b,
        show a ≤ c, from or.inr this
      )
    )

  theorem antisymmR' {a b : A} (h1 : a ≤ b) (h2 : b ≤ a) :
    a = b :=
    or.elim(h1)(
      assume h_a_lt_b: a < b,
      show a = b, from false.elim (
        or.elim(h2)(
          assume : b < a,
          have a < a, from transR ‹a < b› ‹ b < a›,
          have ¬ (a < a), from irreflR a,
          show false, from ‹¬ (a < a)› ‹a < a›
        )(
          assume : b = a,
          -- I couldn't get eq.subst ‹b = a› ‹a < b› to work, or any permutation of that
          -- This is from https://stackoverflow.com/a/45404778/245362
          -- I don't really understand what simp does or why this works
          have a < a, by simp * at *,
          have ¬ (a < a), from irreflR a,
          show false, from ‹¬ (a < a)› ‹a < a›
        )
      )
    )(
      assume : a = b, this
    )
end
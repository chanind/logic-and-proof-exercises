/-
Replace the sorry by a proof.

section
parameters {A : Type} {R : A → A → Prop}
parameter (reflR : reflexive R)
parameter (transR : transitive R)

def S (a b : A) : Prop := R a b ∧ R b a

example : transitive S :=
sorry

end
-/

section
  parameters {A : Type} {R : A → A → Prop}
  parameter (reflR : reflexive R)
  parameter (transR : transitive R)

  def S (a b : A) : Prop := R a b ∧ R b a

  example : transitive S :=
    assume x y z: A,
    assume : S x y,
    assume : S y z,
    have R x y, from and.elim_left ‹S x y›,
    have R y x, from and.elim_right ‹S x y›,
    have R y z, from and.elim_left ‹S y z›,
    have R z y, from and.elim_right ‹S y z›,
    have R x z, from transR ‹R x y› ‹R y z›,
    have R z x, from transR ‹R z y› ‹R y x›,
    show S x z, from and.intro ‹R x z› ‹R z x›
end
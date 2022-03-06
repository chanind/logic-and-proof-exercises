/-
Show how to derive the proof-by-contradiction rule from the law of the
excluded middle, using the other rules of natural deduction.
In other words, assume you have a proof of ⊥ from ¬𝐴.
Using 𝐴∨¬𝐴 as a hypothesis, but without using the rule RAA,
show how you can go on to derive 𝐴.
-/

-- I don't really understand how this show proof by contradtion
-- but... ¯\_(ツ)_/¯ 
section
  variables (A: Prop)
  variable hnAf: ¬ A → false

  example (h: A ∨ ¬ A): A :=
    or.elim(h) (
      assume hA: A,
      show A, from hA
    ) (
      assume hnA: ¬ A,
      show A, from false.elim(hnAf(hnA))
    )

end
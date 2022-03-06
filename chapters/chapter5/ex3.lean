/-
Construct a natural deduction proof of ¬𝐴∨¬𝐵 from ¬(𝐴∧𝐵).
You can do it as follows:

First, prove ¬𝐵, and hence ¬𝐴∨¬𝐵, from ¬(𝐴∧𝐵) and 𝐴.

Use this to construct a proof of ¬𝐴, and hence ¬𝐴∨¬𝐵,
from ¬(𝐴∧𝐵) and ¬(¬𝐴∨¬𝐵).

Use this to construct a proof of a contradiction from
¬(𝐴∧𝐵) and ¬(¬𝐴∨¬𝐵).

Using proof by contradiction, this gives you a proof of
¬𝐴∨¬𝐵 from ¬(𝐴∧𝐵).
-/

open classical

variables (A B: Prop)

example (h: ¬ (A ∧ B)): ¬ A ∨ ¬ B :=
  -- I couldn't understand what the proof hints in the instructions meant
  -- so I just proved it using em and or.elim ¯\_(ツ)_/¯ 
  or.elim(em(A))(
    assume hA: A,
    have hnB: ¬ B, from by_contradiction(
      assume hnnB: ¬¬ B,
      -- this seems so stupid, there must be a better way to get ¬¬B → B 
      have hB: B, from by_contradiction(assume hnB, hnnB(hnB)),
      have hAB: A ∧ B, from ⟨hA, hB⟩,
      show false, from h(hAB) 
    ),
    show ¬ A ∨ ¬ B, from or.inr hnB
  ) (
    assume hnA: ¬ A,
    show ¬ A ∨ ¬ B, from or.inl hnA
  )

/-
Give a natural deduction proof of ¬(𝐴∧𝐵) from ¬𝐴∨¬𝐵.
(You do not need to use proof by contradiction.)
-/

open classical

variables (A B : Prop)

example (h: ¬ A ∨ ¬ B) : ¬ (A ∧ B) :=
  show ¬ (A ∧ B), from or.elim(h)(
    assume hnA: ¬ A,
    -- it says you don't *have* to use proof by contradiction,
    -- but it doesn't say you *can't* ...
    by_contradiction(
      assume hnnAB: ¬¬(A ∧ B),
      have hAB: A ∧ B, -- is there an easier way to get A from ¬¬A?
      from by_contradiction(
        assume hnAB: ¬(A ∧ B),
        show false, from hnnAB(hnAB)
      ),
      have hA: A,
      from and.left hAB,
      show false, from hnA(hA)
    )
  ) (
    assume hnB: ¬ B,
    -- this is almost identical to the proof of the first branch
    -- is there a way to consolidate this somehow?
    by_contradiction(
      assume hnnAB: ¬¬(A ∧ B),
      have hAB: A ∧ B,
      from by_contradiction(
        assume hnAB: ¬(A ∧ B),
        show false, from hnnAB(hnAB)
      ),
      have hB: B,
      from and.right hAB,
      show false, from hnB(hB)
    )
  )
  
  

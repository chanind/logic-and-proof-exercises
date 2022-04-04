/-
Complete the following proof.

open nat

example : 1 ≤ 4 :=
sorry
-/

open nat

-- using the methods from the chapter
example : 1 ≤ 4 :=
  have 1 < 2, from nat.lt_succ_self 1,
  have 2 < 3, from nat.lt_succ_self 2,
  have 3 < 4, from nat.lt_succ_self 3,
  have 1 < 3, from nat.lt_trans ‹1 < 2› ‹2 < 3›,
  have 1 < 4, from nat.lt_trans ‹1 < 3› ‹3 < 4›,
  show 1 ≤ 4, from nat.le_of_lt ‹1 < 4›

-- Could also have just done the following, much more brief
example : 1 ≤ 4 := nat.le_add_right 1 3
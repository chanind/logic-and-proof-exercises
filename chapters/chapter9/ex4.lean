/-
Fill in the sorry’s below, to prove the barber paradox.

open classical   -- not needed, but you can use it

-- This is an exercise from Chapter 4. Use it as an axiom here.
axiom not_iff_not_self (P : Prop) : ¬ (P ↔ ¬ P)

example (Q : Prop) : ¬ (Q ↔ ¬ Q) :=
not_iff_not_self Q

section
  variable Person : Type
  variable shaves : Person → Person → Prop
  variable barber : Person
  variable h : ∀ x, shaves barber x ↔ ¬ shaves x x

  -- Show the following:
  example : false :=
  sorry
end
-/

open classical   -- not needed, but you can use it

-- This is an exercise from Chapter 4. Use it as an axiom here.
axiom not_iff_not_self (P : Prop) : ¬ (P ↔ ¬ P)

example (Q : Prop) : ¬ (Q ↔ ¬ Q) :=
not_iff_not_self Q

-- style 1, prove using excluded middle from classical
section
  variable Person : Type
  variable shaves : Person → Person → Prop
  variable barber : Person
  variable h : ∀ x, shaves barber x ↔ ¬ shaves x x

  example : false :=
  have hBarberInverse: shaves barber barber ↔ ¬ shaves barber barber,
  from h(barber),
  or.elim(em(shaves(barber)(barber)))(
    λ hBarberShavesSelf: shaves(barber)(barber), 
    have hBarberDoesntShaveSelf: ¬ shaves barber barber,
    from iff.mp(hBarberInverse)(hBarberShavesSelf),
    show false, from hBarberDoesntShaveSelf(hBarberShavesSelf)
  )(
    λ hBarberDoesntShaveSelf: ¬ shaves(barber)(barber),
    have hBarberShavesSelf: shaves barber barber,
    from iff.mpr(hBarberInverse)(hBarberDoesntShaveSelf),
    show false, from hBarberDoesntShaveSelf(hBarberShavesSelf)
  )
end

-- style 2, prove using the not_iff_not_self axiom
section
  variable Person : Type
  variable shaves : Person → Person → Prop
  variable barber : Person
  variable h : ∀ x, shaves barber x ↔ ¬ shaves x x

  example : false :=
  have hBarberInverse: shaves barber barber ↔ ¬ shaves barber barber,
  from h(barber),
  have hNotBarberInverse: ¬ (shaves barber barber ↔ ¬ shaves barber barber),
  from not_iff_not_self(shaves barber barber),
  show false, from hNotBarberInverse(hBarberInverse)
end
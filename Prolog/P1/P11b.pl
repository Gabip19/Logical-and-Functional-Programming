/*
    Sa se calculeze suma alternanta a elementelor unei
liste (l1 - l2 + l3 ...).
*/

sumaAlt([], _, 0).
sumaAlt([H | T], F, R) :-
        F1 is (-1) * F,
        sumaAlt(T, F1, R1),
        R2 is H * F,
        R is R1 + R2.

sumaAlter(L, R) :- sumaAlt(L, 1, R).
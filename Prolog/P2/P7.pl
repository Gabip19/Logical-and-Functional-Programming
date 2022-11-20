/*
    a) Definiti un predicat care determina produsul unui
numar reprezentat cifra cu cifra intr-o lista cu o anumita
cifra. De ex: [1 9 3 5 9 9] * 2 => [3 8 7 1 9 8]
*/

inverseaza([], C, C).
inverseaza([H | T], C, R) :-
        inverseaza(T, [H | C], R).

produs([], _, 0, []) :- !.
produs([], _, TR, [TR]).
produs([H | T], E, TR, [Rest | Rez]) :-
        Prod is H * E + TR,
        TR1 is Prod div 10,
        Rest is Prod mod 10,
        produs(T, E, TR1, Rez).

produs(L, E, R) :-
        inverseaza(L, [], R1),
        produs(R1, E, 0, R2),
        inverseaza(R2, [], R).
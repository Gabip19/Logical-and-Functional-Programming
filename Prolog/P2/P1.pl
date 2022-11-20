/*
    a) Definiti un predicat care determina suma a doua
numere scrise in reprezentare de lista.
*/

inversLista([], C, C).
inversLista([H | T], C, R) :-
        inversLista(T, [H | C], R).


suma([], [], 0, []) :- !.
suma([], [], 1, [1]) :- !.
suma([H1 | T1], [H2 | T2], Tr, [Rest | Sum]) :- !,
        S is H1 + H2 + Tr,
        Rest is S mod 10,
        Tr1 is S div 10,
        suma(T1, T2, Tr1, Sum).
suma([H | T], [], Tr, [Rest | Sum]) :-
        S is H + Tr,
        Rest is S mod 10,
        Tr1 is S div 10,
        suma(T, [], Tr1, Sum).
suma([], [H | T], Tr, [Rest | Sum]) :-
        S is H + Tr,
        Rest is S mod 10,
        Tr1 is S div 10,
        suma([], T, Tr1, Sum).


suma(L1, L2, R) :-
        inversLista(L1, [], R1),
        inversLista(L2, [], R2),
        suma(R1, R2, 0, Rsum),
        inversLista(Rsum, [], R).
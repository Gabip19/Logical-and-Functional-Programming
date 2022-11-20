/*
    a) Definiti un predicat care determina predecesorul unui
numar reprezentat cifra cu cifra intr-o lista.
De ex: [1 9 3 6 0 0] => [1 9 3 5 9 9]
       [0 0 6 3 9 1]
*/

inverseaza([], C, C).
inverseaza([H | T], C, R) :-
        inverseaza(T, [H | C], R).


predecesor([], 0, []) :- !.
predecesor([H | T], TR, [9 | R]) :-
        S is H - TR,
        S < 0, !,
        predecesor(T, 1, R).
predecesor([H | T], TR, [S | R]) :-
        S is H - TR,
        predecesor(T, 0, R).


predecesor([0], [-1]) :- !.
predecesor(L, R) :-
        inverseaza(L, [], R1),
        predecesor(R1, 1, R2),
        inverseaza(R2, [], R).
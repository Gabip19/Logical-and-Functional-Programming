/*
    a) Definiti un predicat care determina succesorul unui
numar reprezentat cifra cu cifra intr-o lista.
De ex: [1 9 3 5 9 9] => [1 9 3 6 0 0]
*/

inverseaza([], C, C).
inverseaza([H | T], C, R) :-
        inverseaza(T, [H | C], R).


succesor([], 1, [1]) :- !.
succesor([], 0, []) :- !.
succesor([H | T], TR, [Rest | R]) :-
        S is H + TR,
        Rest is S mod 10,
        Cat is S div 10,
        succesor(T, Cat, R).


succesor(L, R) :-
        inverseaza(L, [], R1),
        succesor(R1, 1, R2),
        inverseaza(R2, [], R).
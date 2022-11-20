/*
    a) Sa se sorteze o lista cu eliminarea dublurilor.
De ex: [4 2 6 2 3 4] => [2 3 4 6]
*/

plaseaza(E, [], [E]) :- !.
plaseaza(E, [H | T], [E, H | T]) :-
        E < H, !.
plaseaza(E, [H | T], [H | R]) :-
        E > H, !,
        plaseaza(E, T, R).
plaseaza(E, [E | T], [E | T]).


sorteaza([], []).
sorteaza([H | T], R) :-
        sorteaza(T, R2),
        plaseaza(H, R2, R).
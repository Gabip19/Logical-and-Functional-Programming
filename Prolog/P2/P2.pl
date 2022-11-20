/*
    a) Sa se sorteze o lista cu pastrarea dublurilor.
De ex: [4 2 6 2 3 4] => [2 2 3 4 4 6]
*/

plaseaza(E, [], [E]) :- !.
plaseaza(E, [H | T], [E, H | T]) :-
        E =< H, !.
plaseaza(E, [H | T], [H | R]) :-
        E > H,
        plaseaza(E, T, R).


sorteaza([], []).
sorteaza([H | T], R) :-
        sorteaza(T, R2),
        plaseaza(H, R2, R).
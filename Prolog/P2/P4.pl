/*
    a) Sa se interclaseze fara pastrarea dublurilor doua
liste sortate.
*/

interclasare([], L2, L2) :- !.
interclasare(L1, [], L1) :- !.
interclasare([A | T1], [B | T2], [A | R]) :-
        A < B, !,
        interclasare(T1, [B | T2], R).
interclasare([A | T1], [B | T2], [B | R]) :-
        A > B, !,
        interclasare([A | T1], T2, R).
interclasare([A | T1], [B | T2], [A | R]) :-
        A == B,
        interclasare(T1, T2, R).


stergeDub(_, [], []) :- !.
stergeDub(E, [E | T], R) :-
        !,
        stergeDub(E, T, R).
stergeDub(E, [H | T], [H | R]) :-
        stergeDub(E, T, R).


stergeDublicate([], []) :- !.
stergeDublicate([H | T], [H | R]) :-
        stergeDub(H, T, R1),
        stergeDublicate(R1, R).


intercls(L1, L2, R) :-
        stergeDublicate(L1, R1),
        stergeDublicate(L2, R2),
        interclasare(R1, R2, R).
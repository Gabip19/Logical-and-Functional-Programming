/*
    Sa se construiasca sublista (lm, ..., ln) a listei
(l1, ..., lk).
*/

sublista(_, N, _, N, []) :- !.
sublista([H | T], C, M, N, [H | R]) :-
        C1 is C + 1,
        C1 == M, !,
        M1 is M + 1,
        sublista(T, C1, M1, N, R).
sublista([_ | T], C, M, N, R) :-
        C1 is C + 1,
        sublista(T, C1, M, N, R).

sublista(L, M, N, R) :- sublista(L, 0, M, N, R).
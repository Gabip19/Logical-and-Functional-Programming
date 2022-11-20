/*
    Sa se scrie un predicat care, primind o lista, intoarce
multimea tuturor perechilor din lista.
De ex, cu [a, b, c, d] va produce
        [[a, b], [a, c], [a, d], [b, c], [b, d], [c, d]].
*/

perechi(_, 0, []) :- !.
perechi([H | T], N, [H | R]) :-
        N1 is N - 1,
        perechi(T, N1, R).
perechi([_ | T], N, R) :-
        perechi(T, N, R).

perechiToate([], []).
perechiToate(L, R) :-
        findall(RS, perechi(L, 2, RS), R).
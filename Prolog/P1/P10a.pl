/*
    Sa se intercaleze un element pe pozitia a n-a a unei liste.
*/

interElem([], E, _, [E]) :- !.
interElem(L, E, 0, [E | L]) :- !.
interElem([H | T], E, N, [H | R]) :-
        N1 is N - 1,
        interElem(T, E, N1, R).
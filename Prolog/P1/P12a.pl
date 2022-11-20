/*
    Sa se scrie un predicat care substituie intr-o lista
un element prin altul.
*/

subs([], _, _, []).
subs([E | T], E, S, [S | R]) :-
        !,
        subs(T, E, S, R).
subs([H | T], E, S, [H | R]) :-
        subs(T, E, S, R).
/*
    Sa se scrie un predicat care intoarce intersectia a
doua multimi.
*/

contine([E | _], E) :- !.
contine([_ | T], E) :- contine(T, E).

intersectie([], _, []).
intersectie([H | T], L, [H | R]) :-
        contine(L, H),
        intersectie(T, L, R).
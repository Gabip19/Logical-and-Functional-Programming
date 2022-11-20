/*
    Sa se scrie un predicat care intoarce reuniunea
a doua multimi.
*/

contine([E | _], E) :- !.
contine([_ | T], E) :- contine(T, E).

reuniune([], L2, L2).
reuniune([H | T], L2, R) :-
        contine(L2, H), !,
        reuniune(T, L2, R).
reuniune([H | T], L2, [H | R]) :-
        reuniune(T, L2, R).
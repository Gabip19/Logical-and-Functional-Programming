/*
    Sa se scrie un predicat care intoarce diferenta a doua multimi.
*/

contine(E, [H | _]) :-
        E == H, !.
contine(E, [_ | T]) :-
        contine(E, T).


diferenta([], _, []).
diferenta([H | T], L, R) :-
        contine(H, L), !,
        diferenta(T, L, R).
diferenta([H | T], L, [H | R]) :-
        diferenta(T, L, R).
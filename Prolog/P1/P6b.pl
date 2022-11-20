/*
    Sa se elimine toate aparitiile elementului maxim dintr-o 
lista de numere intregi.
*/

maximLista([], 0).
maximLista([E], E) :- !.
maximLista([H | T], H) :-
        maximLista(T, Max),
        H > Max, !.
maximLista([_ | T], Max) :-
        maximLista(T, Max).


elimina([], _, []).
elimina([E | T], E, R) :-
        !,
        elimina(T, E, R).
elimina([H | T], E, [H | R]) :-
        elimina(T, E, R).


eliminaMax(L, R) :-
        maximLista(L, Max),
        elimina(L, Max, R).
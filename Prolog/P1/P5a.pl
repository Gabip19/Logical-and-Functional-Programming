/*
     Sa se scrie un predicat care sterge toate aparitiile unui 
anumit atom dintr-o lista.
*/

eliminaElem([], _, []).
eliminaElem([E | T], E, R) :-
        !,
        eliminaElem(T, E, R).
eliminaElem([H | T], E, [H | R]) :-
        H \== E,
        eliminaElem(T, E, R).
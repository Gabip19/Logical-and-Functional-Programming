/*
    Sa se elimine prima aparitie a elementului minim dintr-o
lista de numere intregi.
*/

minimLista([], 0).
minimLista([E], E) :- !.
minimLista([H | T], H) :-
        minimLista(T, Min),
        H < Min, !.
minimLista([_ | T], Min) :-
        minimLista(T, Min).


eliminaPrimElem([], _, []).
eliminaPrimElem([E | T], E, T) :- !.
eliminaPrimElem([H | T], E, [H | R]) :- 
        eliminaPrimElem(T, E, R).


elPrimMinim(L, R) :-
        minimLista(L, Min),
        eliminaPrimElem(L, Min, R).
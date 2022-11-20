/*
    Sa se scrie un predicat care elimina dintr-o lista toate 
elementele care se repeta (ex: l=[1,2,1,4,1,3,4] => l=[2,3])
*/

aparitii([], _, 0).
aparitii([E | T], E, Nr) :-
        !,
        aparitii(T, E, Nr1),
        Nr is Nr1 + 1.
aparitii([_ | T], E, Nr) :-
        aparitii(T, E, Nr).


eliminaElem([], _, []).
eliminaElem([E | T], E, R) :-
        !,
        eliminaElem(T, E, R).
eliminaElem([H | T], E, [H | R]) :-
        H \== E,
        eliminaElem(T, E, R).


eliminaRep([], []).
eliminaRep([H | T], R) :-
        aparitii(T, H, Nr),
        Nr > 0,
        !,
        eliminaElem(T, H, R1),
        eliminaRep(R1, R).
eliminaRep([H | T], [H | R]) :-
        eliminaRep(T, R).
/*
    Sa se scrie un predicat care se va satisface daca o lista
are numar par de elemente si va esua in caz contrar, fara sa
se numere elementele listei.
*/

nrParElem([]).
nrParElem([_, _ | T]) :-
    nrParElem(T).
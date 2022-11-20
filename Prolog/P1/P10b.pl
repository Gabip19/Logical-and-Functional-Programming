/*
    Sa se calculeze cel mai mare divizor comun al elementelor
unei liste.
*/

cmmdc(0, Y, Y) :- !.
cmmdc(X, 0, X) :- !.
cmmdc(X, Y, R) :-
        X >= Y, !,
        Rest is X mod Y,
        cmmdc(Y, Rest, R).
cmmdc(X, Y, R) :-
        X < Y, !,
        Rest is Y mod X,
        cmmdc(X, Rest, R).


cmmdcLista([H], H) :- !.
cmmdcLista([H | T], R) :-
        cmmdcLista(T, R1),
        cmmdc(H, R1, R).
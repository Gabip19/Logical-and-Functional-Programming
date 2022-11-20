% a. Sa se scrie un predicat care determina cel mai mic multiplu comun 
% al elementelor unei liste formate din numere intregi.

% consult('P2a.pl').

/*
    cmmdc(X, Y) =
        cmmdc(-X, Y)         , X < 0
        cmmdc(X, -Y)         , Y < 0
        X                    , Y = 0
        cmmdc(Y, X)          , Y > X
        cmmdc(Y, X % Y)      , Y < X, Y != 0, X > 0, Y > 0
    
    cmmdc(X : Intreg, Y : Intreg, R : Intreg)
    Modele de flux: (i, i, o), (i, i, i)
    X - primul element pt care cautam cmmdc-ul
    Y - al doilea element pt care cautam cmmdc-ul
    R - cmmdc-ul celor doua numere
*/
cmmdc(X, Y, R):-
        X < 0, !,
        X1 is -X,
        cmmdc(X1, Y, R).
cmmdc(X, Y, R):-
        Y < 0, !,
        Y1 is -Y,
        cmmdc(X, Y1, R).
cmmdc(X, 0, X):-!.
cmmdc(X, Y, R):-
        Y > X,
        cmmdc(Y, X, R).
cmmdc(X, Y, R):-
        X >= Y,
        T is X mod Y,
        cmmdc(Y, T, R).


/*
    cmmmcLista(l1...ln) =
        0                                   , n = 0
        l1                                  , n = 1
        (l1 * l2) / cmmdc(l1, l2)           , n = 2
        (l1 * REZ) / cmmdc(l1, REZ), unde
            REZ = cmmmcLista(l2...ln)       , n > 2
    
    cmmmcLista(L : Lista, R : Intreg)
    Modele de flux: (i, o), (i, i)
    L - lista pt care se calculeaza cmmmc
    R - cmmmc-ul elementelor din lista
*/
cmmmcLista([], 0).
cmmmcLista([E], E):-!.
cmmmcLista([A, B], R):-
        P is A*B,
        cmmdc(A, B, D),
        R is P/D,
        !.
cmmmcLista([H | T], R):-
        cmmmcLista(T, R1),
        P is H*R1,
        cmmdc(H, R1, D),
        R is P/D.




produs([], 0).
produs([E], E):-!.
produs([H|T], P):-
        produs(T, P1),
        P is H*P1.


cmmdcLista([], 1).
cmmdcLista([_], 1):-
        !.
cmmdcLista([A, B], R):-
        cmmdc(A, B, R),
        !.
cmmdcLista([H|T], R):-
        cmmdcLista(T, R1),
        cmmdc(H, R1, R).
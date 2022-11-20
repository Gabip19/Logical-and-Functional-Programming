/*
    a) Dandu-se o lista liniara numerica, sa se stearga 
    toate secventele de valori consecutive. 
    Ex: sterg([1, 2, 4, 6, 7, 8, 10], L) 
        va produce L=[4, 10].
*/
/*
    stergeConsec(l1...ln, f) =
        vida                            , n=1 si f=1
        l1                              , n=1 si f=0
        stergeConsec(l2...ln, 1)        , n!=1 si l1 = l2-1
        stergeConsec(l2...ln, 0)        , n!=1 si f=1 si l1 != l2-1
        l1 + stergeConsec(l2...ln, 0)   , n!=1 si f=0 si l1 != l2-1
    
    stergeConsec(L : Lista, f : Intreg, R : Lista)
    Modele de flux: (i, i, o), (i, i, i)
    L - lista din care se elimina
    f - indicator daca primul element face parte dintr-o secventa
        consecutiva si trebuie eliminat
    R - lista rezultat
*/

stergeConsec([], _, []).
stergeConsec([_], 1, []):-!.
stergeConsec([E], 0, [E]):-!.
stergeConsec([H1, H2 | T], _, R):-
        H1 =:= H2 - 1, !,
        stergeConsec([H2 | T], 1, R).
stergeConsec([_, H2 | T], 1, R):-
        stergeConsec([H2 | T], 0, R),!.
stergeConsec([H1, H2 | T], 0, R):-
        stergeConsec([H2 | T], 0, R1),
        R = [H1 | R1].

stergeConsec(L, R):- stergeConsec(L, 0, R).


/* 
    b) Se da o lista eterogena, formata din numere intregi si liste 
    de numere intregi. Din fiecare sublista sa se stearga toate secventele 
    de valori consecutive. 
    De ex:[1, [2, 3, 5], 9, [1, 2, 4, 3, 4, 5, 7, 9], 11, [5, 8, 2], 7] 
            =>[1, [5], 9, [4, 7, 9], 11, [5, 8, 2], 7]
*/
/*
    stergeConsecLista(l1...ln) =
        vida                                               , n = 0
        stergeConsec(l1) + stergeConsecLista(l2...ln)      , is_list(l1), n > 0
        l1 + stergeConsecLista(l2...ln)                    , altfel

    stergeConsecLista(L : lista eterogena, R : lista)
    Modele de flux: (i, i), (i, i)
    L - lista cu sublistele pt care se elimina secventele crescatoare
    R - lista rezultat
*/

stergeConsecLista([], []).
stergeConsecLista([H | T], [R1 | R]):-
        is_list(H), !,
        stergeConsec(H, R1),
        stergeConsecLista(T, R).
stergeConsecLista([H | T], [H | R]):-
        stergeConsecLista(T, R).
/*
    Sa se genereze lista submultimilor cu N elemente, cu
elementele unei liste date.
Ex: [2,3,4] N=2 => [[2,3],[2,4],[3,4]]
*/

/*
    multimi(l1...ln, K) =
 	    1.  []                              , K = 0
 	    2.  l1 + multimi(l2...ln, K - 1)    , K > 0
 	    3.  multimi(l2...ln, K)             , K > 0
    
    Modele de flux: (i, i, o) - nedeterminist
    multimi(L : Lista, K : Intreg, R : Lista)
    L - lista din care se extrag elemente pt submultimi
    K - numarul de elemente care mai trebuie adaugata
        in submultime
    R - lista cu submultimea de K elemente generata
*/

multimi(_, 0, []) :- !.
multimi([H | T], K, [H | R]) :-
        K1 is K - 1,
        multimi(T, K1, R).
multimi([_ | T], K, R) :-
        multimi(T, K, R).


/*
    setMultimi(l1..ln, K) =
        []                              , n = 0 sau K = 0
        findall(multimi(l1...ln, K))    , altfel

    Modele de flux: (i, i, o) - determinist 
    setMultimi(L : Lista, K : Intreg, R : List)
    L - lista pt care se cauta submultimile
    K - numarul de elemente dintr-o submultime
    R - lista cu toate submultimile de K elemente
*/

setMultimi(_, 0, []) :- !.
setMultimi([], _, []) :- !.
setMultimi(L, K, R) :- findall(RS, multimi(L, K, RS), R).
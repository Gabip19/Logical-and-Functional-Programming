/*
    Sa se scrie un predicat care sa testeze daca o lista
formata din numere intregi are aspect de "vale" (o multime
se spune ca are aspect de "vale" daca elementele descresc
pana la un moment dat, apoi cresc.
De ex. 10 8 6 9 11 13).
*/

aspectVale([_], 1) :- !.
aspectVale([H1, H2 | T], 0) :-
        H1 > H2, !,
        aspectVale([H2 | T], 0).
aspectVale([H1, H2 | T], _) :-
        H1 < H2,
        aspectVale([H2 | T], 1).


aspectVale([]) :- fail.
aspectVale([_]) :- !.
aspectVale(L) :- aspectVale(L, 0).

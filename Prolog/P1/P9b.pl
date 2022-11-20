/*
    Sa se construiasca lista (m, ..., n), adica multimea
numerelor intregi din intervalul [m, n].
*/

cstrLista(N, N, [N]) :- !.
cstrLista(M, N, [M | R]) :-
        M1 is M + 1,
        cstrLista(M1, N, R).
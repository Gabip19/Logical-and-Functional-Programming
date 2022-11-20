/*
    Sa se scrie un predicat care testeaza egalitatea a doua
multimi, fara sa se faca apel la diferenta a doua multimi.
*/

contine([E | _], E) :- !.
contine([_ | T], E) :- contine(T, E).

lungime([], 0).
lungime([_ | T], R) :-
        lungime(T, R1),
        R is R1 + 1.

verificaElems([], _) :- !.
verificaElems([H | T], L2) :-
        contine(L2, H),
        verificaElems(T, L2).

multimiEgale(L1, L2) :-
        lungime(L1, R1),
        lungime(L2, R2),
        R1 == R2,
        verificaElems(L1, L2).
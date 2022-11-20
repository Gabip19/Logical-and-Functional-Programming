/*
     Sa se scrie un predicat care elimina primele 3 aparitii
ale unui element intr-o lista. Daca elementul apare mai putin
de 3 ori, se va elimina de cate ori apare.
*/

elimina(L, _, 0, L) :- !.
elimina([], _, _, []) :- !.
elimina([E | T], E, N, R) :-
        !,
        N1 is N - 1,
        elimina(T, E, N1, R).
elimina([H | T], E, N, [H | R]) :-
        elimina(T, E, N, R).

eliminaTrei(L, E, R) :- elimina(L, E, 3, R).
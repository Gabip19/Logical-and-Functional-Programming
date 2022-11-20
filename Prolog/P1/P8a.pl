/*
    Sa se scrie un predicat care testeaza daca o lista
este multime.
*/

contine([E | _], E) :- !.
contine([_ | T], E) :- contine(T, E).

esteMultime([]).
esteMultime([H | T]) :-
        not(contine(T, H)),
        esteMultime(T).
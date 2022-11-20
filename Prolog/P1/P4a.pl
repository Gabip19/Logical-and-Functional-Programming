/*
    Sa se scrie un predicat care substituie intr-o lista un element printr-o
 alta lista.
*/

substituieLista([], _, _, []).
substituieLista([E | T], E, M, [M | R]) :-
        !,
        substituieLista(T, E, M, R).
substituieLista([H | T], E, M, [H | R]) :-
        substituieLista(T, E, M, R).
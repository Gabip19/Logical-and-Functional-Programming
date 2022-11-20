/*
     Sa se elimine elementul de pe pozitia a n-a a 
unei liste liniare.
*/

eliminaN([], _, _, []).
eliminaN([_ | T], N, N, T) :- !.
eliminaN([H | T], N, P, [H | R]) :-
        P1 is P + 1,
        eliminaN(T, N, P1, R).

eliminaN(L, N, R) :- eliminaN(L, N, 0, R).
/*
    Definiti un predicat care selecteaza al n-lea element
al unei liste.
*/

selectN([H | _], 1, H) :- !.
selectN([_ | T], N, R) :-
        N1 is N - 1,
        selectN(T, N1, R).
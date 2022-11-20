 /*
    Sa se scrie un predicat care adauga intr-o lista dupa fiecare element par
 valoarea 1.
*/

adauga([], []).
adauga([H | T], [H , 1 | R]) :-
        H mod 2 =:= 0, !,
        adauga(T, R).
adauga([H | T], [H | R]) :- adauga(T, R).
/*
    Definiti un predicat care, dintr-o lista de atomi, produce 
o lista de perechi (atom n), unde atom apare in lista initiala
de n ori. De ex: numar([1, 2, 1, 2, 1, 3, 1], X) va produce 
X = [[1, 4], [2, 2], [3, 1]].
*/

eliminaCuNr([], _, 0, []).
eliminaCuNr([E | T], E, Nr, R) :-
        !,
        eliminaCuNr(T, E, Nr1, R),
        Nr is Nr1 + 1.
eliminaCuNr([H | T], E, Nr, [H | R]) :-
        H \== E,
        eliminaCuNr(T, E, Nr, R).


frcvPerechi([], []).
frcvPerechi([H | T], [[H, Nr] | R2]) :-
        eliminaCuNr([H | T], H, Nr, R1),
        frcvPerechi(R1, R2).
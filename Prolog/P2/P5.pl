/*
    a) Sa se determine pozitiile elementului maxim dintr-o
lista liniara.
De ex: poz([10, 14, 12, 13, 14], L) va produce L = [2,5].
*/

maxim([], 0).
maxim([E], E) :- !.
maxim([H | T], H) :-
        maxim(T, R),
        H > R, !.
maxim([_ | T], R) :-
        maxim(T, R).


pozMax([], _, _, []).
pozMax([Max | T], Max, Poz, [Poz | R]) :-
        !,
        Poz1 is Poz + 1,
        pozMax(T, Max, Poz1, R).
pozMax([_ | T], Max, Poz, R) :-
        Poz1 is Poz + 1,
        pozMax(T, Max, Poz1, R).


poz(L, R) :-
        maxim(L, Max),
        pozMax(L, Max, 1, R).
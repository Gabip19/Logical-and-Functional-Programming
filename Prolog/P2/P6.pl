/*
    a) Intr-o lista L sa se inlocuiasca toate aparitiile
unui element E cu elementele unei alte liste, L1.
De ex: inloc([1, 2, 1, 3, 1, 4], 1, [10, 11], X)
va produce X=[10, 11, 2, 10, 11, 3, 10, 11, 4].
*/

concat([], L2, L2).
concat([H | T], L2, [H | R]) :-
        concat(T, L2, R).

inloc([], _, _, []).
inloc([E | T], E, L1, R) :-
        !,
        inloc(T, E, L1, R1),
        concat(L1, R1, R).
inloc([H | T], E, L1, [H | R]) :-
        inloc(T, E, L1, R).
/*
    a) Sa se adauge dupa fiecare element dintr-o lista
divizorii elementului.
*/

concat([], L2, L2).
concat([H | T], L2, [H | R]) :-
        concat(T, L2, R).

divizori(E, _, []) :- E < 2, !.
divizori(E, E, []) :- !.
divizori(E, D, [D | R]) :-
        E mod D =:= 0, !,
        D1 is D + 1,
        divizori(E, D1, R).
divizori(E, D, R) :-
        D1 is D + 1,
        divizori(E, D1, R).

adaugaDiv([], []).
adaugaDiv([H | T], [H | R]) :-
        divizori(H, 2, Divs),
        adaugaDiv(T, R1),
        concat(Divs, R1, R).
/*
    a) Se da o lista de numere intregi. Se cere sa se
adauge in lista dupa 1-ul element, al 3-lea element,
al 7-lea elemen, al 15-lea element … o valoare data e.
*/

% adauga([], E, Poz, Poz, [E]) :- !.
% adauga([], _, _, _, []).
% adauga([H | T], E, C, Poz, [H, E | R]) :-
%         C1 is C + 1,
%         C1 == Poz, !,
%         Poz1 is Poz * 2 + 1,
%         adauga(T, E, C1, Poz1, R).
% adauga([H | T], E, C, Poz, [H | R]) :-
%         C1 is C + 1,
%         adauga(T, E, C1, Poz, R).


% adauga(L, E, R) :- adauga(L, E, 0, 1, R).

adauga([], _, _, _, []).
adauga([H | T], E, Poz, Poz, [H, E | R]) :- !,
        C1 is Poz + 1,
        Poz1 is Poz * 2 + 1,
        adauga(T, E, C1, Poz1, R).
adauga([H | T], E, C, Poz, [H | R]) :-
        C1 is C + 1,
        adauga(T, E, C1, Poz, R).


adauga(L, E, R) :- adauga(L, E, 1, 1, R).
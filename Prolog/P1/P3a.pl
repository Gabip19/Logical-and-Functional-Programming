/*
    Sa se scrie un predicat care transforma o lista intr-o multime, in
 ordinea primei aparitii. Exemplu: [1,2,3,1,2] e transformat in [1,2,3].
*/

% contine(E, [E | _]) :- !.
% contine(E, [_ | T]) :- contine(E, T).

% inverseazaAux([], Col, Col).
% inverseazaAux([H | T], Col, R) :-
%         inverseazaAux(T, [H | Col], R).

% inverseaza(L, R) :- inverseazaAux(L, [], R).

% multimeAux([], []).
% multimeAux([H | T], R) :-
%     contine(H, T), !,
%     multimeAux(T, R).
% multimeAux([H | T], [H | R]) :-
%     multimeAux(T, R).

% multime(L, R) :-
%         inverseaza(L, R1),
%         multimeAux(R1, R).

stergeDublicat([], _, []).
stergeDublicat([E | T], E, R) :-
        !,
        stergeDublicat(T, E, R).
stergeDublicat([H | T], E, [H | R]) :-
        stergeDublicat(T, E, R).

multime([], []).
multime([H | T], [H | R]) :-
        stergeDublicat(T, H, R1),
        multime(R1, R).
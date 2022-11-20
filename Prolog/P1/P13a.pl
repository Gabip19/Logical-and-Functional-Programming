aparitii([], _, 0).
aparitii([E | T], E, Nr) :-
        !,
        aparitii(T, E, Nr1),
        Nr is Nr1 + 1.
aparitii([_ | T], E, Nr) :-
        aparitii(T, E, Nr).


eliminaRep([], []).
eliminaRep([H | T], R) :-
        T1 = T,
        aparitii(T1, H, Nr),
        Nr > 0,
        !,
        eliminaRep(T, R).
eliminaRep([H | T], [H | R]) :-
        eliminaRep(T, R).
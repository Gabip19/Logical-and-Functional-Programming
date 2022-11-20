/*
    a) Sa se inlocuiasca toate aparitiile unui element
dintr-o lista cu un alt element.
*/

inlocuire([], _, _, []):-!.
inlocuire([H|T], H, X, [X|R]):-!, inlocuire(T, H, X, R).
inlocuire([H|T], A, B, [H|R]):-inlocuire(T, A, B, R).
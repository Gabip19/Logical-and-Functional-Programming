/*
    Sa se scrie o functie care descompune o lista de numere intr-o lista de
 forma [ lista-de-numere-pare lista-de-numere-impare] (deci lista cu doua
 elemente care sunt liste de intregi), si va intoarce si numarul
 elementelor pare si impare.
*/

listeParImpar([], 0, 0, [], []).
listeParImpar([H | T], I1, P, [H | RI], RP) :-
        H mod 2 =:= 1, !,
        listeParImpar(T, I, P, RI, RP),
        I1 is I + 1.
listeParImpar([H | T], I, P1, RI, [H | RP]) :-
        listeParImpar(T, I, P, RI, RP),
        P1 is P + 1.

listeParImpar(L, I, P, [RI, RP]) :- listeParImpar(L, I, P, RI, RP).
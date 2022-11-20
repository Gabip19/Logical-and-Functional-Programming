% b. Sa se scrie un predicat care adauga dupa 1-ul, al 2-lea,
% al 4-lea, al8-lea ... element al unei liste o valoare v data.

% consult('P2b.pl').


/*
    adaugaLista(l1...ln, V, C, P) =
        vida                                        , n = 0 si C != P
        V                                           , n = 0 si C = P
        l1 + V + adaugaLista(l2...ln, V, C+1, P*2)  , n > 0 si C = P
        l1 + adaugaLista(l2...ln, V, C+1, P)        , n > 0 si C != P
    
    adaugaLista(L: Lista, V: Element, C: Intreg, P: Intreg, R: Lista)
    Modele de flux: (i, i, i, i, o), (i, i, i, i, i)
    L - lista pe care se lucreaza
    V - valoarea ce se va insera
    C - pozitia curenta in lista
    P - urmatoarea pozitie dupa care se va insera
    R - lista finala in care s-au inserat elementele
*/
adaugaLista([], V, C, C, [V]).
adaugaLista([], _, C, P, []) :- C \= P.
adaugaLista([H | T], V, C, P, R) :-
                C1 is C + 1,
                C1 = P,
                P1 is P * 2,
                adaugaLista(T, V, C1, P1, R1),
                R = [H, V | R1],
                !.
adaugaLista([H | T], V, C, P, R) :-
                C \= P,
                C1 is C + 1,
                adaugaLista(T, V, C1, P, R1),
                R = [H | R1].


/*
    adaugaPuteri(l1...ln, V) =
        adaugaLista(l1...ln, V, 0, 1)
    
    adaugaPuteri(L : Lista, V : Element, R : Lista)
    Modele de flux: (i, i, o), (i, i, i)
    L - lista pe care se lucreaza
    V - valoarea ce se va insera
    R - lista finala in care s-au inserat elementele
*/
adaugaPuteri(L, V, R) :- adaugaLista(L, V, 0, 1, R).
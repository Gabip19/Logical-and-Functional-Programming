;; 2. Definiti o functie care obtine dintr-o lista data lista tuturor atomilor
;; care apar, pe orice nivel, dar in aceeasi ordine.
;; De exemplu (((A B) C) (D E)) --> (A B C D E)

(defun liniarizeaza(l)
    (cond
        ( (null l) )
        ( (atom l) (list l) )
        ( T (mapcan #'liniarizeaza l) )
    )
)
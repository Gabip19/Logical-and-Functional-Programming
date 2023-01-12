;; 2.
;; a) Definiti o functie care selecteaza al n-lea element
;; al unei liste, sau NIL, daca nu exista.

(defun select(l nr)
    (cond
        ( (null l) NIL )
        ( (= nr 0) (car l) )
        ( T (select (cdr l) (- nr 1)) )
    )
)



;; b) Sa se construiasca o functie care verifica daca un atom
;; e membru al unei liste nu neaparat liniara.

(defun SAU(l)
    (cond
        ( (null l) NIL )
        ( T (or (car l) (SAU (cdr l))) )
    )
)

(defun apare(l e)
    (cond
        ( (null l) NIL )
        ( (eq l e) T )
        ( T (SAU (mapcar (lambda (l) (apare l e)) l)) )
    )
)



;; c) Sa se construiasca lista tuturor sublistelor unei liste.
;; Prin sublista se intelege fie lista insasi, fie un element
;; de pe orice nivel, care este lista. Exemplu: (1 2 (3 (4 5) (6 7)) 8 (9 10)) =>
;; ( (1 2 (3 (4 5) (6 7)) 8 (9 10)) (3 (4 5) (6 7)) (4 5) (6 7) (9 10) ).

(defun subliste(l)
    (cond
        ( (null l) () )
        ( (listp (car l)) (append (list (car l)) (subliste (car l)) (subliste (cdr l))) )
        ( T (subliste (cdr l)) )
    )
)

(defun sublistewrapper(l)
    (subliste (list l))
)



;; d) Sa se scrie o functie care transforma o lista liniara intr-o multime.

(defun nraparitii(l e)
    (cond
        ( (null l) 0 )
        ( (= e (car l)) (+ 1 (nraparitii (cdr l) e)) )
        ( T (nraparitii (cdr l) e) )
    )
)

(defun elimina(l)
    (cond
        ( (null l) () )
        ( (= (nraparitii (cdr l) (car l)) 0) (cons (car l) (elimina (cdr l))) )
        ( T (elimina (cdr l)))        
    )
)
;; 5.
;; a) Definiti o functie care interclaseaza cu pastrarea dublurilor
;; doua liste liniare sortate.

(defun interclasare (l p)
    (cond
        ( (null l) p )
        ( (null p) l )
        ( (< (car l) (car p)) (cons (car l) (interclasare (cdr l) p)) )
        ( T (cons (car p) (interclasare l (cdr p))) )
    )
)



;; b) Definiti o functie care substituie un element E prin elementele
;; unei liste L1 la toate nivelurile unei liste date L.

(defun substituie (l e l1)
    (cond
        ( (null l) () )
        ( (eq e (car l)) (append l1 (substituie (cdr l) e l1)) )
        ( (listp (car l)) (append (list (substituie (car l) e l1)) (substituie (cdr l) e l1)) )
        ( T (append (list (car l)) (substituie (cdr l) e l1)) )
    )
)
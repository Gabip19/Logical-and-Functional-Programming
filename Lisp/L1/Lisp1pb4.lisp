;; 4.

;; c) Sa se scrie o functie care plecand de la o lista data ca
;; argument, inverseaza numai secventele continue de atomi. Exemplu:
;; (a b c (d (e f) g h i)) ==> (c b a (d (f e) i h g))

(defun inverseaza (l)
    (cond
        ( (null l) () )
        ( T (append (inverseaza (cdr l)) (list (car l))) )
    )
)

(defun inverslista (l sublista)
    (cond
        ( (null l) sublista )
        ( (atom (car l)) (inverslista (cdr l) (cons (car l) sublista)) )
        ( T (append sublista (list (inverslista (car l) NIL)) (inverslista (cdr l) NIL)) )
    )
)


;; d) Sa se construiasca o functie care intoarce maximul atomilor
;; numerici dintr-o lista, de la nivelul superficial.

(defun maxsup (l)
    (cond
        ( (null l) most-negative-fixnum)
        ( (numberp (car l)) (max (car l) (maxsup (cdr l))) )
        ( T (maxsup (cdr l)) )
    )
)
;; 3. Sa se construiasca o functie care verifica daca un atom e membru al
;; unei liste nu neaparat liniara.

(defun SAU(l)
    (cond
        ( (null l) NIL )
        ( T (or (car l) (SAU (cdr l))) )
    )
)

(defun contine(l e)
    (cond
        ( (and (atom l) (eq l e)) T )
        ( (and (atom l) (not (eq l e))) NIL )
        ( T (SAU (mapcar (lambda (l) (contine l e)) l)) )
    )
)
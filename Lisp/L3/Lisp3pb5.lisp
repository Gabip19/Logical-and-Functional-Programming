;; 5. Definiti o functie care testeaza apartenenta unui nod
;; intr-un arbore n-ar reprezentat sub forma
;; (radacina lista_noduri_subarb1... lista_noduri__subarbn)
;; Ex: arborelele este (a (b (c)) (d) (e (f))) 
;; si nodul este 'b => adevarat

(defun SAU(l)
    (cond
        ( (null l) NIL )
        ( T (or (car l) (SAU (cdr l))) )
    )
)

(defun apare(l e)
    (cond
        ( (null l) NIL )
        ( (eq (car l) e) T )
        ( T (SAU (mapcar (lambda (arb) (apare arb e)) (cdr l))) )
    )
)
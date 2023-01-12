;; 3.
;; a) Definiti o functie care intoarce produsul a doi vectori.

(defun prodvectori(l p)
    (apply #'+ (mapcar #'* l p))
)



;; b) Sa se construiasca o functie care intoarce adancimea unei liste.

(defun adancime(l)
    (cond
        ( (atom l) 0 )
        (T (+ 1 (apply #'max (mapcar #'adancime l))))
    )
)



;; c) Definiti o functie care sorteaza fara pastrarea
;; dublurilor o lista liniara.

(defun eliminaval(l e)
    (cond
        ( (null l) l )
        ( (= (car l) e) (eliminaval (cdr l) e) )
        ( T (cons (car l) (eliminaval (cdr l) e)) )
    )
)

(defun sorteaza (l)
    (cond
        ( (null l) () )
        ( T 
            (SETQ minim (apply #'min l))
            (cons minim (sorteaza (eliminaval l minim))) 
        )
    )
)



; d) Sa se scrie o functie care intoarce intersectia a doua multimi.
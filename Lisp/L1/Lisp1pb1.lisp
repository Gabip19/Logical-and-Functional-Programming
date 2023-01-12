;; 1.
;; a) Sa se insereze intr-o lista liniara un atom a dat
;; dupa al 2-lea, al 4-lea, al 6-lea,....element.

(defun insert(l a poz)
    (cond
        ( (null l) NIL )
        ( (evenp poz) (cons (car l) (cons a (insert (cdr l) a (+ 1 poz)))) )
        ( T (cons (car l) (insert (cdr l) a (+ 1 poz))))
    )
)

(defun insertwrapper(l a)
    (insert l a 1)
)



;; b) Definiti o functie care obtine dintr-o lista data lista tuturor atomilor
;; care apar, pe orice nivel, dar in ordine inversa.
;; De exemplu: (((A B) C) (D E)) --> (E D C B A)
;; Ex: (a b c d) -> (d c b a)

(defun invers(l)
    (cond
        ( (null l) () )
        ( (atom (car l)) (append (invers (cdr l)) (list (car l))) )
        ( T (append (invers (cdr l)) (invers (car l))) )
    )
)



;; c) Definiti o functie care intoarce cel mai mare divizor comun al
;; numerelor dintr-o lista neliniara.
;; Ex: (16 8 4 10) -> 2

(defun cmmdc(a b)
    (cond
        ( (= b 0) a )
        ( T (cmmdc b (mod a b)) )
    )
)

(defun divizorl(l)
    (cond
        ( (null l) 0 )
        ( (numberp (car l)) (cmmdc (car l) (divizorl (cdr l))) )
        ( T (cmmdc (divizorl (car l)) (divizorl (cdr l))) )
    )
)



;; d) Sa se scrie o functie care determina numarul de aparitii ale
;; unui atom dat intr-o lista neliniara.

(defun aparitii(l e)
    (cond
        ( (null l) 0 )
        ( (eq l e) 1 )
        ( T (apply #'+ (mapcar (lambda (l) (aparitii l e)) l)) )
    )
)
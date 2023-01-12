;; productL(l1, l2, ..., ln) => 1, n=0
    ;;                              l1*productL(l2, l3, ..., ln), l1 numar
    ;;                              productL(l2, l3, ..., ln), n!=0 and l1 nu numar


; a) Sa  se  construiasca  o  functie  care  intoarce  produsul  atomilor  numerici dintr-o lista, de la nivelul superficial.

(defun productL (l)
    (cond
        ((null l) 1)
        ((numberp (car l)) (* (car l) (productL (cdr l))))
        (T (productL (cdr l)))
    )
)

; (productL '(1 A 2 3 (3 4 5) T)) 
; (productL '(1 5 2 3 (3 4 5) (2 3 4) 1))



;------------------------------------------------------------------------------------------------------------------------------

; c) Sa se determine rezultatul unei expresii aritmetice memorate in preordine pe o stiva.
;    Exemple:(+ 1 3) ==> 4(1 + 3)
;            (+ * 2 4 3) ==> 11((2 * 4) + 3)
;            (+ * 2 4 - 5 * 2 2) ==> 9 ((2 * 4) + (5 -(2 * 2))


(defun _expression (op a b)
	(cond
		((string= op "+") (+ a b)) 
		((string= op "-") (- a b))
		((string= op "*") (* a b))
		((string= op "/") (floor a b))
	)
)

(defun expression (l) 
    (cond
        ((null l) nil)
        ((and (and (numberp (cadr l)) (numberp (caddr l))) (atom (car l))) 
            (cons (_expression (car l) (cadr l) (caddr l)) (expression (cdddr l))))
        (T (cons (car l) (expression (cdr l))))
    )
)

(defun solve (l)
    (cond
        ((null (cdr l)) (car l))
        (T (solve (expression l)))
    )
)

; (solve '(+ * 2 4 - 5 * 2 2))
; (solve '(+ * 2 4 3))
; eval 

;------------------------------------------------------------------------------------------------------------------------------

; d) Definiti  o  functie  care,  dintr-o  lista  de  atomi,  produce  o  lista  de perechi (atom n),
;   unde atom apare in lista initiala de n ori.
;   De ex:(A B A B A C A) --> ((A 4) (B 2) (C 1)).

    ;; nr_app(l1, l2, ..., ln e) =>  0, n=0
    ;;                               1+nr_app(l2, l3, ..., ln e) l1=e
    ;;                               nr_app(l2, l3, ..., ln e) n!=0 and l1!=e

    ;; remov(l1, l2, ..., ln e) => nil, n=0
    ;;                             remov(l2, l3, ..., ln e), l1=e
    ;;                             (l1)+remov(l2, l3, ..., ln e), l1!=e and n!=0

    ;; freq(l1, l2, ..., ln) => nil, n=0
    ;;                           (l1, nr_app(l1, l2, ..., ln l1))+freq(remov(l2, l3, ..., ln) l1), n!=0

(defun nr_app (l e)
    (cond
        ((null l) 0)
        ((equal (car l) e) (+ 1 (nr_app (cdr l) e)))
        (T (nr_app (cdr l) e))
    )
)

(defun remov (l e)
    (cond
        ((null l) nil)
        ((equal (car l) e) (remov (cdr l) e))
        (T (cons (car l) (remov (cdr l) e)))
    )
)

(defun freq (l)
    (cond
        ((null l) nil)
        (T (cons (list (car l) (nr_app l (car l))) (freq (remov (cdr l) (car l)))))
    )
)

; (freq '(A B A B A C A))
; (freq '(A A A A A A C))

;------------------------------------------------------------------------------------------------------------------------------

; b) Sa  se  scrie  o  functie  care,  primind  o  lista,  intoarce  multimea  tuturor perechilor din lista.
; De exemplu: (a b c d) --> ((a b) (a c) (a d) (b c) (b d) (c d))

    ;; pair(e l1, l2, ..., ln) => nil, n=0
    ;;                            (e, l1)+pair(e l2, l3, ..., ln) n!=0

    ;; pairs(l1, l2, ..., ln) => nil, l1=null
    ;;                           (pair(l1 l2, l3, ..., ln))+pairs(l2, l3, ..., ln)




 (defun pair (e l)
    (cond
        ((null l) nil)
        (T (cons (list e (car l)) (pair e (cdr l))))
    )
)

(defun pairs (l)
    (cond
        ((null (car l)) nil)
        (T (append (pair (car l) (cdr l)) (pairs (cdr l))))  
    )
)

; (pairs '(A B C D))
; (pairs '(1 B C D E))
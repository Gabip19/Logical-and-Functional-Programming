;; a) Sa se scrie o functie care intoarce diferenta a doua multimi.

;; MODEL MATEMATIC
;; contine(l1...ln, e) =
;;        False                   , n = 0
;;        True                    , e = l1 si n > 0
;;        contine(l2...ln, e)     , altfel
;;
;; l -> lista in care se verifica daca apare e
;; e -> elementul a carui aparitie se verifica

(defun contine(l e)
    (cond
        ( (null l)  NIL )
        ( (= (car l) e)     T )
        ( T    (contine (cdr l) e) )
    )
)

;; MODEL MATEMATIC
;; diferenta(l1...ln, p) =
;;        vida                            , n = 0
;;        l1 + diferenta(l2...ln, p)      , l1 nu apartine p
;;        diferenta(l2...ln, p)           , altfel
;; 
;; l -> lista din care se face diferenta
;; p -> lista care se scade

(defun diferenta(l p)
    (cond
        ( (null l)  NIL )
        ( (not (contine p (car l)))     (cons (car l) (diferenta (cdr l) p)) )
        ( T     (diferenta (cdr l) p) )
    )
)

;; (diferenta '(1 2 3 4 5) '(2 3 4 5 6 7))





;; b) Definiti o functie care inverseaza o lista impreuna cu toate sublistele sale de pe orice nivel.

;; MODEL MATEMATIC
;; inverseaza(l1...ln) =
;;        vida                                    , l este vida
;;        inverseaza(l2...ln) + l1                , l1 atom
;;        inverseaza(l2...ln) U inverseaza(l1)   , l1 lista
;; 
;; l -> lista care se inverseaza

(defun inverseaza(l)
    (cond
        ( (null l)  ())
        ( (atom (car l))    ( append (inverseaza (cdr l)) (list (car l)) ) ) 
        ( T     ( append (inverseaza (cdr l)) (list (inverseaza (car l))) ) )
    )
)

;; (inverseaza '(B (2 (2 3) A) 3 6))





;; c) Dandu-se o lista, sa se construiasca lista primelor elemente ale tuturor
;; elementelor lista ce au un numar impar de elemente la nivel superficial.
;; 
;; Exemplu: (1 2 (3 (4 5) (6 7)) 8 (9 10 11)) => (1 3 9).

;; MODEL MATEMATIC
;; nrelem(l1...ln) =
        ;; 0                       , n = 0
        ;; 1 + nrelem(l2...ln)     , altfel
;;
;; l -> lista pt care se numara elementele

(defun nrelem(l)
    (cond
        ( (null l) 0 )
        ( T (+ 1 (nrelem (cdr l))) )
    )
)

(defun nrelemimpar(l)
    (= (MOD (nrelem l) 2) 1)
)

;; MODEL MATEMATIC
;; listaimpare(L) =
;;        vid                        , L atom
;;        l1 + U(listaimpare(li))    , L = l1...ln lista si n impar
;;            i=1
;;        U(listaimpare(li))         , L = l1...ln lista si n par
;;       i=1

(defun listaimpare(l)
    (cond
        ( (atom l) NIL )
        ( (nrelemimpar l)   (cons (car l) (apply 'append (mapcar 'listaimpare (cdr l)))) )
        ( T     (apply 'append (mapcar 'listaimpare (cdr l))) )
    )
)

;; #'listaimpare ???
;; (listaimpare '(1 2 4 (3 (4 5) (6 4 7)) 8 (9 (4 10 (6)) 11)))





;; d) Sa se construiasca o functie care intoarce suma atomilor numerici dintr-o lista,
;; de la nivelul superficial.

;; MODEL MATEMATIC
;; suma(l1...ln) =
;;        0                       , n = 0
;;        l1 + suma(l2...ln)      , l1 numar si n > 0
;;        suma(l2...ln)           , altfel
;; 
;; l -> lista pt care se calculeaza suma

(defun suma(l)
    (cond
        ( (null l) 0 )
        ( (numberp (car l)) (+ (car l) (suma (cdr l))) )
        ( T (suma (cdr l)) )
    )
)
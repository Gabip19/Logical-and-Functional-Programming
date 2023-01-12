;; 6. Sa se construiasca o functie care intoarce produsul
;; atomilor numerici dintr-o lista, de la orice nivel.

;; MODEL MATEMATIC
;; produs(L) =
;;        L                  , L numar
;;        1                  , L atom dar L nu e numar
;;        PI(produs(li))     , L = l1...ln
;;    i = 1 -> n
;;
;; L -> lista pentru care se calculeaza produsul

(defun produs(l)
    (cond
        ( (numberp l) l )
        ( (atom l) 1 )
        ( T (apply #'* (mapcar #'produs l )) )
    )
)

;; (produs '(3 ((10) (5) ((7) 5) 2) (2 5 (3)))) -> 315000
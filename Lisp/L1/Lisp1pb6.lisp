;; 6.
;; c) Sa se determine numarul tuturor sublistelor unei
;; liste date, pe orice nivel. Prin sublista se intelege fie
;; lista insasi, fie un element de pe orice nivel, care este lista.
;; Exemplu: (1 2 (3 (4 5) (6 7)) 8 (9 10)) => 5
;; (lista insasi, (3 ...), (4 5), (6 7), (9 10)).

(defun nrsubliste (l)
    (cond
        ( (atom l) 0 )
        ( T (+ 1 (apply #'+ (mapcar #'nrsubliste l))) )
    )
)
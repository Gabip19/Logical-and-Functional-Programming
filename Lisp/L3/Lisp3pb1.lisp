;; 1. Sa se construiasca o functie care intoarce adancimea unei liste.

;; EX:  (1 2 3 4 5) -> 0?
;;      (1 (2) (3 (4))) -> 3?

;;  adancime(L) =
;;      -1                                                   , L atom
;;      0                                                    , L lista si n = 0
;;      1 + max(adancime(l1), adancime(l2) ... adancime(ln)) , L = l1...ln

(defun adancime(l)
    (cond
        ( (null l) 0 )
        ( (atom l) -1 )
        (T (+ 1 (apply #'max (mapcar #'adancime l))))
    )
)
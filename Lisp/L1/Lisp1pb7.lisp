;; c) Sa se inlocuiasca fiecare sublista a unei liste cu ultimul
;; ei element. Prin sublista se intelege element de pe primul nivel,
;; care este lista.
;; Exemplu: (a (b c) (d (e (f)))) ==>
;; (a c (e (f))) ==> (a c (f)) ==> (a c f)
;; (a (b c) (d ((e) f))) ==> (a c ((e) f)) ==> (a c f)

;; extragedr(l1...ln)
;;      l1                      , n = 1 si l1 atom
;;      extragedr(l1)           , n = 1 si l1 lista
;;      extragedr(l2...ln)      , n > 1

(defun extragedr (l)
    (cond
        ( (atom l) l )
        ( (= (length l) 1) (extragedr (car l)) )
        ( (> (length l) 1) (extragedr (cdr l)) )
    )
)

(defun subcuultim (l)
    (mapcar #'extragedr l)
)
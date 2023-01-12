;; 4. Sa se construiasca o functie care intoarce suma
;; atomilor numerici dintr-o lista, de la orice nivel.

(defun suma(l)
    (cond
        ( (numberp l) l )
        ( (atom l) 0 )
        ( T (apply #'+ (mapcar #'suma l)) )
    )
)
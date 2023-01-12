;; 7. Se da un arbore de tipul (1). 
;; Sa se precizeze nivelul pe care apare un nod x in arbore.
;; Nivelul radacii se considera a fi 0.
;; (nod nr-subarbori lista-subarbore-1 lista-subarbore-2 ...)

;; MODEL MATEMATIC
;; parcurge(x, nod, nivel, nrcopii, l) =
;;        nivel                                                                   ,  nod = x
;;        false                                                                   ,  l vid (am terminat de parcurs tot arborele)
;;        l                                                                       ,  nrcopii = 0 (am terminat de parcurs subarborele curent)
;;        m = parcurge(x, l1, nivel+1, nrcopii, l2, l3)                           ,  nrcopii > 0 si m e numar (am gasit nodul in subarbore)
;;        parcurge(x, nod, nivel, nrcopii-1, parcurge(x, l1, nivel+1, nrcopii, l2, l3))    ,  altfel
        

(defun parcurge(x nod nivel nrcopii l)
        (cond
            ((eq x nod) nivel)
            ((null l) nil)
            ((= nrcopii 0) l)
            (t 
                (SETQ rez (parcurge x (car l) (+ nivel 1) (cadr l) (cddr l)))
                (cond 
                    ((listp rez) (parcurge x nod nivel (- nrcopii 1) rez))
                    (t rez)
                )
            )
        )
)

(defun rezolva(x l)
    (parcurge x (car l) 0 (cadr l) (cddr l))  
)
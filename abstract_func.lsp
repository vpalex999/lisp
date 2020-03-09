(defun fold(g s a)
    (if (null s) a (funcall g (fold g (rest s) a) (first s)))
)

(defun mysumm(s) (fold '+ s 0))
(defun myproduct(s) (fold '* s 1))


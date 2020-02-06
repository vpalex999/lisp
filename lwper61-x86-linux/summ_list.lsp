(defun sumlist(s)(if(null s) 0 (+ (first s) (sumlist(rest s)))))

/*return the length of list*/
(defun mylength(s) (if(null s) 0 (1+ (mylength(rest s)))))
/**/
(defun mf(s)(cond ((null s) 0) ((and (numberp (first s)) (> (first s) 0)) (+ 1 (mf(rest s)))) (t (mf(rest s)))))


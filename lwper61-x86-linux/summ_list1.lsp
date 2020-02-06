
(defun myf(s)(cond ((null s) 0) ((and (numberp (first s)) (> (first s) 0)) (1+ (myf(rest s)))) (t (myf(rest s))))

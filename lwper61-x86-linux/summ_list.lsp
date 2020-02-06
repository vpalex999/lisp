(defun sumlist(s)(if(null s) 0 (+ (first s) (sumlist(rest s)))))

(defun mylength(s) (if(null s) 0 (1+ (mylength(rest s)))))
(defun mf(s)(cond ((null s) 0) ((and (numberp (first s)) (> (first s) 0)) (+ 1 (mf(rest s)))) (t (mf(rest s)))))

(defun count_positive_digits_list(s)
    (cond 
        ((null s) 0)
        ((and (numberp (first s)) (>(first s) 0)) (+ 1 (count_positive_digits_list(rest s))))
        (t (count_positive_digits_list(rest s)))
    )    
)

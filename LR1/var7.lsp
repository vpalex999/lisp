
#|
Вариант 7
1. Определите функцию, которая меняет местами первый и последний эле-
менты списка, оставляя остальные на своих местах.

f1 `()
()

f1 `(1)
(1)

f1 `(1 2)
(2 1)

f1 `(1 2 3)
(3 2 1)

|#


(defun f1(s)
    (let ((last_el (get_last_el s)))
        (cond
            ((null s) nil)
            ((eq (rest s) nil) s)
            (t (cons last_el (replace_last_el (first s) (rest s))))
        )
    )
)

; заменить последний элемент списка -> el.
#|
replace_last_el `1 `()
(1)

replace_last_el `1 `(2)
(1)

replace_last_el `1 (2 3)
(2 1)

|#

(defun replace_last_el(el s)
    (cond
        ((null s) (cons el nil))
        ((null (rest s)) (cons el nil))
        (t (cons (first s) (replace_last_el el (rest s))))
    )
)


; получить последний эл-т списка.
#|
get_last_el `()
NIL

get_last_el `(1)
1

get_last_el `(1 2)
2

|#


(defun get_last_el(s)
    (cond 
        ((null s) nil)
        ((eq (rest s) nil) (first s))
        (t (get_last_el (rest s)))
    )
)


#|
2. Определите функцию (summa_digits n), результатом которой является сум-
ма цифр натурального числа n.

|#


#|
3. Определите функцию (f s), которая из данного списка s удаляет последний
элемент.

f3 `()
()

f3 `(1)
()

f3 `(1 2)
(1)

|#

(defun f3(s)
    (cond
        ((null s) nil)
        ((eq (rest s) nil) nil)
        (t (cons (first s)(f3 (rest s))))
    )
)
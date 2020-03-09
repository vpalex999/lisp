#|
Вариант 3
1. Напишите функцию, определяющую глубину первого вхождения элемента
y в список w.

f1 '1 ()
0

f1 '1 '(1)
1

f1 '1 '(2 3 4 1)
4
|#

(defun f1(el s)
    (in_f1 el s 1)
)


(defun in_f1(el s count)
    (cond
        ((null s) 0)
        ((eq el (first s)) count)
        (t (in_f1 el (rest s) (+ 1 count)))
    )
)

#|
2. Напишите функцию, которая делает из списка множество, т.е. удаляет все
повторяющиеся элементы.
f2 '()
()

f2 '(1)
(1)

f2 '(1 2 2)
(1 2)

del_el '1 ()
()

del_el '1 '(1 2 1 2)
(2 2)
|#

(defun f2(s)
    (labels
        (
            (del_el(n s)
                (cond 
                    ((null s) nil)
                    ((eq n (first s)) (del_el n (rest s)))
                    (t (cons (first s) (del_el n (rest s))))
                )
            )
        )
        (cond
            ((null s) nil)
            (t (cons (first s) (f2 (del_el (first s) (rest s)))))
        )
    )
)


#|
3. Напишите функцию (exists p x), которая проверяет
"Существует ли элемент списка x, удовлетворяющий предикату p?"
(p - функция или функциональное имя ).

exist 'zerop '(1 2 3)
NIL

exist 'zerop '(1 2 0)
T

exists 'zerop '(0)
T

|#

(defun myor(x y)
    (if x t y)
)

(defun exists(p s)
    (reduce 'myor (mapcar p s):initial-value nil)
)

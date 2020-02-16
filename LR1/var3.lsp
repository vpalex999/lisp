#|
Вариант 3
1. Напишите с помощью композиции условных выражений функции
от четырех аргументов (and4 x1 x2 x3 x4) и (or4 x1 x2 x3 x4), совпадающие с
встроенными функциями and и or от четырех аргументов.

test:
and4 (= 5 5)(< 6 7)(> 8 1)(/= 5 7)
T

and4 (= 5 5)(< 6 7)(> 8 1)(/= 5 5)
NIL

or4 (= 5 6)(< 6 7)(> 8 1)(/= 5 5)
T

or4 (= 5 6)(< 6 5)(> 8 10)(/= 5 5)
NIL

|#

(defun and4(x1 x2 x3 x4)
    (if x1 (if x2 (if x3 (if x4 t))))
)

(defun or4(x1 x2 x3 x4)
    (if x1 t
        (if x2 t
            (if x3 t
                (if x4 t
                    NIL)
            )
        )
    )
)

#|
2. Напишите функцию, вычисляющую последний элемент списка.

tests:

last_element `()
NIL

last_element `(1)
1

last_element `(1 2)
2

|#

(defun last_element(s)
    (cond
        ((null s) nil)
        ((null (rest s)) (first s))
        (t (last_element(rest s)))
    )
)

#|
3. Напишите функцию от двух аргументов x и n , которая создает список из n
раз повторенных элементов x.

create_list(x n)

tests:

create_list 1 0
NIL

create_list 1 1
(1)

create_list 1 2
(1 1)

|#

(defun create_list(x n)
    (cond
        ((= n 0) nil)
        (t (cons x (create_list x (- n 1))))
    )
)
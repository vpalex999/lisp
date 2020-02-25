#|
Вариант 2

1. Напишите функцию, которая выдает истину, если ее аргумент удовлетворяет
хотя бы одному из следующих условий:
а) является списком из двух элементов;
б) является списком из двух атомов;
в) является списком из трех элементов.

test:

list_is_two `()
NIL

list_is_two `(1)
NIL

list_is_two `(1 2)
T

list_is_two `(1 `(1))
T

list_is_two `(1 2 3)
T

list_is_two `(1 2 3 4)
NIL

|#





#|
2. Определите возведение в целую степень (^ x n) через умножение и деление.

tests:
^ 2 0
1

^ 2 1
2

^ 2 2
4

^ 2 -1
0.5

^ 0 1
0

|#

(defun ^(x n)
    (cond
        ((= n 0) 1)
        ((minusp n) (/ 1 (^ x (- n))))
        (t (* x (^ x (- n 1))))
    )
)


#|
3. Напишите функцию (fullength x), считающую полное количество атомов
(не равных nil) в списке x.

tests:
fullength `()
0

fullength `(1)
1

fullength `(1 2)
2

fullength `(1 2 a)
3

fullength `(1 2 a `(a))
3
|#

(defun fullength (s)
    (cond
        ((null s) 0)
        ((atom (first s)) (+ 1 (fullength(rest s))))
        (t (fullength(rest s)))
    )
)

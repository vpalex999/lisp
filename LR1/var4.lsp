#|
Вариант 4
1. Напишите функцию, осуществляющую циклическую перестановку
элементов в списке, т.е. (f g h j) -> (g h j f).

тесты:

shift_list `()
NIL

shift_list `(1)
(1)

shift_list `(f g h j)
(G H J F)

|#

(defun shift_list(s)
    (if
        (null s) s    ; если список пустой
            (shift_list_add (first s) (rest s))    ; функция с накапливающим параметром
    )
)

(defun shift_list_add(n s)
    (cond
        ((null s) (cons n nil)) ; граничное значение для завершения цикла
        (t (cons (first s) (shift_list_add n (rest s)))); цикл
    )
)




#|
2. Напишите функцию, которая из данного одноуровнего списка строит спи-
сок списков его элементов, например, (a b) -> ((a) (b)).

tests:

list_of_lists `()
NIL

list_of_lists `(1)
((1))

list_of_lists `(1 2)
((1) (2))

list_of_lists `(1 2 e)
((1) (2) (E))


|#

(defun list_of_lists(s)
    (labels ((cons_list(ss)(cons ss nil)))
        (cond
            ((null s) nil)  ; если список - пустой
            ((null (rest s)) (cons_list s))  ; если список - 1 эл. то возвращаем его как список в списке
            (t (cons (cons_list(first s)) (list_of_lists(rest s)))) ; цикл
        )
    )
)

#|
3. Определите функцию, зависящую от двух аргументов u и v, являющихся
списками, которая вычисляет список всех элементов u, не содержащихся в v.

list_reject `() `()
nil

list_reject `(a) `()
(a)

list_reject `() `(b)
nil

list_reject `(a b) `(a)
(b)

list_reject `(a b c) `(b c)
(a)

list_reject `(a b a) `(a)
(b)

|#

(defun list_reject(u v)
    (cond
        ((null u) nil)
        ((null v) u)
        ((in_list (first u) v) (list_reject (rest u) v))
        (t (cons (first u) (list_reject (rest u) v)))
    )
)

#|
in_list `a `()
nil

in_list `a `(a)
T

in_list `a `(b)
nil

|#

(defun in_list(n s)
    (cond
        ((null s) nil)
        ((eq n (first s)) t)
        (t (in_list n (rest s)))
    )
)
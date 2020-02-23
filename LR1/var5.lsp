#|
Вариант 5
1. Определите функцию (f a b c), которая равна истине тогда и только тогда,
когда из отрезков с длинами a,b и c можно построить треугольник.

Чтобы из трех отрезков можно было составить треугольник,
необходимо и достаточно, 
чтобы сумма длин любых двух отрезков была строго больше третьего.

f 0 0 0
nil

f 5 6 4
T

f 6 5 3
T

|#

(defun f(a b c)
    (and
     (< c (+ a b))
     (< a (+ b c))
     (< b (+ c a))
    )
)


#|
2. Определите функцию, зависящую от двух аргументов u и v, являющихся
списками, которая вычисляет список всех элементов, содержащихся либо в u,
либо в v, но не одновременно в u и v.

f2 `() `()
()

f2 `(a) `()
(a)

f2 `() `(a)
(a)

f2 `(a b) `(c)
(a b c)

f2 `(a b) `(b c)
(a c)
|#

; не обрабатывается множественное вхождение эл-та
; не обрабатываются подсписки
(defun f2(u v)
    (cond
        ((null u) (cons_lists u v))
        ((in_list (first u) v) (f2 (rest u)(del_el (first u) v)))
        (t (cons (first u)(f2 (rest u) v)))
    )
)

; обрабатывается множественное вхождение эл-та
; не обрабатываются подсписки
; f2_set `(a b a) `(a b c)
; (C)

(defun f2_set(u v)

    (if (null u) v
        ; else
        (let ((uu (list_to_set u))
              (vv (list_to_set v))
             )
            (f2 uu vv)
        )
    )
)


; преобразовать список в множество
(defun list_to_set(u)
    (let ((new_list (del_el_all (first u)(rest u))))
     (cond
         ((null u) nil)
         (t (cons (first u)(list_to_set new_list)))
     )
    )
)


; сложить два списка
#|
cons_lists `() `()
()

cons_lists `(a) `()
(a)

cons_lists `(a) `(b)
(a b)
|#

(defun cons_lists(u v)
    (cond 
        ((and (null u)(null v)) nil)
        ((null u) v)
        ((null v) u)
        (t  (cons (first u) (cons_lists (rest u) v )))
    )
)

; n в списке
(defun in_list(n s)
    (cond
        ((null s) nil)
        ((eq n (first s)) t)
        (t (in_list n (rest s)))
    )
)

(defun del_el(x s)
    (cond
        ((null s) nil)  ; если список s — пуст, то результат — список s
        ((eql(first s)x) (rest s))  ; если (first s) совпадает с элементом x
        (t (cons (first s) (del_el x (rest s))))   ; иначе рекурсивно вызываем
    )
)

(defun del_el_all(x s)
    (cond
        ((null s) nil)  ; если список s — пуст, то результат — список s
        ((eql(first s)x) (del_el_all x (rest s)))  ; если (first s) совпадает с элементом x
        (t (cons (first s) (del_el_all x (rest s)))   ; иначе рекурсивно вызываем
        )
    )
)

#|
3. Напишите функцию, осуществляющую замену элементов списка y на соот-
ветствующие элементы списка x в списке w, например,
y=(a b), x=(1 2), w=((a b) a (c (a (a d)))) -> ((1 2) 1 (c (1 (1 d)))).
|#

(defun f3(w)
    (let (
          (y (quote (a b)))
          (x (quote (1 2)))
         ) 
     (cond
         ((null w) nil)
         ((listp (first w)) (cons (f3 (first w)) (f3 (rest w))))
         ((in_list (first w) y) (cons (get_x (first w) y x) (f3 (rest w))))
         (t (cons (first w) (f3 (rest w))))
     )
    )
)

; получить значение из списка x по значению из списка y. 
(defun get_x(n y x)
    (cond
     ((eq n (first y)) (first x))
     (t (get_x n (rest y) (rest x)))
    )
)

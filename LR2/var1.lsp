#|
Вариант 1
1. Определите функцию, зависящую от одного аргумента, которая по данному
списку вычисляет список его элементов, встречающихся в нем более одного
раза. Проверьте, как она будет работать на примере '(a a a a b a).

f1 `()
NIL

f1 `(a b c)
NIL

f1 `(a b a a a a)
(a)

|#

(defun f1(s)
    (cond
        ((null s) nil)
        ((member (first s) (rest s)) (cons (first s) (f1 (del_el_all (first s) s))))
        (t (f1 (rest s)))
    )
)


; удаление всех вхождений элемента в список
#|
del_el_all  `1 `()
NIL

del_el_all `1 `(1)
()

del_el_all  `1 `(1 2)
(2)

del_el_all `1 `(1 2 1 2 3)
(2 2 3)

|#

(defun  del_el_all(n s)
    (cond
        ((null s) nil)
        ((eq (first s) n) (del_el_all n (rest s)))
        (t (cons (first s) (del_el_all n (rest s))))
    )
)


#|
2. Определите функцию, зависящую от двух аргументов u и n, которая по
данному списку строит список его элементов, встречающихся в нем не менее
n раз. Проверьте работу этой функции на примере (a a b a c b c a b b d a b) для
n=1,2,5,0.

f2 1 `()
()

f2 0 `(1 2)
()

f2 1 `(1 2)
(1 2)

f2 2 `(1 2)
()

f2 2 `(1 2 3 2)
(2)


|#

(defun f2(n s)
    (let (
           (new_s (del_el_all (first s) s))
           (occur_el (number_occurence_el (first s) s))
         )
         (cond
             ((null s) nil)
             ((= n 0) nil)
             ((<= n occur_el) (cons (first s) (f2 n new_s)))
             (t (f2 n new_s))
         )
    )
)


; выдает T, если количество вхождений эл-та в список не менее n раз
#|
number_occurence_el `1 `(1)
1

number_occurence_el`1 `()
0

number_occurence_el `1 `(1 1)
2

number_occurence_el `1 `(2)
0

|#
(defun number_occurence_el (el s)
    (cond
        ((null s) 0)
        ((eq el (first s)) (+ 1 (number_occurence_el el (rest s))))
        (t (number_occurence_el el (rest s)))
    )
)


#|
3. Используя функционалы, напишите функцию, которая из данного списка
строит список списков его элементов, например, (a b) -> ((a) (b)).

f3 '()
()

f3 '(1)
((1))

f3 '(1 2)
((1) (2))
|#

(defun f3(s)
    (cond
        ((null s) nil)
        (t (mapcar (lambda(x) (cons  x nil)) s))
    )
)
#|
Задача 1
Напишите функцию, вычисляющую полное число подсписков, входящих в
данный список на любом уровне. Для списка (a b ((a) d) e) оно равно двум.
|#

; Предикат (p x) выясняет является ли список одноуровневым

#|
p `()
T

p `(1 (x))
NIL

|#
(defun p(x)
    (cond 
        ((null x) t)
        ((listp (first x)) nil)
        (t (p (rest x)))
    )
)

(defun f1(x)
    (cond
        ((atom x) 0)
        ((p x) 0)
        (t (if (listp (first x)) 
                (+ 1 (f1 (first x)) (f1 (rest x))) 
             (f1 (rest x))   
            )
        )
    )
)

#|
Задача 2
Напишите функцию, удаляющую повторные вхождения элементов в список,
например, (a b c d d a) -> (a b c d)
|#

(defun f2(x)
    (labels 
        ((in_f (y z) 
                    (cond 
                        ((null y) z)
                        ((member (first y) z) (in_f (rest y) z))
                        (t (in_f (rest y) (append z (list(first y)))))
                    )     
         )
        )
     (in_f x nil)
    )
)

#|
Задача 3
Напишите функцию, строящую список всех подмножеств данного множества.
встроенная функция (union list1 list2) создает список всех элементов, входящих
в список list1 или в list2 (объединение множеств):
; (union '(1 2 3) '(2 5 7 1)) => ( 7 5 1 2 3)
|#

(defun f3(s)
    (if (null s) (list s)
        (union 
            (mapcar (lambda (x) (cons (car s) x)) (f3 (cdr s)))
            (f3 (cdr s))
        )
    )
)
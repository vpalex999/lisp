#|
Вариант 6
1. Определите функцию (f a b c), которая вычисляет список корней квадрат-
ного уравнения a*x^2+b*x+c=0 (если корней нет, то список пустой).

f1 2 3 5
()

f1 2 5 1
(-2.28 -0.21)

|#

(defun f1(a b c)
    (let (
          (d (- (* b b)(* 4 (* a c))))
         )
     (cond
        ((>= d 0) (cons (/ (- (- b) (sqrt d)) (* 2 a))
                        (/ (+ (- b) (sqrt d)) (* 2 a))
                  )
        )
        (t nil)
     )
    )
)



#|
2. Напишите функцию, аналогичную встроенной функции замены subst в спи-
ске s выражения x на y, но производящую взаимную замену x на y, т.е. x->y,
y->x.

mysubst x y s

mysubst `qq `b `()
()

mysubst `qq `b `(z)
(z)

mysubst `qq `b `(a b c) ; y->x (b -> qq)
(a qq c)


mysubst `qq `b `(a qq c) ; x -> y (qq -> b)
(a b c)

mysubst `qq `b `(s d b r qq)
(s d qq r b)


|#

(defun mysubst(x y s)
    (cond
        ((null s) nil)
        ((eql x (first s)) (cons y (mysubst x y (rest s))))
        ((eql y (first s)) (cons x (mysubst x y (rest s))))
        (t (cons (first s) (mysubst x y (rest s))))
    )
)




#|
3. Определите функцию (f s), результатом которой является список, полу-
чающийся после удаления на всех уровнях всех положительных элементов
списка чисел s.
f3 `()
nil

f3 `(-1)
(-1)

f3 `(-1 2)
(-1)

f3 `(0 -1 -5 6)
(-1 -5)

f3 `(0 (-1 2) -5 6)
((-1) -5)

|#

(defun  f3(s)
    (cond
        ((null s) nil)
        ((listp (first s)) (cons (f3 (first s)) (f3 (rest s))))
        ((>= (first s) 0) (f3 (rest s)))
        (t (cons (first s) (f3 (rest s))))
    )
)

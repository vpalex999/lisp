; Косвенная рекурсия
#|
Имеется натуральное число n, требуется
определить, является ли количество единиц в двоичном представлении числа n четным или нечетным.
Эту задачу можно решить с помощью двух взаимно рекурсивных логических функций

• (even-ones n) выдает «истину», если количество единиц четно;
• (odd-ones n) выдает «истину», если количество единиц нечетно.
|#

(defun even_ones(n) ; выдает «истину», если количество единиц четно
    (cond
        ((zerop n) t)
        ((zerop (mod n 2))
            (even_ones (truncate (/ n 2)))
        )
        (t
            (odd_ones (truncate (/ n 2)))
        )
    )
)

(defun odd_ones(n)  ; выдает «истину», если количество единиц нечетно
    (cond
        ((zerop n) nil)
        ((zerop (mod n 2))
            (odd_ones (truncate (/ n 2)))
        )
        (t
            (even_ones (truncate (/ n 2)))
        )
    )
)

; Использование накапливающего параметра

(defun myreversel(s)
    (labels
        (
            (f(x y)
              (if (null x) y
                (f(rest x) (cons (first x)y))
              )
            )
        )
        (f s nil)
    )
)

#|
Рассмотрим задачу нахождения суммы и произведения эле-
ментов списка чисел (результат выдается в виде списка из двух
значений).
|#

; 1 вариант
; программирование «в лоб»

(defun mysumpr1(x)
    (if (null x) (list 0 1)
        ; блок else - возвращаем список (сумма произведение)
        (list (+ (first x)(first (mysumpr1(rest x)))) ; это сумма
              (* (first x)(second (mysumpr1 (rest x)))) ; это произведение
        )
    )
)

; 2 вариант
; использование let (локальная переменная)

(defun mysumpr2(x)
    (if (null x) (list 0 1)
        (let (  ; определит локальную переменную z
                (z (mysumpr2(rest x))) ; z = рекурсивному вызову
             ) 
         (list (+ (first x) (first z))
               (* (first x) (second z))
         )
        )
    )
)


; 3 вариант
; еще одно использование let (локальная переменная)

(defun mysumpr3(x)
    (if (null x) (list 0 1)
     ; else
     (let (
           (n (first x))
           (z (mysumpr3(rest x)))
          )
      (list (+ n (first z))
            (* n (second z))
      )
     )
    )
)


; 4 вариант
; еще одно использование let

(defun mysumpr4(x)
    (if (null x) (list 0 1)
    ; else
     (let (
            (n (first x))
            (z (mysumpr4(rest x)))
            )
      (let (
            (a (first z))
            (b (second z))
           )
       (list (+ n a)(* n b))))
    )
)


; 5 вариант
; использование накапливающих параметров

(defun mysumpr5(x)
    (mysp x 0 1)
)

(defun mysp(x s p)
    (if (null x) (list s p)
     ; else
     (
         mysp (rest x) (+ (first x) s) (* (first x) p)
     )
    )
)


; 6 вариант
; использование накапливающих параметров и локальной функции

(defun mysumpr6(x)
    (labels (
                (locsp(y s p)
                    (if (null y) (list s p)
                     ; else
                     (locsp(rest y)(+ s (first y))(* p(first y)))
                    )
                )
            )
     (locsp x 0 1)
    )
)
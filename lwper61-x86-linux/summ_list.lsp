(defun sumlist(s)(if(null s) 0 (+ (first s) (sumlist(rest s)))))

(defun mylength(s) (if(null s) 0 (1+ (mylength(rest s)))))
(defun mf(s)(cond ((null s) 0) ((and (numberp (first s)) (> (first s) 0)) (+ 1 (mf(rest s)))) (t (mf(rest s)))))

#|
• если список s — пуст, то результат — 0;
• если (first s) положительное число, то результат на 1
  больше рекурсивного вызова (f (rest s));
• иначе — результат равен результату рекурсивного вызова
(f (rest s)).
|#

(defun count_positive_digits_list(s)
    (cond 
        ((null s) 0)
        ((and (numberp (first s)) (>(first s) 0)) (+ 1 (count_positive_digits_list(rest s))))
        (t (count_positive_digits_list(rest s)))
    )    
)

#|
Подсчет положительных чисел в списке, если он содержит списки.
• если список s — пуст, то результат — 0;
• если (first s) — список, находим сумму рекурсивных вызовов (f (first s)) и (f (rest s));
• если (first s) положительное число, то результат на 1
  больше рекурсивного вызова (f (rest s));
• иначе — результат равен результату рекурсивного вызова (f (rest s)).

тест:
count_positive_digits_list_2 `(2 2)
2

count_positive_digits_list_2 `(2 `(2 3) 4)
4

|#
(defun count_positive_digits_list_2(s)
    (cond
        ((null s) 0)    ; если список пуст
        ((listp (first s))  ; если элемент - сам список
            (+ (count_positive_digits_list_2(first s)) (count_positive_digits_list_2(rest s))) ; находим сумму рекурсивных вызовов
        )
        ((and (numberp (first s)) (> (first s) 0)) ; s - число и > 0
            (+ 1 (count_positive_digits_list_2(rest s))) ; подсчитываем рекурсивный вызов
        )
        (t (count_positive_digits_list_2(rest s)))  ; продолжаем цикл, если пред. условия не сработали
    )
)

#|

Количество вхождений элемента. 
Теперь определим функцию (count s x), которая подсчитывает сколько раз
элемент x входит в список s.

• если список s — пуст, то результат — 0;
• если x совпадает с (first s), то результат на 1 больше ре-
  курсивного вызова (count (rest s) x);
• иначе — результат равен результату рекурсивного вызова
(count (rest s) x).

тесты:

mycount `(nil) `a
0

mycount `(b) `a
0

mycount `(1) 1
1

mycount `(1 2) 2
2

mycount `(3 3 4 2) 3
2

|#

(defun mycount(s x)
    (cond
        ((null s) 0)    ; если список пуст
        ((equal (first s) x)   ; если x совпадает с (first s)
            (+ 1 (mycount(rest s) x)) ; то результат на 1 больше рекурсивного вызова
        )
        (t (mycount(rest s) x)) ; продолжаем цикл, если пред. условия не сработали
    )
)

; Встроенные рекурсивные функции для списков
#|
Функция member проверяет, принадлежит ли элемент
списку. Элемент может принадлежать списку, если он совпадает
с головой списка или содержится в хвосте списка. В соответствии
с этим имеем алгоритм функции (member s):

• если список s — пуст, то результат — NIL;
• если x совпадает с (first s), то результат — T;
• иначе — результат равен результату рекурсивного вызова (member (rest s) x).

тесты:
mymember 1 `(1)
T

mymember 1 `()
NIL

mymember 1 `(2)
NIL

mymember 1 `(a 2)
T

mymember `a `(a 1)
T

mymember `(a b) `((c d) (a b) a))
T

|#

(defun mymember(x s)
    (cond
        ((null s) nil)  ; если список s — пуст, то результат — NIL
        ((equal (first s) x) t) ; если x совпадает с (first s), то результат — T
        (t (mymember x(rest s)))    ; продолжаем цикл, если неконд.
    )
)


#|
Функция append соединяет два списка.

Для определения функции (append x y) применим рекурсию:
для того чтобы соединить два списка x и y, соединяем хвост списка x
со списком y и к результату в качестве головы добавляем голову списка x.
Более точно алгоритм можно записать так:

• если список x — пуст, то результат — список y;
• иначе рекурсивно вызываем (append (rest x) y) и к резуль-
тату в качестве головы добавляем (first x).

tests:
myappend `(1 2) `(3 4 5)
(1 2 3 4 5)

myappend `() `(3 4 5)
(3 4 5)

myappend `(1 2) `()
(1 2)

|#

(defun myappend(x y)
    (if
        (null x) y    ; если список x — пуст, то результат — список y
        (cons (first x) (myappend(rest x) y)) ; else
    )
)


#|
Функция reverse обращает список
Для определения функции (reverse x) применим рекурсию:
для того чтобы обратить список x, обращаем хвост списка x и к нему
в конец добавляем голову списка x.

• если список x — пуст, то результат — список x;
• иначе рекурсивно вызываем (reverse (rest x) y) и результат
соединяем с (list (first x)).

|#

(defun myreverse(x)
    (if
        (null x) nil  ; если список x — пуст, то результат — список x
        (append (myreverse(rest x)) (list(first x)))
    )
)


#|
Функция remove удаляет элемент из списка
Если эле-
мент х входит несколько раз в список s, то удаляется только
первое вхождение элемента.

• если список s — пуст, то результат — список s;
• если (first s) совпадает с элементом x, то в качестве
  результата возвращается (rest s);
• иначе рекурсивно вызываем (remove x (rest s)) и к
  результату добавляем в качестве головы (first s).

|#

(defun myremove(x s)
    (cond
        ((null s) nil)  ; если список s — пуст, то результат — список s
        ((eql(first s)x) (rest s))  ; если (first s) совпадает с элементом x
        (t (cons (first s) (myremove x (rest s)))   ; иначе рекурсивно вызываем
        )
    )
)

#|
Если надо удалить все вхождения
|#

(defun myremove_all(x s)
    (cond
        ((null s) nil)  ; если список s — пуст, то результат — список s
        ((eql(first s)x) (myremove_all x (rest s)))  ; если (first s) совпадает с элементом x
        (t (cons (first s) (myremove_all x (rest s)))   ; иначе рекурсивно вызываем
        )
    )
)
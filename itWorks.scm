(load "std.scm")

(define (five) 5)
(define (ten) 10)

(define (isAnyFifteen accum x)
    (or (= x 15) accum))

(fold isAnyFifteen #f (list (five) 20 (ten) 15 3))

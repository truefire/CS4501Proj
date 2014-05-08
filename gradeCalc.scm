;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname gradeCalc) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
;;(load "std.scm")

(define (pairSum s)
  (match s
    ((cons hd tl)       (list (+ (car hd) (car (pairSum tl))) (+ (* (cadr hd) (car hd)) (cadr (pairSum tl)))))
    (_                  (list 0 0))
  )
)

(define (computeGrade s)
  (* 100 ( / (cadr (pairSum s)) (car (pairSum s)))))

(define (repl s)
  (begin (write "Enter assignment weight followed by grade, both on a 0-1 scale, separated by a newline. (q for either to quit)") (newline)
  (match (cons (read) (list (read)))        
    ((cons 'q _)            (write (string-append "Your final grade is: "(number->string (exact->inexact (computeGrade s)) 10) "%")))
    ((cons _'q)             (write (string-append "Your final grade is: "(number->string (exact->inexact (computeGrade s)) 10) "%")))
    ((cons weight grade)    (repl (cons (cons weight grade) s)))
    (_                      (begin (write "malformed input") (repl s)))
  ))
)

(repl '())
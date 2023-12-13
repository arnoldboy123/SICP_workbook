#lang scheme
; 1.3 Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers
(define (sum_of_square x y z)
  (cond ((largest_two x y z) (+ (square x) (square y)))
        ((largest_two y z x) (+ (square y) (square z)))
        (else (+ (square x) (square z)))
  ))

(define (largest_two x y z)
  (and (> (+ x y) (+ x z)) (> (+ x y) (+ y z))))

(define (square x)
  (* x x))

(sum_of_square 10 5 7)

; 1.4 Describe what this is doing:
(define (a-plus-abs-b a b)
  ((if ( > b 0) + - ) a b))

; define a method named a-plus-abs-b which takes argument a and b
; if b is bigger than zero, sum a and b, else, take minus b from a

; Exercise 1.5
; For the following program, the applicative order evaluation and normal order evaluation are different
(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

;; under normal order evaluation, (test 0 (p)) will go into the method test first, where the if predicate x = 0 will evaluate to true, and the result will be 0
;; under applicative order evaluation, (p) will be evaluated first, as (p) calls itself, the program will go into an infinite loop

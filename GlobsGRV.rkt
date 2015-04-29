#lang racket
;GLOBALS
;-------------------------------------------------
;to make updating options easier
(define funcbox-choices '("nonTrig" "trig"))
(define trigbox-choices '("cos" "sin" "tan" "csc" "sec" "cot"))
(define linear-choices '("+" "-" "/" "*" "^" "sqr" "sqrt"))
(define plotting-choices '("2d" "3d"))
;-------------------------------------------------
;GLOBALS

(define coords-3d (list "x" "y" "z"))
(define coords-2d (list "x" "y"))

;GLOBALS AllContClass
;-------------------------------------------------
;to make updating options easier
(define fbc funcbox-choices)
(define tbc trigbox-choices)
;-------------------------------------------------

;TOKENS---------------------------------------------
(define (interTok token)
  (let((sqrtTok '()))
  (cond((eq? token "+") (lambda(x y) (+ x y)))
       ((eq? token "*") (lambda(x y) (* x y)))
       ((eq? token "**")(lambda(x y) (expt x y)))
       ((eq? token "^") (lambda(x y) (expt x y)))
       ((eq? token "%") (lambda(x y) (% x y)))
       ((eq? token "/") (lambda(x y) (/ x y)))
       ((eq? token "sqrt")(lambda(x) (sqrt x))))))
;TOKENS--------------------------------------------
;GLOBALS
(provide (all-defined-out))
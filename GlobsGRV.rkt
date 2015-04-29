#lang racket
;GLOBALS
;-------------------------------------------------
;to make updating options easier
(define funcbox-choices '("nonTrig" "trig"))
(define trigbox-choices '("cos" "sin" "tan"))
(define all-transforms '("+" "-" "/" "*" "^"))
(define plotting-choices '("2d" "3d"))
(define all-choices '("sin" "cos" "tan" 
                            "sqrt" "integer"))
(define xmindef -10)
(define xmaxdef 10)
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
  (cond((equal? token "+") (lambda(x y) (+ x y)))
       ((equal? token "-") (lambda(x y) (- x y)))
       ((equal? token "*") (lambda(x y) (* x y)))
       ((equal? token "**")(lambda(x y) (expt x y)))
       ((equal? token "^") (lambda(x y) (expt x y)))
       ;((eq? token "%") (lambda(x y) (% x y)))
       ((equal? token "/") (lambda(x y) (/ x y)))
       ((equal? token "sqrt")(lambda(x) (sqrt x)))
       ((equal? token "sin") (lambda(x) (sin x)))
       ((equal? token "cos") (lambda(x) (cos x)))
       ((equal? token "tan") (lambda(x) (tan x)))
       )))
;TOKENS--------------------------------------------
;GLOBALS
(provide (all-defined-out))
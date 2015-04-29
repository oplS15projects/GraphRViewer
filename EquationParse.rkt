;@Author: Jonathan Wydola
;Purpose: to parse an eqation to do something with it eventually.
;Turn it to prefix notation for sure
#lang racket

(define (left_paren? x)
  (eq? x "("))
(define (right_paren? x)
  (eq? x ")"))

;STACKS-------------------
(define OperatorStack '(null))
(define OutputStack '(null))

(define (push_stack var stack)
  (set! stack (cons var stack)))
(define (pop_stack stack)
  (let ((result (car stack)))
    (set! stack (cdr stack))
    result))
(define (pop_until var stack)
  (let ((result (car stack)))
    (cond((empty? stack) #f)
         ((empty? (cdr stack))
          #f)
         ((eq? var (car stack))
          (set! stack (cdr stack)))
         (else(set! stack (cdr stack))
              (pop_until var stack)))
    result))
              

;PRECEDENCE---------------
;This is the vars that contain the list of string tokens
(define p1 (list "(" ")" "[" "]" "{" "}"))
(define p2 (list "^"))
(define p3 (list "*" "/" "%"))
(define p4 (list "+" "-"))
(define (prescedence tok)
  (cond((not(eq? (member tok p1) #f)) 1)
       ((not(eq? (member tok p2) #f)) 2)
       ((not(eq? (member tok p3) #f)) 3)
       ((not(eq? (member tok p4) #f)) 4)))
;PRECEDENCE---------------

;ASSOCIATIVITY------------
(define left_asoc 
  (list "+" "-" "/" "*"))
(define right_asoc
  (list "^"))
(define (left_asoc? var)
  (not(eq? (member var left_asoc) #f)))
(define (right_asoc? var)
  (not(eq? (member var right_asoc) #f)))
;ASSOCIATIVITY------------

;ALGORITHM----------------
;Shunting-yard algorithm to parse a equation
(define (readEquation equation)
  (define (readToken token)
    (cond((number? tok) (push_stack tok OutputStack))
         ((function? tok) (push_stack tok OperatorStack))
         ((func-sep? tok) (pop_until "(" OperatorStack))
         ((operator? tok)
          (cond((operator? (car OperatorStack))
                (cond((and (left_asoc? tok) 
                           (<=
                            (prescedence tok)
                            (prescedence (car OperatorStack))))
                      (push-stack (pop_stack OperatorStack)))
                     ((and (right_asoc? tok)
                           (<
                            (prescedence tok)
                            (prescedence (car OperatorStack))))
                      (push-stack (pop_stack OperatorStack))))))
          (push-stack tok))
         (
         )))
         
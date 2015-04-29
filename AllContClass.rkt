;Authors: Jonathan Wydola Pruv Pabba
;Project: GraphRViewer
;
;About Project: This project is being constructed for 91.301 
;OPL at UML. This project is based on the idea of taking
;user input and generating a graph. The layout so far is plain
;and simple but hopefully it gets the message across of what the
;final product will be. a GUI that you will fill out to graph 2/3-d equations.
;
;About file: This file can be reffered to as the class file forall the data
;stored

#lang racket
(require "GlobsGRV.rkt")
(require plot)
(plot-new-window? #t)

;****WRAPPERS TO DYNAMICALLY ADD*********
;--------------------------------------------------
(define (funcwraper2d func x y) (function func x y))
(define (funcwraper3d func x y z) (function func x y z))
(define outputplot3d
  (lambda (x) (plot3d x)))
(define outputplot2d
  (lambda(x) plot x))


;composes 1 with 2
(define (combine_proc proc arg1 arg2 )
  (lambda(x) (proc (arg1 x) arg2)))
;----------------------------------------------------

;basic class structure to hold information
;---------CLASS-TO-HOLD-ALL-CONTENT-------------------
(define (allcont def)
  (let((func def)
       (listfunc (string->list def))
       (funcvar def)
       (listfuncvar (string->list def))
       (txt def)
       (listtxt (string->list def))
       (linearopt-2d coords-2d)
       (linearopt-3d coords-3d)
       (trigopt fbc)
       (arg-3d #f)
       (xmin xmindef)
       (xmax xmaxdef))
    (lambda(mess)
      (cond((eq? mess 'printall) (list funcvar txt func))
           ((eq? mess 'printfunc) func)
           ((eq? mess 'printfunclist) listfunc)
           ((eq? mess 'printfuncvar) funcvar)
           ((eq? mess 'printfuncvarlist) listfuncvar)
           ((eq? mess 'printtxt) txt)
           ((eq? mess 'printtxtlist) listtxt)
           ((eq? mess 'printlinearopt-2d) linearopt-2d)
           ((eq? mess 'printlinearopt-3d) linearopt-3d)
           ((eq? mess 'printtrigopt) trigopt)
           ((eq? mess 'arg-3d?) arg-3d)
           ((eq? mess 'printxmin) xmin)
           ((eq? mess 'printxmax) xmax)
           ((eq? mess 'updatefv)
            (lambda (newfuncvar)
              (set! funcvar newfuncvar)
              (set! listfuncvar (string->list newfuncvar))))
           ((eq? mess 'updatef)
            (lambda (newfunc)
              (set! func newfunc)
              (set! listfunc (string->list newfunc))))
           ((eq? mess 'updatetxt) 
            (lambda(newtxt)
              (set! txt newtxt)
              (set! listtxt (string->list newtxt))))
           
           ((eq? mess 'updatelinopt2d)
            (lambda(newlinopt) ;arg should be a list
              (set! linearopt-2d newlinopt)))
           ((eq? mess 'updatelinopt3d)
            (lambda(newlinopt3)
              (set! linearopt-3d newlinopt3)))
           ((eq? mess 'updatetrigopt) 
            (lambda(newtrigopt)
              (set! trigopt newtrigopt)))
           ((eq? mess 'updatedimension)
            (lambda (arg)
              (if(equal? arg 1)
                 (set! arg-3d #t)
                 (set! arg-3d #f))))
           ((eq? mess 'updatexmin)
            (lambda(x)
              (if(eq? x "")
                 (set! xmin xmindef)
                 (set! xmin (string->number x)))))
           ((eq? mess 'updatexmax)
            (lambda(x)
              (if(eq? x "")
                 (set! xmax xmaxdef)
                 (set! xmax (string->number x)))))
           
           
           ))))
              

;---------CLASS-TO-HOLD-ALL-CONTENT-------------------

;-------------PROVIDE---------------------------
(provide (all-defined-out))
;-------------PROVIDE---------------------------
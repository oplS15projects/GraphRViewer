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

;basic class structure to hold information
;---------CLASS-TO-HOLD-ALL-CONTENT-------------------
(define (allcont def)
  (let((func def)
       (listfunc (string->list def))
       (trig def)
       (listtrig (string->list def))
       (txt def)
       (listtxt (string->list def))
       (linearopt-2d coords-2d)
       (linearopt-3d coords-3d)
       (trigopt fbc)
       (arg-3d #f))
    (lambda(mess)
      (cond((eq? mess 'printall) (list trig txt func))
           ((eq? mess 'printfunc) func)
           ((eq? mess 'printfunclist) listfunc)
           ((eq? mess 'printtrig) trig)
           ((eq? mess 'printtriglist) listtrig)
           ((eq? mess 'printtxt) txt)
           ((eq? mess 'printtxtlist) listtxt)
           ((eq? mess 'printlinearopt-2d) linearopt-2d)
           ((eq? mess 'printlinearopt-3d) linearopt-3d)
           ((eq? mess 'printtrigopt) trigopt)
           ((eq? mess 'arg-3d?) arg-3d)
           ((eq? mess 'updatet)
            (lambda (newtrig)
              (cond((eq? newtrig '())
                    (set! trig "")
                    (set! listtrig (string->list "")))
                   (else(set! trig newtrig)
                        (set! listtrig (string->list newtrig))))))
           ((eq? mess 'updatef)
            (lambda (newfunc)
              (cond((eq? newfunc '())
                    (set! func "")
                    (set! listfunc (string->list "")))
                   (else(set! func newfunc)
                        (set! listfunc (string->list newfunc))))))           
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
           
           
           ))))
              

;---------CLASS-TO-HOLD-ALL-CONTENT-------------------

;-------------PROVIDE---------------------------
(provide (all-defined-out))
;-------------PROVIDE---------------------------
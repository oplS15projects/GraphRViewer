#lang racket

(require plot)
;(define (paramwraper init . rest) 
;  (define (parseinit ninit allpar)
;    (cond((null? ninit)
;         (lambda(x)
;           (parameterize allpar)))
;         (else(
    
(define (functionstyles def)
  (let((color def)
       (x-label def)
       (y-label def)
       (z-label def))
    (lambda(mess)
      (cond((eq? mess 'printcolor) color)
           ((eq? mess 'printx-label) x-label)
           ((eq? mess 'printy-label) y-label)
           ((eq? mess 'printz-label) z-label)
           ((eq? mess 'update-xl)
            (lambda(x)
              (set! x-label x)))
           ((eq? mess 'updatey-label)
            (lambda(y)
              (set! y-label y)))
           ((eq? mess 'updatez-label)
            (lambda(z)
              (set! z-label z)))
            ))))

(define (functionClass def)
  (let((
       (p-2d (lambda(x) (plot x)))
       (p-3d (lambda(x) (plot-3d x)))
       (p-i2d (lambda(x) (inverse x)))
       (p-i3d (lambda(x) (invers-3d x)))))))

(provide (all-defined-out))
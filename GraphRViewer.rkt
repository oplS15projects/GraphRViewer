;Authors: Jonathan Wydola Pruv Pabba
;Project: GraphRViewer
;
;About Project: This project is being constructed for 91.301 
;OPL at UML. This project is based on the idea of taking
;user input and generating a graph. The layout so far is plain
;and simple but hopefully it gets the message across of what the
;final product will be. a GUI that you will fill out to graph 2/3-d equations.
;
;About file: This file can be reffered to as main.


;------------------------------------------
;------------------------------------------
;************This will be used with all 
;************function calls to plot
;------------------------------------------
;------------------------------------------
;; for 2d plot, add x/y-min/max, 
;;-----------------------------
;;x/y, min/max int
;; width/height int
;; title, x-label, y-label string
;; legend-anchor = 	
;(one-of/c 'top-left    'top    'top-right
;          'left        'center 'right
;          'bottom-left 'bottom 'bottom-right)

;-----------------------------------
;3d
;plot+
;z-min/max int
; angle, altitude
;z-label

;------------------------------------------
;------------------------------------------

;For function we need x/y min/max, samples
;color
;width, style, label
;Inverse is the same
;Function-interval, area uner curve
;x min-max
;color
;samples
;style
;line1/2 - colorwidth style
;label alpha

#lang racket
(require plot)

(require "FramesGRV.rkt")
(plot-new-window? #t)
;-------------------------------------------------
;-------------MAIN------------------------------
; Show the frame by calling its show method
(send frame show #t)

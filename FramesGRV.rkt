;Author: Jonathan Wydola
;Project: GraphRViewer

;This file is for all frames that are used in this project.
;It also contains all formating for the frames as well as
;dialog panels so place buttons and text at ordered locations


#lang racket
(require racket/gui)
(require "AllContClass.rkt")
(require "GlobsGRV.rkt")
(require "FunctionStylesGRV.rkt")


;instantiates a class to holdall content
(define newclass (allcont ""))
;-----------------METHODS-------------------------
;updates the text var
(define (updatetxt vartxt) ((newclass 'updatetxt) vartxt))
;updates the trig var
(define (updatefv vart)((newclass 'updatefv) vart))
(define (updatef varf)((newclass 'updatef) varf))
;-----------------METHODS-------------------------


;-------------FRAMES----------------------------
; Make a frame by instantiating the frame% class
(define frame (new frame% [label "GraphRViewer"]
                   [width 350]
                   [height 350]
                   [style (list 'no-resize-border 
                             'fullscreen-button)]
                   [border 10]))

(define function-input-frame 
  (new frame%
       [label "Function options"]
       [width 250]
       [height 250]
       [style (list 'no-resize-border
                    'fullscreen-button)]
       [border 10]))

(define function-style-frame
  (new frame%
       [label "Style Options"]
       [width 450]
       [height 450]
       [style (list 'no-resize-border
                    'fullscreen-button)]
       [border 10]))
;-------------FRAMES----------------------------

;-------------DIALOGUE BOX----------------------
;*Dbox for default
(define nullPanel (new panel% [parent function-input-frame]
                       [style '(deleted)]))
;*Dbox for default

;Dbox for function-style-frame
;Panels for the syles frame
(define stylePanel (new horizontal-panel% [parent function-style-frame]
                        [alignment '(center center)]))
;this panel is a parent panel to change other panels
(define stylePanel2 (new horizontal-panel% [parent function-style-frame]
                         [alignment '(center center)]))
;this panel is a panel that binds a certain value
(define stylePanel2a (new horizontal-panel% [parent function-style-frame]
                         [alignment '(center center)]))
;this panel isa panel that binds a cartain value or objects
(define stylePanel2b (new horizontal-panel% [parent function-style-frame]
                         [alignment '(center center)]))
;Dbox for function-style-frame

;this pane is a panel to change other panels
(define stlyePanel3 (new horizontal-panel% [parent function-style-frame]
                         [alignment '(center center)]))

;Dbox for frame(*************************************
(define diaPanel (new horizontal-panel% [parent frame]
                      [alignment '(center center)]))
(define diaPanel2 (new horizontal-panel% [parent frame]
                      [alignment '(center center)]))
(define diaPanel3 (new horizontal-panel% [parent frame]
                       [alignment '(center center)]))
;Dbox for frame**************************************


;Dbox for function-frame*****************************
(define funcPanel (new vertical-panel% 
                       [parent function-input-frame]
                       [alignment '(left top)]))
(define funcPanel2 (new vertical-panel%
                        [parent function-input-frame]
                        [alignment '(center top)]))
(define funcPanel2t (new vertical-panel%
                         [parent funcPanel2]
                         [style '(deleted)]
                         [alignment '(center top)]))
(define funcPanel2l (new vertical-panel%
                         [parent funcPanel2]
                         [style '(deleted)]
                         [alignment '(center top)]))
(define funcPanel3 (new vertical-panel%
                        [parent function-input-frame]
                        [alignment '(right top)]))
;Dbox for function-frame*****************************

;-------------DIALOGUE BOX----------------------

;-------------RADIO BOX-------------------------
(define bool-3d (new radio-box%
                     [label "Dimensions"]
                     [choices '("2d" "3d")]
                     [parent diaPanel2] ;funcpanel
                     [callback 
                      (lambda (radio-box event)
                        (cond((not(eq? 
                               (send bool-3d get-selection)
                               #f))
                        ((newclass 'updatedimension) 
                         (send bool-3d get-selection)))))]))
                              
;-------------RADIO BOX-------------------------

;-------------TEXTBOX---------------------------
(define ntxtf (new text-field%
                   [label "Enter integer to transform"]
                   [parent funcPanel3]))

;--------------COMBO-----------------------------
;This will be a personal modified class when i can figure that out
;idea inherited from http://lists.racket-lang.org/users/archive/2012-October/054246.html
;(define my-combo-field 
;  (new (class combo-field%
;         (super-new)
;         (inherit get-menu append)
;         (define/public (update-choices choicelst)
;           (map (lambda (old)
;                  (send old delete))
;                (send (get-menu) get-items))
;           (map (lambda (choice)
;                  (append choice))
;                choicelst)
;           (void)))
;  [parent function-input-frame]
;  [label "combo-field%"]
;  [choices '()]))
;http://lists.racket-lang.org/users/archive/2012-October/054246.html-----------------        

;the combo boc that selects the type of function to graph
;FUNCTION TYPE AND EQUATION COMBOFIELDS---------------------
(define funcbox (new combo-field%
                    [parent funcPanel]
                    [label "Select a function type"]
                    [choices funcbox-choices]
                    [callback (lambda (text-field event)
                                (cond((not(equal? (send funcbox get-value) "trig"))
                                      (updatefv "")
                                      (updatef (send funcbox get-value))
                                      (send funcPanel2 change-children (lambda(child) (list funcPanel2l))))
                                     (else
                                      (updatef (send funcbox get-value))
                                      (send funcPanel2 change-children (lambda(child) (list funcPanel2t))))))]))

;the combo box for the trig values if its a trig function
;until i can figure out how to hide things 
(define trigbox (new combo-field% 
                     [parent funcPanel2t]
                     [label "Select trig function"]
                     [choices trigbox-choices]
                     [callback (lambda (text-field event)
                                 (updatefv (send trigbox get-value)))]))

;bound to funcPanel2l to display the linear function options
(define linbox (new combo-field%
                    [parent funcPanel2l]
                    [label "Select linear function"]
                    [choices linear-choices]))

;bound to the stylePanel to display all plots that will have variable styles
;(define allplotstyles (new combo-field%
;                          [parent stylePanel]
;                          [label "Choose function style to modify"]
;                          [choices plotting-choices]
;                          [callback (lambda(text-field event)
;                                      (cond((equal? (send allplotstyles get-value) "2d")
;                                            (send stylePanel2 change-children (lambda(child )

;FUNCTION TYPE AND EQUATION COMBOFIELDS---------------------


;---------------BUTTONS FOR CHANGEING CURRENT FUNCTION--------------------------------
(define functiondisplay (new button%
                       [parent diaPanel]
                       [label "Change function"]
                       [callback (lambda (button event)
                                   (send function-input-frame show #t))]))

;button that allows a user to change styles
(define functionstyles (new button%
                            [parent diaPanel]
                            [label "Change Styles"]
                            [callback (lambda (button event)
                                        (send function-style-frame show #t))]))


;button that pulls from  textbox                                                                                
(define get-eq (new button% [parent funcPanel2] 
     [label "Get Equation"]
     [callback (lambda (button event)
                 (updatetxt (send ntxtf get-value))
                 (send alldata set-label 
                       (string-append "function type: " (newclass 'printfunc)))
                 (if(not(eq? "none" (newclass 'printtrig)))
                         (send alldata2 set-label 
                               (string-append "function: " (newclass 'printtrig)))
                         (send alldata2 set-label " "))
                 (send alldata3 set-label 
                       (string-append "equation val: " (newclass 'printtxt)))
                 (cond((eq? (newclass 'arg-3d?) #t)
                       (outputplot3d (lambda(x) ((interTok (newclass 'printfuncvar)) x (string->number (newclass 'printtxt))))))
                      ((eq? (newclss 'arg-3d?) #f)
                       (outputplot2d (lambda(x)((interTok (newclass 'printfuncvar)) x (string->number (newclass 'printtxt))))))))]))
;-------------BUTTONS---------------------------

                                                                                
;--------------MESSAGES------------------------
(define alldata (new message% [parent diaPanel3]
                     [label " "]
                     [auto-resize #t]))
(define alldata2 (new message% [parent diaPanel3]
                     [label " "]
                     [auto-resize #t]))
(define alldata3 (new message% [parent diaPanel3]
                     [label " "]
                     [auto-resize #t]))
;-------------MESSAGES--------------------------


;-------------PROVIDE---------------------------
(provide (all-defined-out))
;-------------PROVIDE---------------------------
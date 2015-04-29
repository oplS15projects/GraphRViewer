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
(require racket/gui)
(require "AllContClass.rkt")
(require "GlobsGRV.rkt")

(plot-new-window? #t)
;-------------------------------------------------

;instantiates a class to holdall content
(define newclass (allcont ""))
;-----------------METHODS-------------------------
;updates the text var
(define (updatetxt vartxt) ((newclass 'updatetxt) vartxt))
;updates the trig var
(define (updatefv vart)((newclass 'updatefv) vart))
(define (updatef varf)((newclass 'updatef) varf))
(define (updatexmin varmin) ((newclass 'updatexmin) varmin))
(define (updatexmax varmax) ((newclass 'updatexmax) varmax))

;allows me to just call the graph and it should parameterize things
;(define interptAll
;  (cond((eq? (newclass 'arg-3d?) #t)
;        (plot3d 
;         (funcwraper3d 
;          (combine_proc 
;           (interTok (newclass 'printfuncvar)) 
;           (interTok (newclass 'printfunc))
;           (string->number (newclass 'printxt)))
;          (newclass 'printxmin)
;          (newclass 'printxmax)
;          0)))
;        ((eq? (newclass 'arg-3d?) #f)
;         (plot 
;          (funcwraper2d
;           (combine_proc 
;            (interTok (newclass 'printfuncvar))
;            (interTok (newclass 'printfunc)) 
;            (string->number (newclass 'printtxt)))
;           (newclass 'printxmin)
;           (newclass 'printxmax))))
;        ))

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
       [width 300]
       [height 300]
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
;panels for order of frames presented
;*Dbox for default
(define nullPanel (new panel% [parent function-input-frame]
                       [style '(deleted)]))
;*Dbox for default^



;Dbox for frame(*************************************
(define diaPanel (new horizontal-panel% [parent frame]
                      [alignment '(center center)]))
(define diaPanel2 (new horizontal-panel% [parent frame]
                      [alignment '(center center)]))
(define diaPanel3 (new horizontal-panel% [parent frame]
                       [alignment '(center center)]))
;Dbox for frame**************************************



;Dbox for function-frame*****************************
(define funcPanel (new horizontal-panel% 
                       [parent function-input-frame]
                       [alignment '(left top)]
                       [style '(deleted)]))
;NOT USED^-------------------------------------------
(define funcPanelHeader (new horizontal-panel%
                       [parent function-input-frame]
                       [alignment '(center top)]
                       ))
(define funcPanelHead (new horizontal-panel%
                           [parent function-input-frame]
                           [alignment '(center top)]))
(define funcPanelH2 (new horizontal-panel%
                         [parent function-input-frame]
                         [alignment '(center top)]))

;for xmin and max values,
(define spacer1 (new vertical-panel%
                     [parent funcPanelH2]
                     [alignment '(left top)]))
(define funcPanelXmin (new vertical-panel%
                           [parent funcPanelH2]
                           [alignment '(left top)]))
(define spacer2 (new vertical-panel%
                     [parent funcPanelH2]
                     [alignment '(left top)]))
(define funcPanelXmax (new vertical-panel%
                           [parent funcPanelH2]
                           [alignment '(right top)]))
(define spacer3 (new vertical-panel%
                     [parent funcPanelH2]
                     [alignment '(left top)]))
;for xmin and max values,^^


(define funcPanel2 (new vertical-panel%
                        [parent function-input-frame]
                        [alignment '(center top)]))

(define funcPanel3 (new vertical-panel%
                        [parent function-input-frame]
                        [alignment '(center top)]))

;for messages
(define funcPanel4 (new vertical-panel%
                        [parent function-input-frame]
                        [alignment '(center top)]))
;Dbox for function-frame*****************************


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
                   [label "Enter and integer value"]
                   [parent funcPanel3]
                   [style '(single vertical-label)]))

;Xmin and Xmax
(define xmintxt (new text-field%
                     [label "Xmin:"]
                     [parent funcPanelXmin]
                     [style '(single vertical-label)]))
(define xmaxtxt (new text-field%
                     [label "Xmax:"]
                     [parent funcPanelXmax]
                     [style '(single vertical-label)]))
;Xmin and Xmax
;--------------TEXTBOXES-------------------------
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
                                      (updatef (send funcbox get-value)))
                                     (else
                                      (updatef (send funcbox get-value)))))]))


;temp value for demonstration
(define allOptions (new combo-field%
                        [parent funcPanelHeader]
                        [label "Select function to graph"]
                        [choices all-choices]
                        [style '(vertical-label)]
                        [callback (lambda (text-field event)
                                    (updatefv (send allOptions get-value)))]))


(define allTransforms (new combo-field%
                                [parent funcPanelHead]
                                [label "Select a Transformation"]
                                [choices all-transforms]
                                [style '(vertical-label)]
                                [callback (lambda (text-field event)
                                            (updatef (send allTransforms get-value)))]))


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
(define get-eq (new button% [parent funcPanel3] 
     [label "Get Equation"]
     [callback (lambda (button event)
                 (updatetxt (send ntxtf get-value))
                 (send alldata set-label 
                       (string-append "function type: " (newclass 'printfunc)))
                 (if(not(eq? "none" (newclass 'printtrig)))
                         (send alldata2 set-label 
                               (string-append "function: " (newclass 'printfuncvar)))
                         (send alldata2 set-label " "))
                 (send alldata3 set-label 
                       (string-append "equation val: " (newclass 'printtxt)))
                 (updatexmin (send xmintxt get-value))
                 (updatexmax (send xmaxtxt get-value))
                 (send alldata4 set-label
                       (string-append "xmin: " (number->string (newclass 'printxmin))
                                      "\nxmax: " (number->string (newclass 'printxmax))))
                 (cond((eq? (newclass 'arg-3d?) #t)
                       (plot3d 
                        (funcwraper3d 
                         (combine_proc
                          (interTok (newclass 'printfunc))
                          (interTok (newclass 'printfuncvar))
                          (string->number (newclass 'printtxt)))
                         (newclass 'printxmin)
                         (newclass 'printxmax)
                         0)))
                      ((eq? (newclass 'arg-3d?) #f)
                       (plot
                        (funcwraper2d
                         (combine_proc
                          (interTok (newclass 'printfunc))
                          (interTok (newclass 'printfuncvar))
                          (string->number (newclass 'printtxt)))
                         (newclass 'printxmin)
                         (newclass 'printxmax))))))]))
;-------------BUTTONS---------------------------

                                                                                
;--------------MESSAGES that change------------------------
(define alldata (new message% [parent funcPanel4]
                     [label " "]
                     [auto-resize #t]))
(define alldata2 (new message% [parent funcPanel4]
                     [label " "]
                     [auto-resize #t]))
(define alldata3 (new message% [parent funcPanel4]
                     [label " "]
                     [auto-resize #t]))
(define alldata4 (new message% [parent funcPanel4]
                      [label " "]
                      [auto-resize #t]))
;-------------MESSAGES--------------------------
;-------------MAIN------------------------------
; Show the frame by calling its show method
(send frame show #t)


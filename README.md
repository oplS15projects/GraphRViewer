# GraphRViewer

-This project will create a GUI using racket/gui to take user input to graph and equation using the plot library

#Authors

Jonathan Wydola

#Overview

GraphRViewer was designed to make graphing functions for the user easily and accurately.
To ensure this, we have designed a GUI interface that allows a user to enter their function requirements.
We have also added features that allow the user to change the style of their graph.



#Concepts Demonstrated

* **Data Abstraction** between the GUI and the process of graphing equations
* The method used to store information resembles a **recursive data stucture**


#External Technology and Libraries

* Rackets gui library
* Plot library

#Favorite Lines of Code
####Jonathan

```scheme
(define/public (update-choices choicelst)
           (map (lambda (old)
                  (send old delete))
                (send (get-menu) get-items))
           (map (lambda (choice)
                  (append choice))
                choice))
```
This is my favorite procedure throughout the entire project. It essentially updates the choices of a combo-box
or any menu derived choices. This allows me to dynamically change choices to prevent to many boxes.

#Incomplete Features

* Only graphs 2d equations
* Intended to have styles and colors for graphs
* Instead of parsing a text box, user selects function parameters
* 
#How to Download and Run

* Head over to my latest release to get all of the code.

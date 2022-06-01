;; *Exercise 2.2:* Consider the problem of representing line segments
;; in a plane.  Each segment is represented as a pair of points: a
;; starting point and an ending point.  Define a constructor
;; `make-segment' and selectors `start-segment' and `end-segment'
;; that define the representation of segments in terms of points.
;; Furthermore, a point can be represented as a pair of numbers: the
;; x coordinate and the y coordinate.  Accordingly, specify a
;; constructor `make-point' and selectors `x-point' and `y-point'
;; that define this representation.  Finally, using your selectors
;; and constructors, define a procedure `midpoint-segment' that takes
;; a line segment as argument and returns its midpoint (the point
;; whose coordinates are the average of the coordinates of the
;; endpoints).  To try your procedures, you'll need a way to print
;; points:
;;
;;      (define (print-point p)
;;        (newline)
;;        (display "(")
;;        (display (x-point p))
;;        (display ",")
;;        (display (y-point p))
;;        (display ")"))


(defun print-point (p)
  (message "(%d,%d)" (x-point p) (y-point p)))

(defun x-point (p) (car p))
(defun y-point (p) (cdr p))

(defun make-point (x y)
  (cons x y))

(defun start-segment (s) (car s))
(defun end-segment (s) (cdr s))

(defun make-segment (start end)
  (cons start end))

(defun midpoint-segment (s)
  (let ((average (lambda (a b)
                   (/ (+ a b) 2)))
        (start (start-segment s))
        (end (end-segment s)))
    (make-point (funcall average
                         (x-point start)
                         (x-point end))
                (funcall average
                         (y-point start)
                         (y-point end)))))

;; Test
(defvar seg (make-segment (make-point 2 3)
                          (make-point 10 15)))
(print-point (midpoint-segment seg))

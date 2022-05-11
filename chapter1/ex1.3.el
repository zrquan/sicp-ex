;; *Exercise 1.3:* Define a procedure that takes three numbers
;; as arguments and returns the sum of the squares of the two
;; larger numbers.


(defun index-of-min (p1 p2 p3)
  (let ((tmp (if (< p1 p2) 1 2)))
        (cond ((= tmp 1) (if (< p1 p3) 1 3))
              ((= tmp 2) (if (< p2 p3) 2 3)))))

(defun sum-squares (num1 num2)
  (+ (* num1 num1) (* num2 num2)))

(defun answer-1-3 (p1 p2 p3)
  (let ((i (index-of-min p1 p2 p3)))
    (cond ((= i 1) (sum-squares p2 p3))
          ((= i 2) (sum-squares p1 p3))
          ((= i 3) (sum-squares p1 p2)))))

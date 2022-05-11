;; *Exercise 1.7:* The `good-enough?' test used in computing square
;; roots will not be very effective for finding the square roots of
;; very small numbers.  Also, in real computers, arithmetic operations
;; are almost always performed with limited precision.  This makes
;; our test inadequate for very large numbers.  Explain these
;; statements, with examples showing how the test fails for small and
;; large numbers.  An alternative strategy for implementing
;; `good-enough?' is to watch how `guess' changes from one iteration
;; to the next and to stop when the change is a very small fraction
;; of the guess.  Design a square-root procedure that uses this kind
;; of end test.  Does this work better for small and large numbers?


(defun sqrt-iter (guess x)
  (if (good-enough-p guess x)
      guess
    (sqrt-iter (improve guess x) x)))

;; (defun good-enough-p (guess x)
;;   (< (abs (- (* guess guess) x)) 0.001))

;; (defun good-enough-p (guess x)
;;   "An alternative strategy"
;;   (< (abs (- (improve guess x) guess))
;;      (* guess 0.001)))

(defun good-enough-p (guess x)
  "The best one"
  (= (improve guess x) guess))

(defun improve (guess x)
  (average guess (/ x guess)))

(defun average (x y)
  (/ (+ x y) 2))

(defun my-sqrt (x)
  (sqrt-iter 1.0 x))

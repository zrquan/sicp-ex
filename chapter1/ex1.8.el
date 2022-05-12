;; *Exercise 1.8:* Newton's method for cube roots is based on the
;; fact that if y is an approximation to the cube root of x, then a
;; better approximation is given by the value
;;         x/y^2 + 2y
;;         ----------
;;         3
;; Use this formula to implement a cube-root procedure analogous to
;; the square-root procedure.


(defun good-enough-p (guess x)
  (= (improve guess x) guess))

(defun improve (guess x)
  (/ (+ (* 2 guess)
        (/ x (* guess guess)))
     3.0))

(defun cbrt-iter (guess x)
  (if (good-enough-p guess x)
      guess
    (cbrt-iter (improve guess x) x)))

(defun cbrt (x)
  "Calculate the cube root of X."
  (cbrt-iter 1.0 x))

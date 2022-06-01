;; *Exercise 1.29:* Simpson's Rule is a more accurate method of
;; numerical integration than the method illustrated above.  Using
;; Simpson's Rule, the integral of a function f between a and b is
;; approximated as

;;      h
;;      - (y_0 + 4y_1 + 2y_2 + 4y_3 + 2y_4 + ... + 2y_(n-2) + 4y_(n-1) + y_n)
;;      3

;; where h = (b - a)/n, for some even integer n, and y_k = f(a + kh).
;; (Increasing n increases the accuracy of the approximation.)
;; Define a procedure that takes as arguments f, a, b, and n and
;; returns the value of the integral, computed using Simpson's Rule.
;; Use your procedure to integrate `cube' between 0 and 1 (with n =
;; 100 and n = 1000), and compare the results to those of the
;; `integral' procedure shown above.


(defun cube (x) (* x x x))

(defun inc (x) (+ x 1))

(defun sum (term a next b)
  (if (> a b)
      0
    (+ (funcall term a)
       (sum term (funcall next a) next b))))

(defun simpson-integral (f a b n)
  (let* ((h (/ (- b a) (float n)))
         (yk (lambda (k) (funcall f (+ a (* k h)))))
         (sim-term (lambda (k)
                     (* (cond ((or (= k 0) (= k n)) 1)
                              ((cl-oddp k) 4)
                              (t 2))
                        (funcall yk k)))))
    (* (/ h 3)
       (sum sim-term 0 'inc n))))


;; TODO: Wrong result?
(simpson-integral 'cube 0 1 100)
(simpson-integral 'cube 0 1 1000)

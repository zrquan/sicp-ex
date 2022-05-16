;; *Exercise 2.1:* Define a better version of `make-rat' that handles
;; both positive and negative arguments.  `Make-rat' should normalize
;; the sign so that if the rational number is positive, both the
;; numerator and denominator are positive, and if the rational number
;; is negative, only the numerator is negative.


(defun negative-p (x) (< x 0))
(defun positive-p (x) (> x 0))
(defun revert (x) (* x -1))

(defun make-rat (n d)
  (let* ((g (gcd n d))
         (n (/ n g))
         (d (/ d g)))
    (if (or (and (negative-p n) (negative-p d))
            (and (positive-p n) (negative-p d)))
        (cons (revert n) (revert d))
      (cons n d))))

(defun print-rat (x)
  (message "%d/%d" (car x) (cdr x)))

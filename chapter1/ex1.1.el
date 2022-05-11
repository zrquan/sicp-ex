;; *Exercise 1.1:* Below is a sequence of expressions. What is the result
;; printed by the interpreter in response to each expression? Assume that the
;; sequence is to be evaluated in the order in which it is presented.


(defconst ANSWERS
  '((10                         . 10)
    ((+ 5 3 4 )                 . 12)
    ((- 9 1)                    . 8)
    ((/ 6 2)                    . 3)
    ((+ (* 2 4) (- 4 6))        . 6)
    ((defvar a 3)               . a)
    ((defvar b (+ a 1))         . b)
    ((+ a b (* a b))            . 19)
    ((= a b)                    . nil)
    ((if (and
          (> b a)
          (< b (* a b)))
         b
       a)                       . 4)
    ((cond ((= a 4) 6)
           ((= b 4) (+ 6 7 a))
           (t 25))              . 16)
    ((+ 2 (if (> b a) b a))     . 6)
    ((* (cond ((> a b) a)
              ((< a b) b)
              (t -1))
        (+ a 1))                . 16)))

(defun valid-answer-p (answer)
  (equal
   (eval (car answer))
   (cdr answer)))

(defun has-invalid-answers (invalid answers)
  (if (null answers) invalid
    (let ((ans (car answers)))
      (if (valid-answer-p ans)
          (has-invalid-answers invalid (cdr answers))
        (has-invalid-answers (cons ans invalid) (cdr answers))))))

(if (has-invalid-answers nil ANSWERS)
    (message "Oh, found invalid answers.")
  (message "Pass!"))

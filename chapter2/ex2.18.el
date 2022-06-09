;; *Exercise 2.18:* Define a procedure `reverse' that takes a list as
;; argument and returns a list of the same elements in reverse order:

;;      (reverse (list 1 4 9 16 25))
;;      (25 16 9 4 1)


(defun ex-reverse (list)
  (if (not (cdr list))
      list
    (append (ex-reverse (cdr list))
            (list (car list)))))

;; Test
(ex-reverse '(1 4 9 16 25))

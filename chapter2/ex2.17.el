;; *Exercise 2.17:* Define a procedure `last-pair' that returns the
;; list that contains only the last element of a given (nonempty)
;; list:

;;      (last-pair (list 23 72 149 34))
;;      (34)


(defun last-pair (list)
  (if (not (cdr list))
      (car list)
    (last-pair (cdr list))))

;; Test
(last-pair '(23 72 149 34))

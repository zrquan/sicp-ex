;; *Exercise 1.30:* The `sum' procedure above generates a linear
;; recursion.  The procedure can be rewritten so that the sum is
;; performed iteratively.  Show how to do this by filling in the
;; missing expressions in the following definition:

;;      (define (sum term a next b)
;;        (define (iter a result)
;;          (if <??>
;;              <??>
;;              (iter <??> <??>)))
;;        (iter <??> <??>))


(defun sum (term a next b)
  (defun iter (a result)
    (if (> a b)
        result
      (iter (funcall next a)
            (+ (funcall term a) result))))
  (iter a 0))

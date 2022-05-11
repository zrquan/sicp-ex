;; *Exercise 1.4:* Observe that our model of evaluation allows for combinations
;; whose operators are compound expressions. Use this observation to describe the
;; behavior of the following procedure:
;;
;; (define (a-plus-abs-b a b)
;;   ((if (> b 0) + -) a b))


(defun a-plus-abs-b (a b)
  "Elisp version"
  (funcall (if (> b 0) '+ '-) a b))

(message "Expect: %d  Actual: %d" 5 (a-plus-abs-b 2 -3))

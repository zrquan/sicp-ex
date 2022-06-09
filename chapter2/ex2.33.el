;; *Exercise 2.33:* Fill in the missing expressions to complete the
;; following definitions of some basic list-manipulation operations
;; as accumulations:
;;
;;      (define (map p sequence)
;;        (accumulate (lambda (x y) <??>) nil sequence))
;;
;;      (define (append seq1 seq2)
;;        (accumulate cons <??> <??>))
;;
;;      (define (length sequence)
;;        (accumulate <??> 0 sequence))


(defun accumulate (op initial sequence)
  (if (not sequence)
      initial
    (funcall op
             (car sequence)
             (accumulate op initial (cdr sequence)))))

(defun ex-map (p sequence)
  (accumulate (lambda (x y)
                (cons (funcall p x) y))
              nil
              sequence))

(defun ex-append (seq1 seq2)
  (accumulate 'cons seq2 seq1))

(defun ex-length (sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))

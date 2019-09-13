#lang racket
(provide my-reverse)

;; below shall also work
;; (define (my-reverse s)
;;   (list->string (reverse (string->list s)))
;;   )

(define (my-reverse s)
  (my-reverse-helper (string->list s) '())
  )
(define (my-reverse-helper s rev)
  (cond
    [(null? s) (list->string rev)]
    [else (my-reverse-helper
            (rest s)
            (cons (first s) rev))
      ]
    )
  )

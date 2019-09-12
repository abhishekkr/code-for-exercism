#lang racket

(provide square total)

(define (square Count) (square_helper Count 1))
(define (square_helper Count Grains)
  (cond
    [(equal? Count 1) Grains]
    [else (square_helper (- Count 1) (* Grains 2))]
    )
  )

(define (total)
  (total_helper 2 1 1) ;; if passed value from 1st sqaure
  )
(define (total_helper ForSquare LastSquareGrains TotalGrains)
  (let
    (
     [ThisSquareGrains (* LastSquareGrains 2)]
     [NextSquare (+ ForSquare 1)]
     )
    (cond
      [(>= ForSquare 65) TotalGrains]
      [else (total_helper NextSquare ThisSquareGrains (+ ThisSquareGrains TotalGrains))]
      )
    )
  )

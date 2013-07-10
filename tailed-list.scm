#lang racket

(require cKanren)

(provide 

 var-tailed-membero

)





(define (var-tailed-membero x lst)
  (fresh (c _tail_)
   (conso c _tail_ lst)   
   (conda
    [(== x c)]
    [(=/= x c)
     (var-tailed-membero x _tail_)]
    )))



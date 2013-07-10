#lang racket 

(require cKanren)

(require "tailed-list.scm")


 ;; (run* (q)(membero 3 q )) ;; infinite loop
 

 (run* (q)(var-tailed-membero 1 q ))
;=> '((1 . _.0))


(run* (q)
      (fresh (x)
	     (var-tailed-membero x q ))) 
;=>'((_.0 . _.1))

(run* (q)
      (fresh (x y r)
	     (var-tailed-membero x r ) 
	     (var-tailed-membero y r)
	     (== q `(,x ,y ,r)  ))) 
;=> '((_.0 _.0 (_.0 . _.1)))

(run* (q)
      (fresh (x y r)
	     (var-tailed-membero `(1 . ,x) r ) 
	     (var-tailed-membero `(2 . ,y) r)
	     (== q `(,x ,y ,r)  )))
;=> '((_.0 _.1 ((1 . _.0) (2 . _.1) . _.2)))



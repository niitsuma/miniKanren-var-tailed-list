var tailed list for miniKanren and cKanren 
=================


# Readme
    
     (run* (q) 
     	   (membero 3 q) )

is infinite loop.
This infinite loop can avoid by defining list ` lst ` as 

     (fresh (tail)
     	    (conso some tail lst)

This meaing is

list tail should be (not unified) var.
( Usually list tail is ` '() ` )  

Using this "list" definition, membero can be

    (define (var-tailed-membero x lst)
      (fresh (some tail)
       (conso some tail lst)   
        (conda
          [(== x some)]
          [(=/= x some)
            (var-tailed-membero x tail)]
      )))

And infinite loop can avoid


# Example

usage


    
    (run* (q)
     (var-tailed-membero 1 q ))
  
    ;;=>'((1 . _.0))


    (run* (q)
     (fresh (x)
      (var-tailed-membero x q ))) 
   
    ;;=> '((_.0 . _.1))


    (run* (q)
     (fresh (x y r)
      (var-tailed-membero x r ) 
      (var-tailed-membero y r)
      (== q (list x y r)  ))) 

    ;; => '((_.0 _.0 (_.0 . _.1)))


    (run* (q)
     (fresh (x y r)
      (var-tailed-membero (cons 1 x) r ) 
      (var-tailed-membero (cons 2 y) r) 
      (== q (list x y r)  ))
     )
	     
    ;;=> '((_.0 _.1 ((1 . _.0) (2 . _.1) . _.2)))




Hirotaka Niitsuma
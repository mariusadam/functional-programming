(defun eliminate_acc (initialList acc n poz)
  (cond
    ((null initialList) acc)
    ((= poz n) (eliminate((cdr initialList) acc n 0)))
    (t eliminate((cdr initiaList) (cons (car initialList)) n (- poz 1))))

 (defun eliminate (initialList n)))
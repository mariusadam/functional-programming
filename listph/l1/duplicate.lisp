; The first line contains the integer  where  is the number of times you need to repeat the elements. 
; The next  lines each contain an integer. These are the  elements in the array.
; HackerRank problem link : https://www.hackerrank.com/challenges/fp-list-replication

(defun repeat (n e)
    (cond
        ((> n 0) (cons e (repeat (- n 1) e)))
        (t nil)
     )
 )

(defun f (n inputList) 
  (cond
      ((not (null inputList)) (append (repeat n (car inputList)) (f n (cdr inputList))))
      (t nil)
   )
)

(defun read_list ()
    (let ((n (read *standard-input* nil)))
        (if (null n)
            nil
            (cons n (read_list)))))

(format t "~{~d~%~}" (f (read) (read_list)))

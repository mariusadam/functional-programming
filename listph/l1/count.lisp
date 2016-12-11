; Count the number of elements in an array without using count, 
; size or length operators (or their equivalents). 
; Link: https://www.hackerrank.com/challenges/fp-list-length

(defun countList (inputList)
	(cond
		((null inputList) 0)
		(t (+ 1 (countList (cdr inputList))))
	)
)

(defun read_list ()
  (let ((n (read *standard-input* nil)))
      (if (null n)
          nil
          (cons n (read_list)))))

(prin1 (countList (read_list)))
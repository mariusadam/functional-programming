; You are given a list of  elements. Reverse the list without using the reverse function. 
; The input and output portions will be handled automatically. You need to write a function with the recommended method signature.
; Link : https://www.hackerrank.com/challenges/fp-reverse-a-list

(defun colecting_reverse (inputList acc)
	(cond
		((null inputList) acc)
		(t (colecting_reverse (cdr inputList) (cons (car inputList) acc)))
	)
)

(defun reverseList (inputList)
	(colecting_reverse inputList nil)
)

(defun read_list ()
  (let ((n (read *standard-input* nil)))
      (if (null n)
          nil
          (cons n (read_list)))))

(format t "~{~d~%~}" (reverseList (read_list)))
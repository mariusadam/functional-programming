; Update the values of a list with their absolute values. 
; The input and output portions will be handled automatically during grading.
; Link: https://www.hackerrank.com/challenges/fp-update-list

(defun absElem (elem)
	(if (< elem 0)
		(- 0 elem)
		elem
	)
)

(defun absList (inputList)
	(cond 
		((null inputList) nil)
		(t (cons (absElem (car inputList)) (absList (cdr inputList))))
	)
)

(defun read_list ()
  (let ((n (read *standard-input* nil)))
      (if (null n)
          nil
          (cons n (read_list)))))

(format t "~{~d~%~}" (absList (read_list)))
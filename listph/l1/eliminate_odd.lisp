
; For a given list with  integers, return a new list removing the elements at odd positions. The input and output portions will be handled automatically. You need to write a function with the recommended method signature.
; Input Format
;  integers contained in the list, each on a separate line.
; Output Format
; Output the list with the integers at odd positions removed i.e. the first element, the third element and so on. The relative positions of the remaining even-position elements should be the same as they were in the original array. Each integer will be on a separate line.
; Link : https://www.hackerrank.com/challenges/fp-filter-positions-in-a-list
(defun eliminate_even_poz (poz inputList)
		(cond
			((null inputList) nil)
			((= (mod poz 2) 0) (eliminate_even_poz (+ poz 1) (cdr inputList)))
			(t (cons (car inputList) (eliminate_even_poz (+ poz 1) (cdr inputList))))
		)
)

(defun filter (inputList)
	(eliminate_even_poz 0 inputList)
)

(defun read_list ()
  (let ((n (read *standard-input* nil)))
      (if (null n)
          nil
          (cons n (read_list)))))

(format t "~{~d~%~}" (filter (read_list)))

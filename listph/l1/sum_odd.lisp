; You are given a list. Return the sum of odd elements from the given list.
; The input and output portions will be handled automatically. You need to write a function with the recommended method signature.
; Link : https://www.hackerrank.com/challenges/fp-sum-of-odd-elements

(defun sumOdd (inputList)
	(cond
		((null inputList) 0)
		((= (mod (car inputList) 2) 1) (+ (car inputList) (sumOdd (cdr inputList))))
		(t (sumOdd (cdr inputList)))
	)
)

(defun read_list ()
  (let ((n (read *standard-input* nil)))
      (if (null n)
          nil
          (cons n (read_list)))))

(prin1 (sumOdd (read_list)))
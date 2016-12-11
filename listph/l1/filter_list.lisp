; Filter a given array of integers and output only those values that are less than a specified value . The output integers should be in the same sequence as they were in the input. You need to write a function with the recommended method signature for the languages mentioned below. For the rest of the languages, you have to write a complete code.

; Input Format

; The first line contains the delimiter . 
; The next  lines each contain an integer, which represents the elements of the list/array. You have to read the input to the End-Of-File.

; Output Format

; Print all the integers from the array that are less than the given upper limit  in value on separate lines. The sequence should be the same as it was in the original array.
; Link https://www.hackerrank.com/challenges/fp-filter-array

(defun filter (x inputList)
		(cond
			((null inputList) nil)
			((< (car inputList) x) (cons (car inputList) (filter x (cdr inputList))))
			(t (filter x (cdr inputList)))
		)
)

(defun read_list ()
  (let ((n (read *standard-input* nil)))
      (if (null n)
          nil
          (cons n (read_list)))))

(format t "~{~d~%~}" (filter (read) (read_list)))

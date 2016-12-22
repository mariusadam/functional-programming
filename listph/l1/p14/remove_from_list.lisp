(defun colecting_reverse (inputList acc)
	(cond
		((null inputList) acc)
		(t (colecting_reverse (cdr inputList) (cons (car inputList) acc)))
	)
)

(defun reverseList (inputList)
	(colecting_reverse inputList nil)
)

(defun collecting_removeElem (input acc e)
	(cond
		((null input) (reverseList acc))
		((= (car input) e) (collecting_removeElem (cdr input) acc e))
		(t (collecting_removeElem (cdr input) (cons (car input) acc) e))
	)
)

(defun removeElem(input e) (collecting_removeElem input nil e))

(defun filterAtoms(input value callback)
	(cond
		((null input) value)
		((null value) (filterAtoms (cdr input) (car input) callback))
		((and (atom (car input)) (funcall callback (car input) value)) (filterAtoms (cdr input) (car input) callback))
		((listp (car input)) (filterAtoms (cdr input) (filterAtoms (car input) value callback) callback))
		(t (filterAtoms (cdr input) value callback))
	)
)

(defun minAtoms(input) (filterAtoms input nil #'(lambda (a b) (< a b))))
(defun maxAtoms(input) (filterAtoms input nil #'(lambda (a b) (> a b))))



(defun removeMax(inputList) (removeElem inputList (maxAtoms inputList)))
(defun removeMin(inputList) (removeElem inputList (minAtoms inputList)))

(defun filterAtoms(input value callback)
	(cond
		((null input) value)
		((null value) (filterAtom (cdr input) (car input) callback))
		((and (atom (car input)) (funcall callback (car input) value)) (filterAtom (cdr input) (car input) callback))
		((listp (car input)) (filterAtom (cdr input) (filterAtom (car input) value callback) callback))
		(t (filterAtom (cdr input) value callback))
	)
)

(defun minAtoms(input) (filterAtoms input nil #'(lambda (a b) (< a b))))
(defun maxAtoms(input) (filterAtoms input nil #'(lambda (a b) (> a b))))

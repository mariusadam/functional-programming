(defun isTree(tree)
	(and (not (null tree)) (listp tree))
)

(defun left(tree) 
	(car (cdr tree))
)

(defun right(tree)
	(car (cdr (cdr tree)))
)

(defun postOrder(tree)
	(if (not (isTree tree))
		nil
		(append
			(postOrder (left tree))
			(postOrder (right tree))
			(list (car tree))
		)
	)
)

(defun inOrder(tree)
	(if (not (isTree tree))
		nil
		(append
			(inOrder (left tree))
			(list (car tree))
			(inOrder (right tree))
		)
	)
)

(defun preOrder(tree)
	(if (not (isTree tree))
		nil
		(append
			(list (car tree))
			(preOrder (left tree))
			(preOrder (right tree))
		)
	)
)
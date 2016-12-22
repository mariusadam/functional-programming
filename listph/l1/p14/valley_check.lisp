; Write a function that check if a given list has valley aspect
; (descending to up till one point then only ascending)

(defun private_isValley(numbers desc last)
	(cond
		((null numbers) (not desc))
		((null last) (private_isValley (cdr numbers) desc (car numbers)))
		((and desc (> (car numbers) last)) (private_isValley (cdr numbers) (not desc) (car numbers)))
		((and (not desc) (< (car numbers) last)) nil)
		(t (private_isValley (cdr numbers) desc (car numbers)))
	)
)

(defun isValley(numbers) (private_isValley numbers t nil))
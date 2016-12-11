; Evaluate e^x for given values of x by 
; using the well known expansion for the first 10 terms.
; Link: https://www.hackerrank.com/challenges/eval-ex

(defun evalx(x above under cnt)
	(cond
		((= cnt 120) 0)
		(t (+ (/ above under) (evalx x (* above x) (* under (+ cnt 1)) (+ cnt 1))))
	)
)
; Create an array of  integers, where the value of  is passed as 
; an argument to the pre-filled function in your editor. 
; This challenge uses a custom checker, so you can create any array of  integers. For example, 
; if n = 4, you could return [1, 1, 1, 1], [1, 2, 3, 4], or any other array of equal length.
; Link: https://www.hackerrank.com/challenges/fp-array-of-n-elements

(defun f (n)
    (cond
        ((> n 0) (cons n (f (- n 1))))
        (t nil)
     )
 )
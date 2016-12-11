(defun read_list ()
  (let ((n (read *standard-input* nil)))
      (if (null n)
          nil
          (cons n (read_list)))))

(format t "~{~d~%~}" (filter (read) (read_list)))
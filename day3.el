;;; -*- lexical-binding: t -*-

(defun solve (file)
  (cl-labels ((line-max (line n &optional (acc 0))
                (if (= n 0) acc
                  (let ((d (seq-max (substring line 0 (- (length line) n -1)))))
                    (line-max (substring line (1+ (seq-position line d)))
                              (1- n)
                              (+ (- d ?0) (* 10 acc)))))))
    (with-work-buffer
      (insert-file-contents-literally file)
      (cl-loop until (eobp)
               for line = (buffer-substring-no-properties (point) (pos-eol))
               sum (line-max line 2) into part1
               sum (line-max line 12) into part2
               do (forward-line)
               finally return (list part1 part2)))))




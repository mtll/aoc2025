;;; -*- lexical-binding: t -*-

(defun solve ()
  (cl-labels ((line-max (line n)
                (cl-loop for start = 0 then (+ (seq-position seq d) start 1)
                         for end from (- (length line) n -1) upto (length line)
                         for seq = (seq-subseq line start end)
                         for d = (seq-max seq)
                         sum (- d ?0)))))
  (with-work-buffer
    (insert-file-contents-literally "aoc3")
    (cl-loop until (eobp)
             for line = (buffer-substring-no-properties (point) (pos-eol))
             sum (line-max line 2) into part1
             sum (line-max line 12) into part2
             do (forward-line)
             finally return (list part1 part2))))

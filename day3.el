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
    (let ((part1 0)
          (part2 0))
      (while (not (eobp))
        (let ((line (buffer-substring-no-properties (point) (pos-eol))))
          (cl-incf part1 (line-max line 2))
          (cl-incf part2 (line-max line 12)))
        (forward-line))
      (list part1 part2))))

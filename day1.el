;;; -*- lexical-binding: t -*-

(defun solve ()
  (with-work-buffer
    (insert-file-contents-literally "aoc1")
    (let ((dial 50)
          (pt1 0)
          (pt2 0))
      (while (not (eobp))
        (let* ((next (string-to-number (buffer-substring (1+ (point)) (pos-eol))))
               (next (+ dial (if (eql (char-after) ?L) (- next) next))))
          (incf pt2 (floor (abs next) 100))
          (when (and (/= 0 dial) (<= next 0)) (incf pt2))
          (when (= 0 (setq dial (mod next 100))) (incf pt1)))
        (forward-line))
      (list pt1 pt2))))




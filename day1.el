;;; -*- lexical-binding: t -*-

(save-window-excursion
  (find-file "aoc1")
  (execute-kbd-macro (kbd "M-< M-% r RET RET ! M-< M-% l RET - RET !"))
  (cl-loop for dial = 50 then (mod newdial 100)
           for i in (string-split (buffer-substring (point-min) (point-max)))
           for newdial = (+ dial (string-to-number i))
           sum (floor (abs newdial) 100) into part2
           count (and (/= 0 dial) (<= newdial 0)) into part2
           count (= 0 dial) into part1
           finally return (progn (revert-buffer nil t)
                                 (list part1 part2))))


;;; -*- lexical-binding: t -*-

(with-current-buffer "aoc1"
  (cl-loop with dial = 50
           for i in (string-split (buffer-substring (point-min) (point-max)))
           for newdial = (+ dial (string-to-number i))
           sum (floor (abs newdial) 100) into part2
           count (and (/= 0 dial) (<= newdial 0)) into part2
           count (= 0 (setf dial (mod newdial 100))) into part1
           finally return (list part1 part2)))

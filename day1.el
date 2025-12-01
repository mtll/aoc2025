;;; -*- lexical-binding: t -*-

(with-current-buffer "aoc1"
  (cl-loop for dial = 50 then (mod newdial 100)
           for i in (string-split (buffer-substring (point-min) (point-max)))
           for newdial = (+ dial (string-to-number i))
           sum (floor (abs newdial) 100) into part2
           when (and (/= 0 dial) (<= newdial 0)) sum 1 into part2
           when (= 0 (setf val (mod newdial 100))) sum 1 into part1
           finally return (list part1 part2)))

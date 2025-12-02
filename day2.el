(with-current-buffer "aoc2"
  (cl-loop with nums = (string-split
                        (buffer-substring (point-min) (point-max))
                        "[-,]")
           with (part1 part2) = '(0 0)
           for (n1 n2) on nums by #'cddr
           do (cl-loop for i from (string-to-number n1) upto (string-to-number n2)
                       for str = (number-to-string i)
                       when (string-match-p "\\`\\([[:digit:]]+\\)\\1\\'" str)
                       do (cl-incf part1 i)
                       when (string-match-p "\\`\\([[:digit:]]+\\)\\1+\\'" str)
                       do (cl-incf part2 i))
           finally return (list part1 part2)))

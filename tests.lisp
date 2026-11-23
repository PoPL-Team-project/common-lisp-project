(load "3musketeers_project3.lisp")

(defvar *pass-count* 0)
(defvar *fail-count* 0)

(defun run-test (fn-name inputs expected actual)
  (let ((passed (equal expected actual)))
    (if passed
        (incf *pass-count*)
        (incf *fail-count*))
    (format t "~&--------------------------------------------------~%")
    (format t "Function : ~A~%" fn-name)
    (format t "Inputs   : ~S~%" inputs)
    (format t "Expected : ~S~%" expected)
    (format t "Actual   : ~S~%" actual)
    (format t "Status   : ~A~%" (if passed "PASS" "FAIL"))))

(defun print-summary ()
  (format t "~&==================================================~%")
  (format t "TOTAL PASSED: ~D | TOTAL FAILED: ~D~%" *pass-count* *fail-count*)
  (format t "==================================================~%"))

(run-test "list-reverse" '((1 2 3)) '(3 2 1) (list-reverse '(1 2 3)))
(run-test "list-reverse (empty)" '(()) nil (list-reverse '()))
(run-test "list-reverse (single)" '((42)) '(42) (list-reverse '(42)))

(run-test "list-flatten" '((1 (2 (3 4)))) '(1 2 3 4) (list-flatten '(1 (2 (3 4)))))
(run-test "list-flatten (deep)" '((((a) b) (c (d)))) '(a b c d) (list-flatten '(((a) b) (c (d)))))
(run-test "list-flatten (empty)" '(()) nil (list-flatten '()))

(run-test "list-remove-duplicates" '((1 2 2 3 1)) '(1 2 3) (list-remove-duplicates '(1 2 2 3 1)))
(run-test "list-remove-duplicates (all same)" '((5 5 5)) '(5) (list-remove-duplicates '(5 5 5)))
(run-test "list-remove-duplicates (empty)" '(()) nil (list-remove-duplicates '()))

(run-test "list-palindrome (true)" '((1 2 1)) t (list-palindrome '(1 2 1)))
(run-test "list-palindrome (false)" '((1 2 3)) nil (list-palindrome '(1 2 3)))
(run-test "list-palindrome (even)" '((a b b a)) t (list-palindrome '(a b b a)))
(run-test "list-palindrome (empty)" '(()) t (list-palindrome '()))

(run-test "merge-sort (<)" '((2 1 5 0) #'<) '(0 1 2 5) (merge-sort '(2 1 5 0) #'<))
(run-test "merge-sort (>)" '((2 1 5 0) #'>) '(5 2 1 0) (merge-sort '(2 1 5 0) #'>))
(run-test "merge-sort (duplicates)" '((3 1 2 3 1) #'<) '(1 1 2 3 3) (merge-sort '(3 1 2 3 1) #'<))
(run-test "merge-sort (empty)" '(() #'<) nil (merge-sort '() #'<))

(print-summary)

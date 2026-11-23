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

(print-summary)

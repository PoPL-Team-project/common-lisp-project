(defun set-member (set item)
  (cond
    ((equal set nil) nil)
    ((equal (car set) item) t)
    (t (set-member (cdr set) item))))

(defun set-union (set1 set2) nil)
(defun set-intersection (set1 set2) nil)
(defun set-diff (set1 set2) nil)
(defun set-symmetric-diff (set1 set2) nil)
(defun get-student-courses (student-id records) nil)
(defun student-average (student-id records) nil)
(defun common-courses (id1 id2 records) nil)

(defun boolean-xor (a b) nil)
(defun boolean-implies (a b) nil)
(defun boolean-iff (a b) nil)
(defun boolean-eval (expr) nil)
(defun boolean-simplify (expr) nil)

(defun list-reverse-helper (lst acc)
  (cond ((equal lst nil) acc)
        (t (list-reverse-helper (cdr lst) (cons (car lst) acc)))))

(defun list-reverse (lst)
  (list-reverse-helper lst nil))

(defun my-append (lst1 lst2)
  (cond ((equal lst1 nil) lst2)
        (t (cons (car lst1) (my-append (cdr lst1) lst2)))))

(defun list-flatten (lst)
  (cond ((equal lst nil) nil)
        ((atom (car lst)) (cons (car lst) (list-flatten (cdr lst))))
        (t (my-append (list-flatten (car lst)) (list-flatten (cdr lst))))))

(defun remove-dups-helper (lst seen)
  (cond ((equal lst nil) nil)
        ((set-member seen (car lst))
         (remove-dups-helper (cdr lst) seen))
        (t (cons (car lst)
                 (remove-dups-helper (cdr lst) (cons (car lst) seen))))))

(defun list-remove-duplicates (lst)
  (remove-dups-helper lst nil))

(defun list-palindrome (lst)
  (equal lst (list-reverse lst)))

(defun split-even (lst)
  (cond ((equal lst nil) nil)
        (t (cons (car lst) (split-odd (cdr lst))))))

(defun split-odd (lst)
  (cond ((equal lst nil) nil)
        (t (split-even (cdr lst)))))

(defun merge-lists (lst1 lst2 pred)
  (cond ((equal lst1 nil) lst2)
        ((equal lst2 nil) lst1)
        ((funcall pred (car lst1) (car lst2))
         (cons (car lst1) (merge-lists (cdr lst1) lst2 pred)))
        (t
         (cons (car lst2) (merge-lists lst1 (cdr lst2) pred)))))

(defun merge-sort (lst pred)
  (cond ((or (equal lst nil) (equal (cdr lst) nil)) lst)
        (t (merge-lists (merge-sort (split-even lst) pred)
                        (merge-sort (split-odd lst) pred)
                        pred))))

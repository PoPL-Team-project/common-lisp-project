(defun set-member (set item)
  ( cond
  ((equal set nil) nil)
  ((equal (car set) item) t)
  (t( set-member (cdr set)item)))) 

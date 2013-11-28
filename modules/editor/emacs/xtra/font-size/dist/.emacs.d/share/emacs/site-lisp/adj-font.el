; http://stackoverflow.com/questions/2091881/emacs-font-sizing-with-ctrl-key-and-mouse-scroll

(provide 'adj-font)

(defun adj-font-incr ()
 (interactive)
 (set-face-attribute 'default nil :height 
  (min 720
   (+ (face-attribute 'default :height) 10))))

(defun adj-font-decr ()
 (interactive)
 (set-face-attribute 'default nil :height 
  (max 80
   (- (face-attribute 'default :height) 10))))

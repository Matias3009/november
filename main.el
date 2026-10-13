

(defun next-buffer-s ()
  "Get the name of the buffer after this buffer"
  (if (window-next-buffers)
    (string-join (list "[" (buffer-name (car (window-next-buffers) )) "]"))
    "[---]"
    )
  )


(defun prev-buffer-s ()
  "Get the name of the buffer before this buffer"
  (interactive)
  (let ((ret "[---]"))
    (if (cadr (window-prev-buffers))
	(catch 'break
	    (dolist (entry (window-prev-buffers) ret)
	      (when (and (not (eq (car entry) (window-buffer)))
			 (not (memq (car entry) (window-next-buffers) )) )
		(progn
		  (setq ret (string-join (list "[" (buffer-name (car entry))  "]")))
		  (throw 'break ret)
		  )
		)
	      )
	  )
      
    
    "[---]"
    )
  )
  )

; (next-buffer-s)
; (prev-buffer-s)
; (message "%S" (window-prev-buffers))
; (buffer-list)

(setq-default mode-line-format
	       (list
		" "
		'mode-line-buffer-identification
		'mode-line-modified
		"   "
		'mode-line-modes
		"   "
		'mode-line-position
		"   "
		'system-name
		" --------- "
		"<"
		'(:eval (propertize (prev-buffer-s) 'face 'italic))
		" | "
		'(:eval (propertize (next-buffer-s) 'face 'italic))
		">"
		)
	       )

(print "hi")

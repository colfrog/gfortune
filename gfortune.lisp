(defpackage gfortune
  (:use #:cl #:gtk4)
  (:export #:fortune))

(in-package #:gfortune)

(defvar fortune-path
  #+openbsd "/usr/games/fortune"
  #-openbsd "fortune")

(defun get-fortune ()
  (let ((s (make-string-output-stream)))
    (uiop:run-program
     (list fortune-path (values-list (uiop:command-line-arguments)))
     :output s)
    (get-output-stream-string s)))

(define-application (:name fortune
		     :id "org.nilio.gfortune")
  (define-main-window
      (window (make-application-window :application *application*))
    (setf (window-title window) "Hello, World!")
    (let ((box (make-box :orientation +orientation-vertical+
			 :spacing 4))
	  (label (make-label :str (get-fortune)))
	  (button (make-button :label "Get Fortune")))
      (setf (widget-vexpand-p label) t
	    (widget-hexpand-p label) t
	    (widget-hexpand-p button) t)
      (box-append box label)
      (box-append box button)
      (connect button "clicked"
	       (lambda (button)
		 (declare (ignore button))
		 (setf (label-text label) (get-fortune))))
      (setf (window-child window) box))
    (unless (widget-visible-p window)
      (window-present window))))

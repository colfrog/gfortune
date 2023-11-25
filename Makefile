LISP ?= sbcl

build:
	$(LISP) --load gfortune.asd \
		--eval '(ql:quickload :gfortune)' \
		--eval '(asdf:make :gfortune)' \
		--eval '(quit)'

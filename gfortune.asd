(asdf:defsystem gfortune
  :version "1.0.0"
  :author "Laurent Cimon <laurent@nilio.ca>"
  :maintainer "Laurent Cimon <laurent@nilio.ca>"
  :license "bsd-2-clause"
  :description "A GTK4 program that shows fortunes from fortune(6)"
  :components ((:file "gfortune"))
  :depends-on (#:gtk4))

;; -*- Mode: Lisp; rcs-header: "$Header: /hope/lwhope1-cam/hope.0/compound/23/LISPexamples/RCS/tools:demo-functions.lisp,v 1.2.1.1 2011/08/24 13:26:18 davef Exp $" -*-

;; Copyright (c) 1987--2012 LispWorks Ltd. All rights reserved.

;; simple code to demonstrate some of the tools.
;; See the LispWorks IDE User Guide.

(in-package "CL-USER")

(defun my-function (x)
  (my-macro 'my-useful-function x))




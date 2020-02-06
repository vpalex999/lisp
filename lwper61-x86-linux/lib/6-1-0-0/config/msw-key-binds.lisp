;; -*- Mode: Lisp; rcs-header: "$Header: /hope/lwhope1-cam/hope.0/compound/63/LISPeditor/RCS/msw-key-binds.lisp,v 1.13.8.1 2011/08/24 13:26:12 davef Exp $" -*-

;; Copyright (c) 1987--2012 LispWorks Ltd. All rights reserved.


(in-package "CL-USER")

;;; Key bindings for MSW emulation (AKA PC mode)
;;; This file is loaded automatically the first time that  PC Mode is used. 

(flet ((pc-bind-key (command key &rest specific)
         (if specific
             (apply 'editor:bind-key command key specific)
           (editor:bind-key command key :global :pc))))

;; Interrupt gestures that override other bindings.
(editor:set-interrupt-keys '("Escape")
                           :pc)

;; Include selection key bindings in PC mode.
(let ((*selection-bind-key* #'pc-bind-key))
  (declare (special *selection-bind-key*))
  (load (current-pathname "selection-key-binds" "lisp")))

;;; Movement

(pc-bind-key "Forward Character Cancelling Selection"                  "Right")
(pc-bind-key "Backward Character Cancelling Selection"                  "Left")
(pc-bind-key "Next Line Cancelling Selection"                           "Down")
(pc-bind-key "Previous Line Cancelling Selection"                         "Up")

(pc-bind-key "Beginning of Line Cancelling Selection"         "Home")
(pc-bind-key "Beginning of Buffer Cancelling Selection"       "Control-Home")
#-mswindows (pc-bind-key "Beginning of Line Cancelling Selection" "Begin")
(pc-bind-key "Beginning of Line Modifying Selection"          "Shift-Home")
#-mswindows (pc-bind-key "Beginning of Line Modifying Selection"  "Shift-Begin")
(pc-bind-key "Beginning Of Line After Prompt Cancelling Selection" "Home" :mode "Pc Execute")
#-mswindows (pc-bind-key "Beginning Of Line After Prompt Cancelling Selection" "Begin" :mode "Pc Execute")
(pc-bind-key "Beginning Of Line After Prompt Modifying Selection" "Shift-Home" :mode "Pc Execute")
#-mswindows (pc-bind-key "Beginning Of Line After Prompt Modifying Selection" "Shift-Begin" :mode "Pc Execute")

(pc-bind-key "End of Line Modifying Selection"                "Shift-End")
(pc-bind-key "End of Line Cancelling Selection"               "End")
(pc-bind-key "End of Buffer Cancelling Selection"             "Control-End")
(pc-bind-key "Beginning Of Buffer Modifying Selection"        "Control-Shift-Home")
(pc-bind-key "Beginning Of Buffer Modifying Selection"        "Meta-Shift-Home")
(pc-bind-key "Beginning Of Buffer Cancelling Selection"       "Meta-Home")
(pc-bind-key "End Of Buffer Modifying Selection"              "Control-Shift-End")
(pc-bind-key "End Of Buffer Modifying Selection"              "Meta-Shift-End")
(pc-bind-key "End Of Buffer Cancelling Selection"             "Meta-End")

(pc-bind-key "Forward Character Modifying Selection"          "Shift-Right")
(pc-bind-key "Forward Word Modifying Selection"               "Control-Shift-Right")
(pc-bind-key "Forward Word Cancelling Selection"              "Control-Right")
(pc-bind-key "Forward Word Modifying Selection"               "Meta-Shift-Right")

(pc-bind-key "Backward Character Modifying Selection"         "Shift-Left")
(pc-bind-key "Backward Word Modifying Selection"              "Control-Shift-Left")
(pc-bind-key "Backward Word Cancelling Selection"             "Control-Left")
(pc-bind-key "Backward Word Modifying Selection"              "Meta-Shift-Left")
(pc-bind-key "Echo Area Backward Character Modifying Selection"             "Shift-Left"  :mode "Pc Echo")
(pc-bind-key "Echo Area Backward Word Modifying Selection"          "Control-Shift-Left"  :mode "Pc Echo")
(pc-bind-key "Echo Area Backward Word Cancelling Selection"               "Control-Left"  :mode "Pc Echo")



(pc-bind-key "Next Line Modifying Selection"                  "Shift-Down")
(pc-bind-key "Previous Line Modifying Selection"              "Shift-Up")
(pc-bind-key "Forward Paragraph Cancelling Selection"         "Control-Down")
(pc-bind-key "Forward Paragraph Modifying Selection"          "Control-Shift-Down")
(pc-bind-key "Backward Paragraph Cancelling Selection"        "Control-Up")
(pc-bind-key "Backward Paragraph Modifying Selection"         "Control-Shift-Up") 
(pc-bind-key "History Previous" "Ctrl-Up" :mode "Pc Execute")
(pc-bind-key "History Next" "Ctrl-Down" :mode "Pc Execute")
(pc-bind-key "History Search" "Ctrl-Shift-Up" :mode "Pc Execute")


(pc-bind-key "Scroll Window Up Moving Point"                  "Prior")
(pc-bind-key "Scroll Window Up Modifying Selection"           "Shift-Prior")
(pc-bind-key "Scroll Window Down Moving Point"                "Next")
(pc-bind-key "Scroll Window Down Modifying Selection"         "Shift-Next")

(pc-bind-key "Delete Previous Character"                      "Shift-Delete")
(pc-bind-key "Kill Line"                                      "Control-Delete")

(pc-bind-key "Un-Kill"                                        "Shift-Insert")
(pc-bind-key "Save Region Preserving Selection"               "Control-Insert")

(pc-bind-key "New Line" "Kp-Enter")




;;; Windows 

(pc-bind-key "Delete Window" "Meta-F4")
(pc-bind-key "Refresh Screen" "Control-F5")

;;;  Case

(pc-bind-key "Capitalize Word" "Control-k")
(pc-bind-key "Uppercase Region" "Control-u")
(pc-bind-key "Lowercase Region" "Control-l")

;;; Prefix Arguments

(pc-bind-key "Set Prefix Argument" "Control-*")


;;; Accelerated commands

;; Because we add accelerators for the following commands in PC mode, these
;; editor bindings are not actually reachable. However, they are defined here
;; so that the editor's online help (Help > Command to Key etc) remains
;; consistent 

;; "File > New"
(pc-bind-key "New Buffer" "ctrl-n")


;; "File > Open..."
(pc-bind-key "Wfind File"  "Control-o") ; not strictly correct as menu item calls
                                            ;  editor:find-file-command , with arguments. But the
				            ;  the effect is most like Wfind File, ensuring
				            ;  it reuses the current window 

;; "File > Save"
(pc-bind-key "Save File" "Control-s")   ; not strictly correct as "File > Save" can call
                                            ;  editor:save-file-as-command
(pc-bind-key "Save All Files" "Control-S")

;; "File > Print..."
(pc-bind-key "Print File" "Control-p")

;; "Edit > Undo"
(pc-bind-key "Undo" "Control-z")

;; "Edit > Cut"
(pc-bind-key "Kill Region" "Control-x") ; not strictly correct as menu item
                                            ;  puts text on the LispWorks clipboard, not
				            ;  the editor kill ring, but the effect is the same.

;; "Edit > Copy"
(pc-bind-key "Save Region Preserving Selection" "Control-c")
(pc-bind-key "Save Region Preserving Selection" "Control-c" :mode "Pc Execute") 

;; "Edit > Paste"
(pc-bind-key "Un-Kill" "Control-v")

;; "Edit > Find..."
(pc-bind-key "Forward Search" "Control-f")

;; "Edit > Select All"
(pc-bind-key "Mark Whole Buffer" "Control-a")



;; Searching
(pc-bind-key "Incremental Search" "F3")
(pc-bind-key "Reverse Incremental Search" "Shift-F3")

(pc-bind-key "Query Replace" #+mswindows "Control-h" #-mswindows "Control-r")

#-mswindows
(pc-bind-key "Delete Window" "Control-w")
#-mswindows
(pc-bind-key "Save All Files And Exit" "Control-q")

#+mswindows
(pc-bind-key "Quoted Insert" "Control-q")


;; Lisp Operations

#+mswindows ; Control-r is Query Replace on other platforms
(pc-bind-key "Transpose Forms" "Control-r")


;; using Emacs commands from MSW emulation

;; Calling an Emacs command.
;; This makes MSW( Ctrl-e Ctrl-k ) == Emacs( Ctrl-k )
(pc-bind-key "Emacs Command" "Control-e")

) ; flet


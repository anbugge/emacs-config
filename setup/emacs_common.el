
(setq script_path (concat shared_setup_path "../scripts/"))
(add-to-list 'load-path script_path)


;;;
;;; Coding style
;;;
(setq c-default-style "linux"
      c-basic-offset 3)
      
;;; No tabs!!!
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq perl-indent-level 4)
(setq python-indent 4)

;;; Prevent unwanted indentation caused by 'extern "C" {'
(add-hook 'c-mode-common-hook
	  (lambda()
	    (c-set-offset 'inextern-lang 0)))

;;; This tells emacs to show the line number in each modeline. 
;;; The modeline is the bar across the bottom of each buffer (except the 
;;; minibuffer, the line of text at the very bottom of the emacs 
;;; window), which displays various info about the buffer. 
(line-number-mode 1)

;;; This tells emacs to show the column number in each modeline. 
;;; When you scroll down with the cursor, emacs will move down the buffer one 
;;; line at a time, instead of in larger amounts.
;;; This adds additional extensions which indicate files normally
;;; handled by cc-mode.
(column-number-mode 1)

;;;
;;; Verilog mode
;;;

(setq-default verilog-case-indent 3)    
;(setq-default verilog-indent-level-directive 0)
;(setq-default verilog-indent-level 3)    
(setq-default verilog-tab-always-indent 1)

;;; Auto complete
;;;(require 'auto-complete-config)
;;;(add-to-list 'ac-dictionary-directories "k:/tools/emacs/scripts/ac-dict")
;;;(ac-config-default)


;;; Load bat-mode when we have BAT/bat, or CMD/cmd files
(setq auto-mode-alist 
      (append 
       (list (cons "\\.[bB][aA][tT]$" 'bat-mode))
       (list (cons "\\.[cC][mM][dD]$" 'bat-mode))
       auto-mode-alist))

  (autoload 'bat-mode "bat-mode"
     "DOS and Windows BAT files" t)

;;; Highlight matching paren
(show-paren-mode 1)
(setq show-paren-delay 0)

;;; Inhibit startup screen
(setq inhibit-startup-screen t)

;;; Map M-g to goto-line
(global-unset-key [?\M-g])
(global-set-key [?\M-g] 'goto-line)

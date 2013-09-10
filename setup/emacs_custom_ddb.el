;;; Dewald's custom emacs setup

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base)))

;; (custom-set-faces
;;   ;; custom-set-faces was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(default ((t (:size "10" :family "Lucida Console"))) t))


(custom-set-faces
 '(default ((t (:foreground "grey" :background "black" :size "10" :family "Lucida Console"))) t))

(set-face-foreground 'font-lock-comment-face "gray50")
(set-face-foreground 'font-lock-constant-face "aquamarine")
(set-face-foreground 'font-lock-function-name-face "aquamarine")
(set-face-foreground 'font-lock-keyword-face "cyan")
(set-face-foreground 'font-lock-preprocessor-face "steelblue1")
;;;(set-face-foreground 'font-lock-reference-face "cadetblue2")
(set-face-foreground 'font-lock-variable-name-face "cyan3")
(set-face-foreground 'font-lock-string-face "tan")
(set-face-foreground 'font-lock-type-face "wheat")


;;; Auto complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "k:/tools/emacs/scripts/ac-dict")
(ac-config-default)

;;; Use installed aspell for spell checking.
(setq-default ispell-program-name "aspell")

;;; Auto-indent after newline
(define-key global-map (kbd "RET") 'newline-and-indent)

;;; Control-space expand
(global-set-key (kbd "C-SPC") 'dabbrev-expand)


;;; Load bat-mode when we have BAT/bat, or CMD/cmd files
(setq auto-mode-alist 
      (append 
       (list (cons "\\.[uU][cC][fF]$" 'ucf-mode))
       auto-mode-alist))

  (autoload 'ucf-mode "ucf-mode"
     "Xilinx UCF constraint files" t)

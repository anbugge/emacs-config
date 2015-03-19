
(server-start)

(setq stack-trace-on-error t)

;;; Show line numbers on the side
(global-linum-mode t)

;;; Map RET to auto indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;;; Custom colors
(set-cursor-color "#ffffff") 

(set-face-foreground 'font-lock-comment-face "gray50")
(set-face-foreground 'font-lock-constant-face "aquamarine")
(set-face-foreground 'font-lock-function-name-face "aquamarine")
(set-face-foreground 'font-lock-keyword-face "cyan")
(set-face-foreground 'font-lock-preprocessor-face "steelblue1")
;;;(set-face-foreground 'font-lock-reference-face "cadetblue2")
(set-face-foreground 'font-lock-variable-name-face "cyan3")
(set-face-foreground 'font-lock-string-face "tan")
(set-face-foreground 'font-lock-type-face "wheat")

;;; Move line/selection by M-up / M-down
(require 'move-text)
(defun move-text-and-point-up ()
  (interactive)
  (move-text-up 1)
  (previous-line))
                             
(define-key global-map (kbd "S-M-<up>") 'move-text-up)
(define-key global-map (kbd "M-<up>") 'move-text-and-point-up)
(define-key global-map (kbd "M-<down>") 'move-text-down)

;;; Comment/uncomment the current line
(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

(define-key global-map (kbd "C-c -") 'toggle-comment-on-line)

;;; Map align-current to C-c a
(define-key global-map (kbd "C-c a") 'align-current)
(define-key global-map (kbd "C-c A") 'align-entire)

;;; Save Emacs sessions
(desktop-save-mode 1)


;; "pull" the next line onto the end of the current line, compressing whitespace.
(defun pull-next-line() 
  (interactive) 
  (move-end-of-line 1) 
  (kill-line)
  (just-one-space))

(global-set-key (kbd "M-J") 'pull-next-line)

;; Re-mapped just-one-space because meta-space is finder on mac
(global-set-key (kbd "S-M-SPC") 'just-one-space)


;; Load CEDET.
(semantic-mode 1)

;; Enable EDE (Project Management) features
(global-ede-mode 1)


;; Custom semantic key bindings
(global-set-key (kbd "C-c . j") 'semantic-ia-fast-jump)
(global-set-key [S-mouse-2] 'semantic-ia-fast-mouse-jump)

;;;
;;; JSHint Mode
;;;
(add-to-list 'load-path  (concat script_path "jshint-mode"))
(require 'flymake-jshint)
(add-hook 'javascript-mode-hook
          (lambda () (flymake-mode t)))

;; Turns on flymake for all files which have a flymake mode
(add-hook 'find-file-hook 'flymake-find-file-hook)

;;;
;;; Editorconfig
;;;
(load "editorconfig")

;;;
;;; ECB
;;;
(add-to-list 'load-path (concat script_path "ecb"))

(require 'ecb)


;;;
;;; Rebox2
;;;
(add-to-list 'load-path (concat script_path "rebox2"))

(setq rebox-style-loop '(24 16))
(require 'rebox2)
(global-set-key [(meta q)] 'rebox-dwim)
(global-set-key [(shift meta q)] 'rebox-cycle)

;;; setup rebox for C
(add-hook 'c-mode-hook (lambda ()
                         (set (make-local-variable 'rebox-style-loop) '(245 548))
                         (set (make-local-variable 'rebox-min-fill-column) 60)
                         (rebox-mode 0)))

;; Don't load any version control stuff
;(setq vc-handled-backends ())



;;; Auto complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat script_path "ac-dict"))
(ac-config-default)

(defun my-c-mode-cedet-hook ()
  (add-to-list 'ac-sources 'ac-source-gtags)
  (add-to-list 'ac-sources 'ac-source-semantic))
(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)


;;
;; Drop temporary files in $TMPDIR/emacs$UID/
;;
(defconst emacs-tmp-dir (format "%s/%s%s/" temporary-file-directory "emacs" (user-uid)))
(setq backup-directory-alist
      `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transforms
      `((".*" ,emacs-tmp-dir t)))
(setq auto-save-list-file-prefix
      emacs-tmp-dir)


(defun bf-pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
    (nxml-mode)
    (goto-char begin)
    (while (search-forward-regexp "\>[ \\t]*\<" nil t) 
      (backward-char) (insert "\n"))
    (indent-region begin end))
  (message "Ah, much better!"))

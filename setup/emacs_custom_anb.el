
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
(define-key global-map (kbd "M-<up>") 'move-text-up)
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


;;;;    CEDET is now included in Emacs

;; Load CEDET.
;; See cedet/common/cedet.info for configuration details.
;; IMPORTANT: For Emacs >= 23.2, you must place this *before* any
;; CEDET component (including EIEIO) gets activated by another 
;; package (Gnus, auth-source, ...).
  ;(load-file "k:/tools/emacs/scripts/cedet-1.1/common/cedet.el")

;; Enable EDE (Project Management) features
  ;(global-ede-mode 1)

;; Enable EDE for a pre-existing C++ project
;; (ede-cpp-root-project "NAME" :file "~/myproject/Makefile")


;; Enabling Semantic (code-parsing, smart completion) features
;; Select one of the following:

;; * This enables the database and idle reparse engines
  ;(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode,
;;   imenu support, and the semantic navigator
;; (semantic-load-enable-code-helpers)

;; * This enables even more coding tools such as intellisense mode,
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
  ;(semantic-load-enable-gaudy-code-helpers)

;; * This enables the use of Exuberant ctags if you have it installed.
;;   If you use C++ templates or boost, you should NOT enable it.
;; (semantic-load-enable-all-exuberent-ctags-support)
;;   Or, use one of these two types of support.
;;   Add support for new languages only via ctags.
;; (semantic-load-enable-primary-exuberent-ctags-support)
;;   Add support for using ctags as a backup parser.
;; (semantic-load-enable-secondary-exuberent-ctags-support)

;; Enable SRecode (Template management) minor-mode.
;; (global-srecode-minor-mode 1)

  ;(require 'semantic-ia)
  ;(require 'semantic-gcc)


;;; MinGW include dir for semantic analysis
; (semantic-add-system-include "C:/QtSDK/mingw/include/" 'c-mode)


;; Custom semantic key bindings
(global-set-key (kbd "C-c . j") 'semantic-ia-fast-jump)
(global-set-key [S-mouse-2] 'semantic-ia-fast-mouse-jump)


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
                         (rebox-mode 1)))

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



;; The content in custom-set-* should be merged with whatever you have there from before.


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 64 72 80 88 96 104 112 120))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "grey" :background "black" :size "10" :family "Lucida Console")))))


(add-to-list 'load-path "~/.emacs.d/")




;; Modify this as you like.
;; It must point to the setup folder within the git repo.
(setq shared_setup_path "~/work/emacs/setup/")


;; Leave these lines as is
(add-to-list 'load-path shared_setup_path)
(load "emacs_common.el")


;; Adapt this to name your personal custom file
(load "emacs_custom_xxx.el")

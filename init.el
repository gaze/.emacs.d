(require 'org)

(add-to-list 'load-path (expand-file-name "modules" user-emacs-directory))

(require 'z-packages)
;; (require 'z-osx)

;; (require 'haskell-mode)
(require 'init-ui)
(require 'init-evil)
;; (require 'init-python)
(require 'yasnippet)

(add-to-list 'load-path (expand-file-name "copied/igor-mode" user-emacs-directory))
;(require 'igor-mode)

;; (setq inferior-lisp-program "/usr/local/bin/sbcl")

;;(global-auto-complete-mode t)
;;(add-to-list 'ac-modes 'lisp-mode)

;;(add-hook 'slime-mode-hook 'set-up-slime-ac)
;;(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
;;(eval-after-load "auto-complete"
;;  '(add-to-list 'ac-modes 'slime-repl-mode))

;;(slime-setup '(slime-fancy slime-asdf))

;;(z-require-package 'skewer-mode)

;;(load "~/.machspec.el")

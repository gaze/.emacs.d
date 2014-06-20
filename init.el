(require 'org)

(add-to-list 'load-path (expand-file-name "modules" user-emacs-directory))

(require 'z-packages)
(require 'z-osx)

(require 'haskell-mode)
(require 'init-ui)
(require 'init-evil)

(require 'yasnippet)

;; (defun things ()
;;  (interactive)
;;  (find-file (concat dropbox-dir "things.org")))

;;(z-require-package 'skewer-mode)

;;(load "~/.machspec.el")

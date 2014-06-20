(z-require-package 'scala-mode2)

(add-to-list 'load-path
	     (concat user-emacs-directory "ensime/elisp"))
(require 'ensime)

(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(provide 'init-scala)

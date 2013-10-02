(require 'setup-package)

(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path site-lisp-dir)

(defun init--install-packages ()
  (packages-install
   '(magit
     paredit)))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

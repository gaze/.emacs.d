(require 'org)
(add-to-list 'load-path user-emacs-directory)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(defun z-require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (z-require-package package min-version t)))))


(z-require-package 'magit)

(defun things ()
  (interactive)
  (find-file (concat dropbox-dir "things.org")))

; (load "~/.machspec.el")

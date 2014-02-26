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

(package-initialize)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/irony-mode/elisp"))
(setf irony-server-executable (expand-file-name "~/.emacs.d/irony-mode/build/server/irony-server"))
(require 'auto-complete)
(require 'yasnippet)
(require 'irony) ;Note: hit `C-c C-b' to open build 

;; the ac plugin will be activated in each buffer using irony-mode
(irony-enable 'ac)             ; hit C-RET to trigger completion

(defun my-c++-hooks ()
  "Enable the hooks in the preferred order: 'yas -> auto-complete -> irony'."
  ;; be cautious, if yas is not enabled before (auto-complete-mode 1), overlays
  ;; *may* persist after an expansion.
  (yas/minor-mode-on)
  (auto-complete-mode 1)

  ;; avoid enabling irony-mode in modes that inherits c-mode, e.g: php-mode
  (when (member major-mode irony-known-modes)
    (irony-mode 1)))

(add-hook 'c++-mode-hook 'my-c++-hooks)
(add-hook 'c-mode-hook 'my-c++-hooks)

(z-require-package 'magit)

(defun things ()
  (interactive)
  (find-file (concat dropbox-dir "things.org")))

(load "~/.machspec.el")


(setq irony-libclang-additional-flags
        '("-isystem" "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/c++/v1"
          "-isystem" "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include"
          "-isystem" "/usr/local/include"
          "-I" "."
          "-x" "c++"
          "-std=c++11"))

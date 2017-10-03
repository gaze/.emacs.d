(require 'org)

(add-to-list 'load-path (expand-file-name "modules" user-emacs-directory))

(require 'z-packages)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; (require 'haskell-mode)
(require 'init-ui)
;; (require 'init-evil)
;; (require 'init-vhdl)
;; (require 'init-python)
; (require 'yasnippet)

(require 'cl)
(setq inferior-lisp-program  "/usr/local/bin/sbcl") ;modify to taste
(require 'slime)
(slime-setup '(slime-fancy slime-asdf))

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; these give you unicode
(set-language-environment "UTF-8")
(setenv "LC_LOCALE" "en_US.UTF-8")
(setenv "LC_CTYPE" "en_US.UTF-8")
(setq slime-net-coding-system 'utf-8-unix)

;; highlight parens
(require 'paren)
(show-paren-mode t)

(setq racer-rust-src-path "/Users/gaze/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src")
(setq racer-cmd "/Users/gaze/.cargo/bin/racer")

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

;; (package-install 'intero)
;; (add-hook 'haskell-mode-hook 'intero-mode)

;; (setenv "PATH" (concat (getenv "PATH") ":/Users/gaze/Library/Haskell/bin/"))
;; (setq exec-path (append exec-path '("/Users/gaze/Library/Haskell/bin/")))

;; (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin/"))
;; (setq exec-path (append exec-path '("/usr/local/bin")))

;;(load "~/.machspec.el")

(require 'org)
(require 'package)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'load-path (expand-file-name "modules" user-emacs-directory))

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(require 'use-package)

(straight-use-package 'evil)

(use-package evil
                      :init
                      (setq evil-want-keybinding nil)
                      (evil-mode 1))

(straight-use-package 'exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; (require 'haskell-mode)
(require 'init-ui)
;; (require 'init-evil)
;; (require 'init-vhdl)
;; (require 'init-python)
; (require 'yasnippet)

(straight-use-package 'clojure-mode)
(straight-use-package 'cider)
(straight-use-package 'smartparens)
(add-hook 'clojure-mode-hook #'smartparens-strict-mode)

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; highlight parens
(require 'paren)
(show-paren-mode t)


;; C++ Features

(straight-use-package 'lsp-mode)
(straight-use-package 'lsp-ui)
(straight-use-package 'company-lsp)
(straight-use-package 'ccls)

(use-package lsp-mode :commands lsp)
(use-package lsp-ui :commands lsp-ui-mode)

(use-package company
  :init
  (setq completion-styles `(basic partial-completion emacs22 initials
                                ,(if (version<= emacs-version "27.0") 'helm-flex 'flex)))
  (setq company-tooltip-align-annotations t
        company-tooltip-limit 14
        company-idle-delay 0
        company-echo-delay (if (display-graphic-p) nil 0)
        company-minimum-prefix-length 2
        company-require-match 'never
        company-dabbrev-ignore-case nil
        company-dabbrev-downcase nil
        company-global-modes '(not erc-mode message-mode help-mode gud-mode eshell-mode shell-mode)
        company-backends '(company-capf)
        company-frontends '(company-pseudo-tooltip-frontend
                            company-echo-metadata-frontend))
  :config
  (global-company-mode +1))

(use-package company-lsp :commands company-lsp)
(setq company-tooltip-align-annotations t)

(use-package ccls
             :hook ((cmode c++mode objc-mode cuda-mode) .
                    (lambda () (require 'ccls) (lsp))))

(setq ccls-sem-highlight-method 'font-lock)

(setq ccls-executable "/usr/bin/ccls")

(straight-use-package 'ivy)
(straight-use-package 'counsel)

(use-package ivy :ensure t
  :diminish (ivy-mode . "")
  :bind
  (:map ivy-mode-map
   ("C-'" . ivy-avy))
  :config
  (ivy-mode 1)
  ;; add ‘recentf-mode’ and bookmarks to ‘ivy-switch-buffer’.
  (setq ivy-use-virtual-buffers t)
  ;; number of result lines to display
  (setq ivy-height 10)
  ;; does not count candidates
  (setq ivy-count-format "")
  ;; no regexp by default
  (setq ivy-initial-inputs-alist nil)
  ;; configure regexp engine.
  (setq ivy-re-builders-alist
	;; allow input not in order
        '((t   . ivy--regex-ignore-order))))


(straight-use-package 'projectile)
(projectile-mode +1)

(straight-use-package 'magit)

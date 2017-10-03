;; WINDOW

(z-require-package 'monokai-theme)
(load-theme 'monokai t)

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(menu-bar-mode -1)

;; the blinking cursor is nothing, but an annoyance
(blink-cursor-mode -1)

;; disable startup screen
(setq inhibit-startup-screen t)

;; nice scrolling
;; (setq scroll-margin 0
;;       scroll-conservatively 100000
;;       scroll-preserve-screen-position 1)

;;; GUTTER / FRINGE

;; make the fringe (gutter) smaller
;; the argument is a width in pixels (the default is 8)
(if (fboundp 'fringe-mode)
    (fringe-mode 4))

(z-require-package 'git-gutter-fringe)
(when (window-system)
  (require 'git-gutter-fringe))

(global-git-gutter-mode +1)
(setq-default indicate-buffer-boundaries 'left)
(setq-default indicate-empty-lines +1)

;;; MODELINE

(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

(z-require-package 'smart-mode-line)
(sml/setup)
(sml/apply-theme 'respectful)

;; INPUT BEHAVIOR

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

(setq mouse-wheel-follow-mouse 't)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; BUFFER

(z-require-package 'rainbow-delimiters)
(require 'rainbow-delimiters)

(set-face-attribute 'default nil :font "PragmataPro-12")
(set-face-attribute 'fixed-pitch nil :font "PragmataPro-12")
(set-face-attribute 'variable-pitch nil :font "Pt Sans-12")
(set-face-attribute 'font-lock-comment-face nil :font "Pt Sans-12")

(z-require-package 'fill-column-indicator)
(define-globalized-minor-mode global-fci-mode fci-mode
  (lambda () (fci-mode 1)))

(global-fci-mode 1)

(font-lock-add-keywords nil
    '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))


;;;;;;;;;;; BETTER DEFAULTS from technomancy

(ido-mode t)
(setq ido-enable-flex-matching t)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'saveplace)
(setq-default save-place t)

(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(show-paren-mode 1)
(setq-default indent-tabs-mode nil)
(setq x-select-enable-clipboard t
    x-select-enable-primary t
    save-interprogram-paste-before-kill t
    apropos-do-all t
    mouse-yank-at-point t
    save-place-file (concat user-emacs-directory "places")
    backup-directory-alist `(("." . ,(concat user-emacs-directory
                                             "backups"))))

(provide 'init-ui)

;; From prelude-ui.el of bbatsov

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(menu-bar-mode -1)

;; the blinking cursor is nothing, but an annoyance
(blink-cursor-mode -1)

;; disable startup screen
(setq inhibit-startup-screen t)

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; make the fringe (gutter) smaller
;; the argument is a width in pixels (the default is 8)
(if (fboundp 'fringe-mode)
    (fringe-mode 4))

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

(z-require-package 'solarized-theme)
(load-theme 'solarized-light)

(set-face-attribute 'default nil :font "PragmataPro-14")
(set-face-attribute 'fixed-pitch nil :font "PragmataPro-14")
(set-face-attribute 'variable-pitch nil :font "Pt Sans-14")
(set-face-attribute 'font-lock-comment-face nil :font "Pt Sans-14")

(z-require-package 'powerline)
(powerline-default-theme)

(z-require-package 'fill-column-indicator)
(define-globalized-minor-mode global-fci-mode fci-mode
  (lambda () (fci-mode 1)))

(global-fci-mode 1)

(font-lock-add-keywords nil
    '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))

(z-require-package 'git-gutter-fringe)
(when (window-system)
  (require 'git-gutter-fringe))

(global-git-gutter-mode +1)
(setq-default indicate-buffer-boundaries 'left)
(setq-default indicate-empty-lines +1)

(z-require-package 'smart-mode-line)
(require 'smart-mode-line)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(sml/setup)

(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

(setq mouse-wheel-follow-mouse 't)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

(z-require-package 'rainbow-delimiters)

(require 'rainbow-delimiters)
(provide 'init-ui)

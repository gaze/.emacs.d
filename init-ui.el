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

(load-theme 'molokai t)

(set-face-attribute 'default nil :font "PragmataPro-9")
(set-face-attribute 'fixed-pitch nil :font "PragmataPro-9")
;; (set-face-attribute 'variable-pitch nil :font "Pt Sans-9")

(z-require-package 'powerline)
(powerline-default-theme)


(provide 'init-ui)
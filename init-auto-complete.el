(z-require-package 'auto-complete)
(global-auto-complete-mode t)

(setq ac-expand-on-auto-complete nil)
(setq ac-auto-start nil)
(setq ac-dwim nil)

(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)

(provide 'init-auto-complete)

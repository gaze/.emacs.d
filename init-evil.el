(z-require-package 'evil)

(require 'evil)

(setq evil-auto-indent t)
(setq evil-regexp-search t)
(setq evil-want-C-i-jump t)

(add-hook 'text-mode-hook 'turn-on-evil-mode)
(add-hook 'prog-mode-hook 'turn-on-evil-mode)
(add-hook 'comint-mode-hook 'turn-off-evil-mode)
(add-hook 'Info-mode-hook 'turn-off-evil-mode)

(provide 'init-evil)

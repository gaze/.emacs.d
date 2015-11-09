(require 'evil)

(z-require-package 'evil)
(z-require-package 'evil-numbers)
(z-require-package 'evil-visualstar)
(z-require-package 'evil-nerd-commenter)
(z-require-package 'evil-indent-textobject)
(z-require-package 'evil-matchit)
(z-require-package 'evil-exchange)
(z-require-package 'evil-surround)

(setq evil-search-module 'evil-search)
(setq evil-magic 'very-magic)

;; (setq evil-emacs-state-cursor '("#dc322f" box))
;; (setq evil-normal-state-cursor '("#6c71c4" box))
;; (setq evil-visual-state-cursor '("#6c71c4" box))
;; (setq evil-insert-state-cursor '("#2aa198" bar))
;; (setq evil-replace-state-cursor '("#2aa198" bar))
;; (setq evil-operator-state-cursor '("#2aa198" hollow))

(setq evilnc-hotkey-comment-operator "gc")

(require 'evil)
(require 'evil-nerd-commenter)
(require 'evil-indent-textobject)
(require 'evil-visualstar)

(evil-exchange-install)

(setq evil-auto-indent t)
(setq evil-regexp-search t)
(setq evil-want-C-i-jump t)

(add-hook 'text-mode-hook 'turn-on-evil-mode)
(add-hook 'prog-mode-hook 'turn-on-evil-mode)
(add-hook 'comint-mode-hook 'turn-off-evil-mode)
(add-hook 'Info-mode-hook 'turn-off-evil-mode)

(defadvice evil-ex-search-next (after advice-for-evil-ex-search-next activate)
  (evil-scroll-line-to-center (line-number-at-pos)))

(defadvice evil-ex-search-previous (after advice-for-evil-ex-search-previous activate)
  (evil-scroll-line-to-center (line-number-at-pos)))

(defadvice evil-jump-forward (after advice-for-evil-jump-forward activate)
  (evil-scroll-line-to-center (line-number-at-pos)))

(defadvice evil-jump-backward (after advice-for-evil-jump-backward activate)
  (evil-scroll-line-to-center (line-number-at-pos)))


(define-key evil-normal-state-map "gd" 'ido-switch-buffer)

 (setq ring-bell-function 'ignore)
(provide 'init-evil)

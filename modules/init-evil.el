(require 'evil)

;; (setq evil-search-module 'evil-search)
;; (setq evil-magic 'very-magic)

(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

(setq evilnc-hotkey-comment-operator "gc")

(z-require-package 'evil)
(z-require-package 'evil-numbers)
(z-require-package 'evil-visualstar)
(z-require-package 'evil-nerd-commenter)
(z-require-package 'evil-indent-textobject)
(z-require-package 'evil-matchit)
(z-require-package 'evil-exchange)
(z-require-package 'evil-surround)

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

;; Modeline highlighting of evilness by bling

(defun my-evil-modeline-change (default-color)
  "changes the modeline color when the evil mode changes"
  (let ((color (cond ((evil-insert-state-p) '("#eee8d5" . "#ffffff"))
                     ((evil-visual-state-p) '("#eee8d5" . "#ffffff"))
                     ((evil-normal-state-p) default-color)
                     (t '("#073642" . "#ffffff")))))
    (set-face-background 'mode-line (car color))
    (set-face-foreground 'mode-line (cdr color))))

(lexical-let ((default-color (cons (face-background 'mode-line)
                                   (face-foreground 'mode-line))))
  (add-hook 'post-command-hook (lambda () (my-evil-modeline-change default-color))))


 (setq ring-bell-function 'ignore)
(provide 'init-evil)

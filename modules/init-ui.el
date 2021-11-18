
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


;; BUFFER

;;(set-face-attribute 'variable-pitch nil :font "Pt Sans-12")
;;(set-face-attribute 'font-lock-comment-face nil :font "Pt Sans-12")

;;(straight-use-package 'fill-column-indicator)
;;(define-globalized-minor-mode global-fci-mode fci-mode
;;  (lambda () (fci-mode 1)))

;;(global-fci-mode 1)

;;(font-lock-add-keywords nil
;;    '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))

;;;;;;;;;;; BETTER DEFAULTS from technomancy

;;(ido-mode t)
;;(setq ido-enable-flex-matching t)

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


(provide 'init-ui)

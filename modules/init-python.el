(z-require-package 'anaconda-mode)
(require 'anaconda-mode)

(add-hook 'python-mode-hook 'anaconda-mode)


(defun annotate-pdb ()
  (interactive)
  (highlight-lines-matching-regexp "import ipdb")
  (highlight-lines-matching-regexp "ipdb.set_trace()"))
(add-hook 'python-mode-hook 'annotate-pdb)

(provide 'init-python)

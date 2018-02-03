(require 'org)

;; Set up source code fontification
(setq org-src-fontify-natively t)


(define-key org-mode-map (kbd "<insert> j t s") 'org-set-tags)
(define-key org-mode-map (kbd "<insert> j t t") 'org-tags-view)
(define-key org-mode-map (kbd "<insert> j v p") 'org-toggle-pretty-entities)
(define-key org-mode-map (kbd "<insert> j v l") 'org-toggle-link-display)
(define-key org-mode-map (kbd "<insert> j i l") 'org-insert-link)

(add-hook 'org-mode-hook
					(lambda ()
						(my/latex-mode-setup)
						;; make org mode wrap lines
						(visual-line-mode)))

(use-package org-iv
	:defer t
	:config
 (org-iv/add-to-alist
	 'org-iv/config-alist
	 `(("default"
			:front-html-file ,(expand-file-name "~/.emacs.d/org-iv/default-front.html" org-iv/root)
			;; The file put on front of the html generated by org-file.
			:back-html-file ,(expand-file-name "~/.emacs.d/org-iv/default-back.html"  org-iv/root)
			;; The file put on back of the html generated by org-file.
			:backend 'html
			;; The org-export-backend we choose
			:web-test-root ,(expand-file-name "~/.emacs.d/org-iv/root" "default" org-iv/root)
			;; where we copy the content of web-resource-dir into
			:web-test-port 9876))))

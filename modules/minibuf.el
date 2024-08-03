(rc/require 'vertico)
(setq vertico-cycle t)
(setq vertico-resize nil)
(vertico-mode 1)
(define-key vertico-map (kbd "M-DEL") #'vertico-directory-delete-word)

(rc/require 'marginalia)
(marginalia-mode 1)

(rc/require 'orderless)
(setq completion-styles '(orderless basic))

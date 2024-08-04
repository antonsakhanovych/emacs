;; Compilation keybindings
(require 'compile)
(global-set-key (kbd "C-c c") #'compile)
(global-set-key (kbd "C-c r") #'recompile)
(setq-default compile-command "")

;; Magit
(rc/require 'magit)
(global-set-key (kbd "C-c m s") 'magit-status)
(global-set-key (kbd "C-c m l") 'magit-log)

;; Auto Completion
(rc/require 'company)
(require 'company)
(global-company-mode 1)

;; Compilation buffer color
(require 'ansi-color)

(defun prog/colorize-compilation-buffer ()
  (ansi-color-apply-on-region compilation-filter-start (point)))
(add-hook 'compilation-filter-hook 'prog/colorize-compilation-buffer)

(rc/require 'smartparens)
(require 'smartparens-config)
(add-hook 'prog-mode-hook #'smartparens-mode)

(rc/require 'tree-sitter)
(rc/require 'tree-sitter-langs)
(global-tree-sitter-mode)
;; (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

(rc/require 'yasnippet)
(require 'yasnippet)
(setq yas/triggers-in-field nil)
(setq yas-snippet-dirs '("~/.config/emacs/snippets"))
(yas-global-mode 1)

;; (require 'simpc-mode)
;; (add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

(rc/require
 'rust-mode
 'typescript-mode
 'go-mode
 'lua-mode
 'markdown-mode)

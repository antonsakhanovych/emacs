;; Compilation keybindings
(require 'compile)
(global-set-key (kbd "C-c c") #'compile)
(global-set-key (kbd "C-c r") #'recompile)
(setq-default compile-command "")

;; Compilation buffer color

(require 'ansi-color)

(defun prog/colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region compilation-filter-start (point))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'prog/colorize-compilation-buffer)

(rc/require 'paredit)
(add-hook 'prog-mode-hook 'enable-paredit-mode)

(rc/require 'tree-sitter)
(rc/require 'tree-sitter-langs)
(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

(rc/require 'yasnippet)
(require 'yasnippet)
(setq yas/triggers-in-field nil)
(setq yas-snippet-dirs '("~/.config/emacs/snippets"))
(yas-global-mode 1)

(setq whitespace-style '(face tabs spaces trailing space-mark tab-mark))

(defun prog/whitespace-handler ()
  (interactive)
  (whitespace-mode 1)
  (add-to-list 'write-file-functions) 'delete-trailing-whitespace)

(add-hook 'prog-mode-hook 'prog/whitespace-handler)


;; (require 'simpc-mode)
;; (add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

(rc/require
 'rust-mode
 'typescript-mode
 'go-mode
 'lua-mode
 'markdown-mode)


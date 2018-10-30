;; ____________________________________________________________________________
;; Aquamacs custom-file warning:
;; Warning: After loading this .emacs file, Aquamacs will also load
;; customizations from `custom-file' (customizations.el). Any settings there
;; will override those made here.
;; Consider moving your startup settings to the Preferences.el file, which
;; is loaded after `custom-file':
;; ~/Library/Preferences/Aquamacs Emacs/Preferences
;; _____________________________________________________________________________
(global-set-key "\M-g" 'goto-line)
(global-set-key "\C-g" 'goto-line)

(set-frame-width (selected-frame) 120)
(set-frame-height (selected-frame) 60)

;; font colors
(defun color-theme()
  (interactive "")
  (setq default-frame-alist
				'((foreground-color . "white")
					(background-color . "black")
					(background-mode  . dark)))
  (set-cursor-color "green")
  (set-mouse-color "white")
  (custom-set-faces
   '(default   ((t (:background "black" :foreground "white" ))))
   '(cursor    ((t (:background "white" :foreground "black" ))))
   '(highlight ((t (:background "yellow" :foreground "black"))))
   '(region    ((t (:background "blue" :foreground "white"))))
   '(isearch   ((t (:background "blue" :foreground "white"))))
   '(trailing-whitespace          ((t (:background "RoyalBlue"))))
   '(font-lock-comment-face       ((t (:foreground "green"))))
   '(font-lock-function-name-face ((t (:foreground "orange"))))
   '(font-lock-builtin-face       ((t (:foreground "magenta"))))
   '(font-lock-string-face        ((t (:foreground "red"))))
   '(font-lock-constant-face      ((t (:foreground "cyan"))))
   '(font-lock-keyword-face       ((t (:foreground "RoyalBlue"))))
   '(font-lock-type-face          ((t (:foreground "green"))))
   '(font-lock-variable-name-face ((t (:foreground "RoyalBlue"))))
   '(font-lock-warning-face       ((t (:foreground "red"))))))

(color-theme)

(global-font-lock-mode t)

(tool-bar-mode -1)

(setq make-backup-files nil)

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

(defun make-backup-file-name(file)
  (concat "~/.emacs.d/auto-save-list/~" (file-name-nondirectory file) "~"))

(autoload 'markdown-mode "~/.emacs.d/markdown-mode.el"
	"Major mode for editing Markdown files" t)
(setq auto-mode-alist
	(cons '("\\.markdown" . markdown-mode) auto-mode-alist))

(setq markdown-command "multimarkdown")

(setq mac-option-modifier 'meta)

(eval-after-load "tree-widget"
  '(if (boundp 'tree-widget-themes-load-path)
       (add-to-list 'tree-widget-themes-load-path "~/.emacs.d/")))

(autoload 'imenu-tree "imenu-tree" "Imenu tree" t)
(autoload 'tags-tree "tags-tree" "TAGS tree" t)

(setq ecb-source-path '("~/Documents/dev"))
(setq stack-trace-on-error t)

;;(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
;;(require 'csharp-mode)

(setq ecb-tip-of-the-day nil)

(add-to-list 'load-path "~/.emacs.d/inf-ruby.el")
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(autoload 'ruby-mode "ruby-mode" "Major mode for editing Ruby code" t)

(add-hook 'ruby-mode-hook (lambda () (local-set-key "\r" 'newline-and-indent)))

(require 'inf-ruby)

(require 'ruby-electric)
(add-hook 'ruby-mode-hook (lambda () (ruby-electric-mode t)))

(autoload 'js2-mode "~/.emacs.d/js2-mode.el" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(auto-fill-mode -1)
(remove-hook 'text-mode-hook #'turn-on-auto-fill)

(setq js-indent-level 2)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(add-hook 'html-mode-hook
        (lambda ()
          ;; Default indentation is usually 2 spaces, changing to 4.
          (set (make-local-variable 'sgml-basic-offset) 4)))

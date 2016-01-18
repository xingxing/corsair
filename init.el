(setq user-full-name "Wade Xing")
(setq user-mail-address "iamxingxing@gmail.com")

(delete-selection-mode t)

(ido-mode t)

(setq column-number-mode t)

(setq inhibit-startup-message t)

(display-time-mode t)

(fset 'yes-or-no-p 'y-or-n-p)

(show-paren-mode t)

(setq lazy-highlight-cleanup nil)

(load "server")
(if (not (server-running-p))
    (server-start))

(setq auto-save-default nil)
(setq make-backup-files nil)

(global-linum-mode t)

(global-set-key "\C-z" 'undo)

(setq-default indent-tabs-mode nil)
(add-hook 'makefile-mode '(lambda (setq-default indent-tabs-mode 1)))
(setq default-tab-width 8)

;; mepla source
;; http://stable.melpa.org/
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; dockerfile
(add-to-list 'load-path "~/.emacs.d/vendor/dockerfile-mode/")
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

;; whitespace show
(global-set-key "\C-cw" 'whitespace-mode)

;; markdown mode
(add-to-list 'load-path "~/.emacs.d/vendor/markdown-mode/")
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; smex
(add-to-list 'load-path "~/.emacs.d/vendor/smex/")
(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                  ; when Smex is auto-initialized on its first run.
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; undo-tree
(add-to-list 'load-path "~/.emacs.d/vendor/undo-tree/")
(require 'undo-tree)
(global-undo-tree-mode)

;; check word spell
(global-set-key (kbd "C-c s") 'flyspell-prog-mode)

;; FIXME egg
(add-to-list 'load-path "~/.emacs.d/vendor/dash.el")
(add-to-list 'load-path "~/.emacs.d/vendor/magit/lisp")
(require 'magit)

(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list
               "~/.emacs.d/vendor/magit/Documentation/"))

(add-to-list 'load-path "~/.emacs.d/vendor/git-commit-mode/")
(require 'git-commit)

;; highlight show FIXME TODO ...
(add-to-list 'load-path "~/.emacs.d/vendor/fic-mode/")
(require 'fic-mode)
(add-hook 'emacs-lisp-mode-hook 'fic-mode)
(add-hook 'makefile-mode 'fic-mode)
(add-hook 'shell-script-mode 'fic-mode)
(global-set-key (kbd "C-c f") 'fic-mode)

;; English
(add-to-list 'load-path "~/.emacs.d/vendor/predictive/")
(autoload 'predictive-mode "predictive" "predictive" t)
(set-default 'predictive-auto-add-to-dict t)
(setq predictive-main-dict 'rpg-dictionary
      predictive-auto-learn t
      predictive-add-to-dict-ask nil
      predictive-use-auto-learn-cache nil
            predictive-which-dict t)

;; Ag Search
(add-to-list 'load-path "~/.emacs.d/vendor/s.el/")
(add-to-list 'load-path "~/.emacs.d/vendor/ag.el/")
(require 'ag)

;; youdao
(load-file "~/.emacs.d/vendor/youdao-translate.el/youdao_translate.el")
(global-set-key (kbd "C-c t") 'youdao-translate)

;; [package] Cider for Clojure Programming

;; [package] Company for auto-complete
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'clojure-mode-hook #'company-mode)
(setq company-idle-delay nil) ; never start completions automatically
(global-set-key (kbd "C-M-i") #'company-complete) ; use M-TAB, a.k.a. C-M-i, as manual trigger

;; Color-Theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/color-theme/emacs-color-theme-solarized-master")
(load-theme 'solarized t)

;; electric-pair-mode
(add-hook 'clojure-mode-hook
          (lambda ()
            (electric-pair-mode 1)
            (define-key python-mode-map "{" 'electric-pair)
            (define-key python-mode-map "(" 'electric-pair)))

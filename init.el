;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq user-full-name "Wade Xing")
(setq user-mail-address "iamxingxing@gmail.com")

(delete-selection-mode t)

;; (ido-mode t)
;; (setq ido-everywhere t)
;; (setq ido-enable-flex-matching t)

(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; Change the keybinds to whatever you like :)
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)

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

(setq-default indent-tabs-mode nil)
(add-hook 'makefile-mode '(lambda (setq-default indent-tabs-mode 1)))
(setq default-tab-width 8)

;; package
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t))

;; dockerfile
(add-to-list 'load-path "~/.emacs.d/vendor/dockerfile-mode/")
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

;; whitespace show
(global-set-key "\C-cw" 'whitespace-mode)

;; 存盘前删除行末多余的空格/空行
(add-hook 'before-save-hook (lambda () (whitespace-cleanup)))

;; markdown mode
(add-to-list 'load-path "~/.emacs.d/vendor/markdown-mode/")
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

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
(setq ag-highlight-search t)

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
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'tangotango t)

;; electric-pair-mode
(add-hook 'clojure-mode-hook
          (lambda ()
            (electric-pair-mode 1)
            (define-key python-mode-map "{" 'electric-pair)
            (define-key python-mode-map "(" 'electric-pair)))

;; AVY
(add-to-list 'load-path "~/.emacs.d/vendor/avy/")
(require 'avy)
(global-set-key (kbd "C-c j") 'avy-goto-char)
(global-set-key (kbd "C-c '") 'avy-goto-char-2)
(global-set-key (kbd "M-g f") 'avy-goto-line)
(global-set-key (kbd "M-g w") 'avy-goto-word-1)
(global-set-key (kbd "M-g e") 'avy-goto-word-0)

;; Docker
(add-to-list 'load-path "~/.emacs.d/vendor/docker.el/")
(require 'docker)

;; Ansible
(add-hook 'yaml-mode-hook '(lambda () (ansible 1)))
(add-to-list 'load-path "~/.emacs.d/vendor/jinja2-mode/")
(require 'jinja2-mode)
(add-to-list 'auto-mode-alist '("\\.j2\\'" . jinja2-mode))

(defun insert-file-name (filename &optional args)
  "Insert name of file FILENAME into buffer after point.

  Prefixed with \\[universal-argument], expand the file name to
  its fully canocalized path.  See `expand-file-name'.

  Prefixed with \\[negative-argument], use relative path to file
  name from current directory, `default-directory'.  See
  `file-relative-name'.

  The default with no prefix is to insert the file name exactly as
  it appears in the minibuffer prompt."
  ;; Based on insert-file in Emacs -- ashawley 20080926
  (interactive `(,(ido-read-file-name "File Name: ")
                 ,current-prefix-arg))
  (cond ((eq '- args)
         (insert (expand-file-name filename)))
        ((not (null args))
         (insert filename))
        (t
         (insert (file-relative-name filename)))))

(global-set-key (kbd "C-c f") 'insert-file-name)

;;; rust
(add-to-list 'load-path "vendor/rust-mode/")
(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

;;; go-lang
(defun wade-go-hook ()
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ;tab == 4 whitespace
  (setq default-tab-width 4)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump))
(add-hook 'go-mode-hook 'wade-go-hook)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("4e4d9f6e1f5b50805478c5630be80cce40bee4e640077e1a6a7c78490765b03f" default)))
 '(package-selected-packages
   (quote
    (edts haskell-mode helm-swoop helm helm-ag rebecca-theme php-mode ace-window go-mode yaml-mode dash-at-point tangotango-theme dracula-theme string-inflection exec-path-from-shell graphql-mode json-mode flycheck flycheck-mix js2-mode web-mode jsx-mode elixir-mode alchemist company
          (company)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;; 自动补全
(add-hook 'after-init-hook 'global-company-mode)

;;;; YAML mode
;; (add-to-list 'load-path "~/.emacs.d/vendor/yaml-mode/")
;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

;;  For Phoenix
(add-to-list 'elixir-mode-hook (alchemist-mode +1))
(add-to-list 'auto-mode-alist '("\\.eex\\'" . web-mode))
(setq js-indent-level 2)
(flycheck-mix-setup)

;;;; For React
(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode))
(require 'flycheck)

;; (add-hook 'after-init-hook #'global-flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(json-jsonlist)))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

;; adjust indents for web-mode to 2 spaces
(defun my-web-mode-hook ()
  "Hooks for Web mode. Adjust indents"
  ;;; http://web-mode.org/
  (flycheck-mode +1)
  (web-mode-set-content-type "jsx")
  (message "now set to: %s" web-mode-content-type)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-attr-indent-offset 2))

(add-hook 'web-mode-hook  'my-web-mode-hook)

(require 'string-inflection)
(global-set-key (kbd "C-c i") 'string-inflection-cycle)
(global-set-key (kbd "C-c C") 'string-inflection-camelcase)        ;; Force to CamelCase
(global-set-key (kbd "C-c L") 'string-inflection-lower-camelcase)  ;; Force to lowerCamelCase
(global-set-key (kbd "C-c J") 'string-inflection-java-style-cycle) ;; Cycle through Java styles

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

;; ace-window
(global-set-key (kbd "M-p") 'ace-window)

(add-hook 'window-setup-hook 'on-after-init)

(provide 'init)
;;; init.el ends here

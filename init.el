;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

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

(setq-default indent-tabs-mode nil)
(add-hook 'makefile-mode '(lambda (setq-default indent-tabs-mode 1)))
(setq default-tab-width 8)

;; package
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t))

;; whitespace show
(global-set-key "\C-cw" 'whitespace-mode)

;; 存盘前删除行末多余的空格/空行
(add-hook 'before-save-hook (lambda () (whitespace-cleanup)))

(provide 'init)
;;; init.el ends here

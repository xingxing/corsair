(setq user-full-name "Wade Xing")
(setq user-mail-address "iamxingxing@gmail.com")

(delete-selection-mode t)

(ido-mode t)

(setq column-number-mode t)

(setq inhibit-startup-message t)

(display-time-mode t)

(fset 'yes-or-no-p 'y-or-n-p)

(show-paren-mode t)

(server-start)

(setq auto-save-default nil)
(setq make-backup-files nil)

;; dockerfile
(add-to-list 'load-path "~/.emacs.d/vendor/dockerfile-mode/")
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

;; whitespace show

(add-to-list 'load-path "~/.emacs.d/vendor/")
(require 'dockerfile-mode)

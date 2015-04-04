;; Set Identity Info
(setq user-full-name "Adrian Brandemuehl")
(setq user-mail-address "abrandemuehl@gmail.com")


;; Packages to maintain

; Remove Startup Message / Splash Page
(setq inhibit-startup-message t
      initial-scratch-message nil)

(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

(setenv "PATH" (concat "/usr/local/bin:/usr/bin:/bin" (getenv "PATH")))

(setq pcomplete-ignore-case t)

(load "~/.emacs.d/packages.el")


(setq linum-format "%4d ")

(evil-mode t)

(defvar --backup-directory (concat user-emacs-directory "backups"))
(if (not (file-exists-p --backup-directory))
  (make-directory --backup-directory t))

(setq backup-directory-alist
            `((".*" . ,--backup-directory)))
(setq auto-save-file-name-transforms
            `((".*" ,--backup-directory t)))



;; Should allow me to use evil mode in minibuffers
(setq evil-motion-state-modes (append evil-emacs-state-modes evil-motion-state-modes))
(setq evil-emacs-state-modes nil)


(load "~/.emacs.d/looks.el")

;; Place all backup files in ~/.backups
(setq backup-directory-alist `(("." . "~/.backups")))

;; Highlight current line
(global-hl-line-mode 1)
(set-face-background 'hl-line "#333")

;; Enables auto complete on all files
(global-auto-complete-mode t)

(global-evil-surround-mode 1)


;; Open maximised
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
	("f0b0710b7e1260ead8f7808b3ee13c3bb38d45564e369cbe15fc6d312f0cd7a0" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(initial-frame-alist (quote ((fullscreen . maximized)))))
 ;; start maximized

;; Turn off usual bars
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
;; Correct colors for terminal
;;(color-theme-approximate-on)

;; Add web mode to autocomplete

;; scroll one line at a time
(setq scroll-margin 5
      scroll-conservatively 9999
      scroll-step 1)
;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

;; Share system clipboard
(setq x-select-enable-clipboard t)

;; Make it so you can type one letter when prompted
(defalias 'yes-or-no-p 'y-or-n-p)
;; Set file type indent levels
(setq indent-tabs-mode t)
(setq python-indent-level 4)

;; Web mode config
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ts?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
;; Adds web mode to autocomplete
(setq web-mode-ac-sources-alist
      '(("css" . (ac-source-css-property))
	("html" . (ac-source-words-in-buffer ac-source-abbrev))))
(defun web-mode-hook () ;; Function to set indentation on web files
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-current-element-highlight t)
)
(add-hook 'web-mode-hook  'web-mode-hook)
(setq web-mode-extra-auto-pairs
      '(("erb"  . (("open" "close")))
	("php"  . (("open" "close")
		   ("open" "close")))
	       ))



;; Set tab to be 4 spaces
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; Line Numbers on
(global-linum-mode t)

;; Add tabs mode
;(global-evil-tabs-mode t)

;; Evil mode settings
(global-evil-leader-mode)
(evil-leader/set-leader ",")

(load "~/.emacs.d/keybindings.el")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

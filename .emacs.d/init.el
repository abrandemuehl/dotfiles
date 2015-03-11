;; Set Identity Info
(setq user-full-name "Adrian Brandemuehl")
(setq user-mail-address "abrandemuehl@gmail.com")


;; Packages to maintain

(defvar abrandemuehl/packages '(ac-slime
                                 auto-complete
                                 autopair
                                 clojure-mode
                                 color-theme-approximate
                                 evil
                                 evil-leader
                                 evil-tabs
                                 feature-mode
                                 flycheck
                                 gist
                                 go-mode
                                 jedi
                                 js3-mode
                                 magit
                                 marmalade
                                 nodejs-repl
                                 paredit
                                 php-mode
                                 python-mode
                                 restclient
                                 rvm
                                 smex
                                 solarized-theme
				 tabbar
				 tss
                                 rainbow-mode
                                 ruby-mode
                                 web-mode
                                 yaml-mode)
  "Default packages")

; Remove Startup Message / Splash Page
(setq inhibit-startup-message t
      initial-scratch-message nil)

(setenv "PATH" (concat "/usr/local/bin:/usr/bin:/bin" (getenv "PATH")))
(require 'cl)

(setq pcomplete-ignore-case t)

(load "package")
(package-initialize)
;;
;; Add some common repo hosts
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)


;;; from purcell/emacs.d
(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(package-initialize)

(require-package 'evil)
(setq evil-search-module 'evil-search
      evil-want-C-u-scroll t
      evil-want-C-w-in-emacs-state t)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)   

(defun abrandemuehl/packages-installed-p ()
  (loop for pkg in abrandemuehl/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (abrandemuehl/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg abrandemuehl/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(setq linum-format "%4d\u2502 ")

(evil-mode t)
;; Should allow me to use evil mode in minibuffers
(setq evil-motion-state-modes (append evil-emacs-state-modes evil-motion-state-modes))
(setq evil-emacs-state-modes nil)

;; Add themes folder 
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; Set default theme
;; (setq molokai-theme-kit t)
(load-theme 'monokai t)

;; Highlight current line
(global-hl-line-mode 1)
(set-face-background 'hl-line "#333")

;; Enables auto complete on all files
(global-auto-complete-mode t)

;; Open maximised
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized))))) ;; start maximized

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


;; Line Numbers on
(global-linum-mode t)

;; Add tabs mode
(global-evil-tabs-mode t)

;; Evil mode settings
(global-evil-leader-mode)
(evil-leader/set-leader ",")


;; Evil mode key bindings

(define-key evil-insert-state-map "\C-c" [escape])

;; Moving around windows
(windmove-default-keybindings)
(define-key evil-normal-state-map "H" 'windmove-left)
(define-key evil-normal-state-map "J" 'windmove-down)
(define-key evil-normal-state-map "K" 'windmove-up)
(define-key evil-normal-state-map "L" 'windmove-right)
(global-set-key (kbd "C-S-h") 'windmove-left)
(global-set-key (kbd "C-S-j") 'windmove-down)
(global-set-key (kbd "C-S-k") 'windmove-up)
(global-set-key (kbd "C-S-l") 'windmove-right)


;; Browse by visual lines when wrapped
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)


;; Redefine Ctrl-Space to M-x
(define-key evil-normal-state-map (kbd "C-SPC") 'execute-extended-command)
(define-key evil-insert-state-map (kbd "C-SPC") 'execute-extended-command)

;; esc quits
(defun minibuffer-keyboard-quit ()
    "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
    (interactive)
    (if (and delete-selection-mode transient-mark-mode mark-active)
	(setq deactivate-mark  t)
      (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
      (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

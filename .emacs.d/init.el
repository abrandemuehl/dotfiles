(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq font-lock-maximum-decoration t)
(global-linum-mode 1)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(electric-pair-mode 1)
(setq
  backup-by-copying t      ; don't clobber symlinks
  backup-directory-alist
  '(("." . "~/.saves"))    ; don't litter directories
  delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)
(setq backup-directory-alist
       `((".*" . "~/.saves")))
(setq auto-save-file-name-transforms
      `((".*" "~/.saves")))




(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(unless package-archive-contents
  (package-refresh-contents))


(defun require-package (package)
  (setq-default highlight-tabs t)
  "Install given package"
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))


(defvar clojure-packages
  '())

(defvar web-packages
  '(inf-ruby web-mode flymake-ruby flymake-css flymake-csslint flymake-json
	     flymake-jshint flymake-sass flymake-less rake ruby-end))
(mapc 'require-package web-packages)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))



(defvar themes
  '(majapahit-theme gruvbox-theme color-theme-sanityinc-tomorrow))


(mapc 'require-package clojure-packages)

(mapc 'require-package themes)
(load-theme 'gruvbox t)


(defvar emacs-packages
  '(flycheck windmove projectile grizzl buffer-move 
    powerline neotree indent-guide smartparens indent-guide 
    flycheck-ycmd powerline autopair rainbow-delimiters xclip))
(mapc 'require-package emacs-packages)
(projectile-global-mode)
(setq projectile-indexing-method 'native)
(setq projectile-completion-system 'grizzl)
(setq projectile-enable-caching t)
(powerline-default-theme)
(smartparens-mode 1)
(indent-guide-global-mode 1)
(rainbow-delimiters-mode 1)
(global-flycheck-mode 1)
(xclip-mode 1)

(font-lock-mode t)

; Set Scrolling
(setq scroll-step            1
      scroll-conservatively  10000)

; Disable menu bar
(menu-bar-mode -1)

(defvar completion-packages
  '(auto-complete slime ac-clang ac-html-bootstrap ac-slime ac-python ac-inf-ruby)) 
(mapc 'require-package completion-packages)
(ac-config-default)

(defvar evil-packages
  '(evil evil-matchit evil-surround evil-numbers evil-leader evil-mark-replace 
    evil-args evil-quickscope evil-god-state evil-visualstar 
    evil-nerd-commenter evil-textobj-column evil-tabs
    evil-search-highlight-persist))

(mapc 'require-package evil-packages)
; Turn evil stuff on
(global-evil-leader-mode) ; before evil mode turned on to be in initial buffers
(evil-mode 1)
(global-evil-surround-mode 1)
(global-evil-quickscope-mode 1)
(global-evil-visualstar-mode)
(global-evil-search-highlight-persist t)
(global-evil-matchit-mode 1)

; Use space as god mode
; (evil-define-key 'normal global-map " " 'evil-execute-in-god-state)
; (evil-define-key 'god global-map [escape] 'evil-god-state-bail)
(evil-define-key 'normal global-map "\C-H" 'buf-move-left)
(evil-define-key 'normal global-map "\C-J" 'buf-move-down)
(evil-define-key 'normal global-map "\C-K" 'buf-move-up)
(evil-define-key 'normal global-map "\C-L" 'buf-move-right)


; evil-leader bindings
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key "o" 'projectile-find-file)
(evil-leader/set-key "h" 'windmove-left)
(evil-leader/set-key "j" 'windmove-down)
(evil-leader/set-key "k" 'windmove-up)
(evil-leader/set-key "l" 'windmove-right)
(evil-leader/set-key "cc" 'evilnc-comment-or-uncomment-lines)

; evil-nerd-commenter use default keybindings
(evilnc-default-hotkeys)



(setq c-default-style "gnu"
          c-basic-offset 4)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
	("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "38ba6a938d67a452aeb1dada9d7cdeca4d9f18114e9fc8ed2b972573138d4664" "341a1f149c8ab55893e5a065e96235e43ee9f82423f4c018bf31a430e1dc1b0f" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

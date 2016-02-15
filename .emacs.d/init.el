
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-refresh-contents)


(defun require-package (package)
  (setq-default highlight-tabs t)
  "Install given package"
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))


(defvar clojure-packages
  '())

(defvar evil-packages
  '(evil evil-matchit evil-surround evil-numbers evil-leader evil-mark-replace 
    evil-args evil-quickscope evil-god-state evil-visualstar 
    evil-nerd-commenter evil-textobj-column evil-tabs 
    evil-search-highlight-persist))

(defvar emacs-packages
  '(rainbow-delimiters flycheck windmove projectile grizzl))

(defvar completion-packages
  '(ycmd company company-go company-shell company-tern company-ycmd company-jedi 
    company-ghc company-arduino company-web))

; (require-package 'evil-surround)
(mapcar 'require-package clojure-packages)

(mapcar 'require-package emacs-packages)
(add-hook 'after-init-hook #'global-ycmd-mode)
(setq projectile-indexing-method 'alien)
(setq projectile-completion-system 'grizzl)

(mapcar 'require-package completion-packages)
(add-hook 'after-init-hook 'global-company-mode)

(mapcar 'require-package evil-packages)
; Turn evil stuff on
(evil-mode 1)
(global-evil-leader-mode)
(global-evil-surround-mode 1)
(global-evil-quickscope-mode 1)
(global-evil-visualstar-mode)

; Use space as god mode
; (evil-define-key 'normal global-map " " 'evil-execute-in-god-state)
; (evil-define-key 'god global-map [escape] 'evil-god-state-bail)


; evil-leader bindings
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key "o" 'projectile-find-file)
(evil-leader/set-key "h" 'windmove-left)
(evil-leader/set-key "j" 'windmove-down)
(evil-leader/set-key "k" 'windmove-up)
(evil-leader/set-key "l" 'windmove-right)

; evil-nerd-commenter use default keybindings
(evilnc-default-hotkeys)

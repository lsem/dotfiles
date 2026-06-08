(delete-selection-mode 1)
(electric-pair-mode 1)
(global-auto-revert-mode t)

;; https://www.reddit.com/r/emacs/comments/fwmqc8/how_to_stop_emacs_from_half_scrolling_from_bottom/
(setq scroll-margin 3
      scroll-conservatively 101
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01
      scroll-preserve-screen-position t
      auto-window-vscroll nil)

;; https://stackoverflow.com/questions/151945/how-do-i-control-how-emacs-makes-backup-files
(setq backup-directory-alist `(("~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;; https://amitp.blogspot.com/2007/03/emacs-move-autosave-and-backup-files.html
(setq auto-save-directory "~/.saves")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(amx-mode t)
 '(custom-safe-themes
   '("f1b2de4bc88d1120782b0417fe97f97cc9ac7c5798282087d4d1d9290e3193bb"
     "2f9cff368c07d280a7a766e9f04a0053a17bb74f775504dc49421d1fda2a0797"
     "01a9797244146bbae39b18ef37e6f2ca5bebded90d9fe3a2f342a9e863aaa4fd"
     default))
 '(ispell-dictionary nil)
 '(package-selected-packages nil))

(defalias 'yes-or-no-p 'y-or-n-p)

;; force to use horizontal split (https://www.emacswiki.org/emacs/HorizontalSplitting)
 (setq split-width-threshold 9999)

(add-to-list 'default-frame-alist '(font . "Iosevka-12" ))
(set-face-attribute 'default t :font "Iosevka-12")


;; make comments italic
;;(use-package font-lock
;;  :defer t
;;  :custom-face
;;  (font-lock-comment-face ((t (:inherit font-lock-comment-face :italic t))))
;;  (font-lock-doc-face ((t (:inherit font-lock-doc-face :italic t))))
;;  (font-lock-string-face ((t (:inherit font-lock-string-face :italic t)))))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(load-theme 'apropospriate-dark t)


;;(require 'projectile)
;;(define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-switch-project-action 'projectile-dired)


;; we need this wrapper to match Projectile's API


(menu-bar-mode -1)
(tool-bar-mode -1)


(load "~/.emacs.d/clang-format.el")
(global-set-key (kbd "M-I") 'clang-format-buffer)

(setq-default line-spacing 8)

(require 'use-package)
;; (require 'vertico)
;; (use-package vertico
;;   :ensure t
;;   :init
;;   (vertico-mode))

(use-package move-text
  :ensure t
  :config
  (move-text-default-bindings))


;; https://stackoverflow.com/questions/3509919/emacs-c-opening-corresponding-header-file
(add-hook 'c-mode-common-hook
  (lambda() 
    (local-set-key  (kbd "C-c o") 'ff-find-other-file)))


;(add-hook 'c++-mode-hook
;	  (lambda ()
;	    (add-hook 'after-save-hook 'clang-format-buffer nil 'make-it-local)))

(global-display-line-numbers-mode) 
(setq display-line-numbers-type 'relative)


(setq inhibit-startup-screen t)

;; For IDO
;; (setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
;; (setq ido-show-dot-for-dired t)
;; (ido-mode 1)

(ivy-mode)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(setq ivy-re-builders-alist
      '((read-file-name-internal . ivy--regex-fuzzy)
        (t . ivy--regex-plus)))


(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-keyword-face ((t (:slant italic))))
 '(font-lock-type-face ((t (:slant italic)))))

;; Use fuzzy matching
(setq completion-styles '(flex basic partial-completion emacs22))

(setq projectile-generic-command "fdfind . -0 --type f --color=never --strip-cwd-prefix --ignore-file .projectile")


(use-package corfu
  ;; Optional customizations
:custom
  ;; (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
(corfu-auto t)                 ;; Enable auto completion
  ;; (corfu-separator ?\s)          ;; Orderless field separator
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect 'prompt)      ;; Preselect the prompt
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  ;; (corfu-scroll-margin 5)        ;; Use scroll margin

  ;; Enable Corfu only for certain modes.
  ;; :hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))

  ;; Recommended: Enable Corfu globally.
  ;; This is recommended since Dabbrev can be used globally (M-/).
  ;; See also `global-corfu-modes'.
  :init
  (global-corfu-mode))

(defun my-c++-mode-hook ()
  (setq c-basic-offset 4))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)



(defun hilite-todos ()
  (highlight-lines-matching-regexp "\\<\\(FIXME\\|WRITEME\\|WRITEME!\\|TODO\\|BUG\\):?" 
       'hi-green-b)
)

(add-hook 'c++-mode-hook 'hilite-todos)




(require 'ansi-color)
(defun endless/colorize-compilation ()
  "Colorize from `compilation-filter-start' to `point'."
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region
     compilation-filter-start (point))))

(add-hook 'compilation-filter-hook
          #'endless/colorize-compilation)



(setq visible-bell 1)

(move-text-default-bindings)

(global-set-key (kbd "DEL") 'delete-backward-char) ; Backspace key
(global-set-key (kbd "<delete>") 'delete-forward-char) ; Delete key

(scroll-bar-mode -1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-delete-word (arg)
  "Delete characters forward until encountering the end of a word.
With argument, do this that many times.
This command does not push text to `kill-ring'."
  (interactive "p")
  (delete-region
   (point)
   (progn
     (forward-word arg)
     (point))))

(defun my-backward-delete-word (arg)
  "Delete characters backward until encountering the beginning of a word.
With argument, do this that many times.
This command does not push text to `kill-ring'."
  (interactive "p")
  (my-delete-word (- arg)))

(defun my-delete-line ()
  "Delete text from current position to end of line char.
This command does not push text to `kill-ring'."
  (interactive)
  (delete-region
   (point)
   (progn (end-of-line 1) (point)))
  (delete-char 1))

(defun my-delete-line-backward ()
  "Delete text between the beginning of the line to the cursor position.
This command does not push text to `kill-ring'."
  (interactive)
  (let (p1 p2)
    (setq p1 (point))
    (beginning-of-line 1)
    (setq p2 (point))
    (delete-region p1 p2)))

; bind them to emacs's default shortcut keys:
(global-set-key (kbd "C-S-k") 'my-delete-line-backward) ; Ctrl+Shift+k
(global-set-key (kbd "C-k") 'my-delete-line)
(global-set-key (kbd "M-d") 'my-delete-word)
(global-set-key (kbd "<M-backspace>") 'my-backward-delete-word)


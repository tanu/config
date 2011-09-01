;; .emacs

(setenv "PAGER" "cat")
(setq load-path (cons "~/elisp/autoinstall" load-path))
(setq load-path (cons "~/elisp" load-path))

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
;(setq require-final-newline 'query)

(display-time-mode t)
(column-number-mode t)

;;tranpmode
(when (locate-library "tramp")
  (require 'tramp))
;(setq tramp-default-method "sshx")

;;; XXU
(set-default-coding-systems 'utf-8)

(require 'auto-install)
;(setq auto-install-directory "~/elisp/autoinstall/")
;(auto-install-update-emacswiki-package-name t)
;(auto-install-compatibility-setup)             ; 互換性確保

(when (locate-library "anything")
  (require 'anything-startup))
;(require 'irc)


(if window-system (progn
  (require 'font-lock)
  (global-font-lock-mode t)
))

;(require 'php-mode-improved)

(add-hook 'php-mode-hook
	  (lambda ()
	    (setq tab-width 4)
	    (setq c-basic-offset 4)
	    (define-key php-mode-map "\C-c{" 'backward-sexp)
	    (define-key php-mode-map "\C-c}" 'forward-sexp)
	     (define-key php-mode-map "\C-cg" 'goto-line)))

(defun my-auto-revert-tail-mode-on ()
  (interactive)
  (when (string-match "^/home/tanu/direct[^/].*/log/" default-directory)
          (auto-revert-tail-mode t)))

(add-hook 'find-file-hook 'my-auto-revert-tail-mode-on)

(add-hook 'after-revert-hook
          (lambda ()
            (when auto-revert-tail-mode
              (end-of-buffer))))

;; recursiveに呼べなくなるので
(setq max-listp-eval-depth 1000)
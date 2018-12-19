;;----------------------------------------------------------------------------
;; Adjust garbage collection thresholds during startup, and thereafter
;;----------------------------------------------------------------------------
(setq gc-cons-threshold (* 100 1024 1024))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-utils)
(require 'init-gui)

(package-initialize)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))
;;
(setq backup-directory-alist '(("" . "~/.emacs.d/emacs-backup")))
(setq auto-save-default nil)
;;
(ivy-mode 1)
(setq ivy-height 30)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(counsel-mode t)
 '(custom-safe-themes
   (quote
    ("b54826e5d9978d59f9e0a169bbd4739dd927eead3ef65f56786621b53c031a7c" "fe666e5ac37c2dfcf80074e88b9252c71a22b6f5d2f566df9a7aa4f9bea55ef8" "356e5cbe0874b444263f3e1f9fffd4ae4c82c1b07fe085ba26e2a6d332db34dd" default)))
 '(package-selected-packages
   (quote
    (yaml-mode graphql-mode tabbar treemacs-projectile treemacs-evil treemacs magit js2-refactor evil-textobj-anyblock doom-modeline company-tern fold-this dired-ranger nyan-mode markdown-mode company editorconfig expand-region evil-surround ace-jump-mode rjsx-mode web-mode yasnippet evil golden-ratio beacon doom-themes tide counsel smex ivy ##))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(golden-ratio-mode 1)
;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled
;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
(load-theme 'doom-tomorrow-night t)
;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)
;; Enable custom neotree theme (all-the-icons must be installed!)

;;(doom-themes-neotree-config)

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)
;; 타이틀바 색깔 맞추는 스크립트
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))



;;------------------------------------CUSTOM Set Key
;; 계속 한글 입력기로 바뀌던게 이녀석이었는데... shift-space,
(global-set-key (kbd "C-0") 'abort-recursive-edit)               ;; Execute
(global-set-key (kbd "C-e") 'counsel-M-x)               ;; Execute
(global-set-key (kbd "M-x") 'counsel-M-x)               ;; Execute
(global-set-key (kbd "C-n") 'find-file)              ;; new buffer
(global-set-key (kbd "C-s") 'save-buffer)            ;; save
(global-set-key (kbd "<C-S-tab>") 'quit-window)            ;; return의 의미
(global-set-key (kbd "s-w") 'kill-this-buffer)       ;; close의 의미
(global-set-key (kbd "C-f") 'swiper)                 ;; swiper
(global-set-key (kbd "C-b") 'counsel-ibuffer)       ;; switch to buffer
(global-set-key (kbd "C-`") 'other-window)       ;; Switch window
(global-set-key (kbd "s-b") 'ibuffer)            ;; list buffer
(global-set-key (kbd "s-r") 'shell-command)          ;; run command
(global-set-key (kbd "M-r") 'query-replace)          ;; replace
(global-set-key (kbd "<C-tab>") 'previous-buffer)        ;; C-r and C-t 
(global-set-key (kbd "s-[") 'er/contract-region)        ;; expand region plugin
(global-set-key (kbd "s-]") 'er/expand-region)        ;; expand region plugin
(global-set-key (kbd "s-/") 'comment-line)        ;; comment
(global-set-key (kbd "C-x o") 'open-file-at-cursor)        ;; open file under the cursor
(global-set-key (kbd "C-c l") 'goto-last-change)
(global-set-key (kbd "C-c p") 'yas/expand)
(global-set-key (kbd "C-SPC") 'company-complete)
(global-set-key (kbd "C-c r") 'tide-references)
(global-set-key (kbd "C-c d") 'tide-jump-to-definition)
(global-set-key (kbd "C-c \`")  'window-swap-states)
(global-set-key (kbd "C-\\") (lambda ()
                                (interactive)
                                (other-window -1)))
(define-key dired-mode-map (kbd "y") 'dired-ranger-copy)
(define-key dired-mode-map (kbd "p") 'dired-ranger-paste)
;; 남는 키들, C-t (transpositng character), 
;; Global한 C-space로 바꿔야할듯 ;; 대신 한글 입력기가 매우 잘되있어서 이걸로 그냥 쓰는게 나을지도 모르겠다
;;-----------------------------------KBD end
;; 여기까지는 스크롤 속도포함해서 매우 안정적
;; 이제 vim 을 깔 차례
(evil-mode 1)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-word-mode)
(global-evil-surround-mode 1)
;;--------------------------------------------
;; markdown mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdx\\'" . markdown-mode))
;; tab size
(setq-default indent-tabs-mode nil)
(setq tab-width 2)
;; Neo tree
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(setq neo-smart-open t)

;;Editor config option
(editorconfig-mode 1)
;;Company mode
(add-hook 'after-init-hook 'global-company-mode)
;;Magit settings
(global-set-key (kbd "C-x g") 'magit-status)
;; Recent mode
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
;;expand-region
;; transparents
(defun toggle-transparency ()
  (interactive)
  (let ((alpha (frame-parameter nil 'alpha)))
    (set-frame-parameter
     nil 'alpha
     (if (eql (cond ((numberp alpha) alpha)
                    ((numberp (cdr alpha)) (cdr alpha))
                    ;; Also handle undocumented (<active> <inactive>) form.
                    ((numberp (cadr alpha)) (cadr alpha)))
              100)
         '(85 . 50) '(100 . 100)))))
(defun transparency (value)
   "Sets the transparency of the frame window. 0=transparent/100=opaque"
   (interactive "nTransparency Value 0 - 100 opaque:")
   (set-frame-parameter (selected-frame) 'alpha value))

;;JSX mode, rjsx-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
;; Global macro
(defun semicolon-macro ()
  (interactive)
  (end-of-line)
  (insert ";"))
(global-set-key (kbd "s-;") 'semicolon-macro)


;; open file path under the cursor
(defun open-file-at-cursor ()
  "Open the file path under cursor.
If there is text selection, uses the text selection for path.
If the path starts with "http://", open the URL in browser.
Input path can be {relative, full path, URL}.
Path may have a trailing ":‹n›" that indicates line number. If so, jump to that line number.
If path does not have a file extension, automatically try with ".el" for elisp files.
This command is similar to `find-file-at-point' but without prompting for confirmation.
URL `http://ergoemacs.org/emacs/emacs_open_file_path_fast.html'
Version 2018-02-21"
  (interactive)
  (let* (($inputStr (if (use-region-p)
                        (buffer-substring-no-properties (region-beginning) (region-end))
                      (let ($p0 $p1 $p2
                                ;; chars that are likely to be delimiters of file path or url, e.g. space, tabs, brakets. The colon is a problem. cuz it's in url, but not in file name. Don't want to use just space as delimiter because path or url are often in brackets or quotes as in markdown or html
                                ($pathStops "^  \t\n\"`'''""|()[]{}「」<>〔〕〈〉《》【】〖〗«»‹›❮❯❬❭·。\\"))
                        (setq $p0 (point))
                        (skip-chars-backward $pathStops)
                        (setq $p1 (point))
                        (goto-char $p0)
                        (skip-chars-forward $pathStops)
                        (setq $p2 (point))
                        (goto-char $p0)
                        (buffer-substring-no-properties $p1 $p2))))
         ($path
          (replace-regexp-in-string
           "^file:///" "/"
           (replace-regexp-in-string
            ":\\'" "" $inputStr))))
    (if (string-match-p "\\`https?://" $path)
        (if (fboundp 'xahsite-url-to-filepath)
            (let (($x (xahsite-url-to-filepath $path)))
              (if (string-match "^http" $x )
                  (browse-url $x)
                (find-file $x)))
          (progn (browse-url $path)))
      (if ; not starting "http://"
          (string-match "^\\`\\(.+?\\):\\([0-9]+\\)\\'" $path)
          (let (
                ($fpath (match-string 1 $path))
                ($line-num (string-to-number (match-string 2 $path))))
            (if (file-exists-p $fpath)
                (progn
                  (find-file $fpath)
                  (goto-char 1)
                  (forward-line (1- $line-num)))
              (when (y-or-n-p (format "file no exist: 「%s」. Create?" $fpath))
                (find-file $fpath))))
        (if (file-exists-p $path)
            (progn ; open f.ts instead of f.js
              (let (($ext (file-name-extension $path))
                    ($fnamecore (file-name-sans-extension $path)))
                (if (and (string-equal $ext "js")
                         (file-exists-p (concat $fnamecore ".ts")))
                    (find-file (concat $fnamecore ".ts"))
                  (find-file $path))))
          (if (file-exists-p (concat $path ".el"))
              (find-file (concat $path ".el"))
            (when (y-or-n-p (format "file no exist: 「%s」. Create?" $path))
              (find-file $path ))))))))

;; yasnimet
(add-hook 'prog-mode-hook #'yas-minor-mode)

(defun enable-mc-and-mark-next ()
  (interactive)
  (evil-mc-mode 1)
  (evil-mc-make-and-goto-next-match))
(defun quit-mc ()
  (interactive)
  (evil-mc-undo-all-cursors)
  (evil-mc-mode -1))
(global-set-key (kbd "C-c m") 'enable-mc-and-mark-next)
(global-set-key (kbd "C-c g") 'quit-mc)
(global-evil-mc-mode -1)

(defun open-org-todo ()
  (interactive)
  (find-file "~/dev/docs/orgs/todo.org"))
(global-set-key (kbd "C-x `") 'open-org-todo)
;; (setq fold-this-persistent-folds t)
;; 커서 찾는 비콘
(beacon-mode 1)


(defun fold-this-regexp()
  (interactive)
  (let ( (right (save-excursion ; using save-excursion because
                                      ; we don't want to move the
                                      ; point.
                        (re-search-forward "fold\\$" nil t))) ; bound nil
                                                        ; no-error t
         (left (save-excursion (re-search-backward "fold\\^" nil t))))
  (when (and right left)
    ;; this is actually a way to activate a mark
    ;; you have to move your point to one side
    (push-mark right)
    (goto-char left)
    ;;(activate-mark)))
    (fold-this left right))))
(global-set-key (kbd "C-c f") 'fold-this-regexp)


;; makes emacs a bit quiter
(setq auto-revert-verbose nil)
;; version of ivy-yank-word to yank from start of word

(defun bjm/ivy-yank-whole-word ()
  "Pull next word from buffer into search string."
  (interactive)
  (let (amend)
    (with-ivy-window
      ;;move to last word boundary
      (re-search-backward "\\b")
      (let ((pt (point))
            (le (line-end-position)))
        (forward-word 1)
        (if (> (point) le)
            (goto-char pt)
          (setq amend (buffer-substring-no-properties pt (point))))))
    (when amend
      (insert (replace-regexp-in-string "  +" " " amend)))))
;; bind it to M-j

(define-key ivy-minibuffer-map (kbd "C-f") 'bjm/ivy-yank-whole-word)

;; Fira Code
(when (window-system)
  (set-frame-font "Fira Code"))

;; (let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
;;                (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
;;                (36 . ".\\(?:>\\)")
;;                (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
;;                (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
;;                (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
;;                (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
;;                (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
;;                (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
;;                (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
;;                (48 . ".\\(?:x[a-zA-Z]\\)")
;;                (58 . ".\\(?:::\\|[:=]\\)")
;;                (59 . ".\\(?:;;\\|;\\)")
;;                (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
;;                (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
;;                (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
;;                (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
;;                (91 . ".\\(?:]\\)")
;;                (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
;;                (94 . ".\\(?:=\\)")
;;                (119 . ".\\(?:ww\\)")
;;                (123 . ".\\(?:-\\)")
;;                (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
;;                (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
;;                )
;;              ))
;;   (dolist (char-regexp alist)
;;     (set-char-table-range composition-function-table (car char-regexp)
;;                           `([,(cdr char-regexp) 0 font-shape-gstring]))))



;;------------------------------------------------------------
;; Tide 셋업
;;------------------------------------------------------------
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))
;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)
;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))

;; enable typescript-tslint checker
(require 'flycheck)
(flycheck-add-mode 'typescript-tslint 'web-mode)

;; Auto reload when buffer changed
(global-auto-revert-mode t)
;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; tern mode
;; (add-to-list 'company-backends 'company-tern)
;; (add-hook 'rjsx-mode-hook (lambda ()
;;                           (tern-mode)
;;                           (company-mode)))
;; Disable completion keybindings, as we use xref-js2 instead

;; js utilties@~/.emacs.d/lisp/js-utils.el
(require 'js-utils)

(require 'doom-modeline)
(doom-modeline-init)

(define-key evil-inner-text-objects-map "b" 'evil-textobj-anyblock-inner-block)
(define-key evil-outer-text-objects-map "b" 'evil-textobj-anyblock-a-block)

(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive) (revert-buffer t t))
(global-set-key (kbd "C-s-r")  'revert-buffer-no-confirm)


;; RJSX configures
(add-hook 'rjsx-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil) ;;Use space instead of tab
            (setq js-indent-level 2) ;;space width is 2 (default is 4)
            (setq js2-strict-missing-semi-warning nil))) ;;disable the semicolon warning

;; web-mode setting
(setq web-mode-enable-auto-quoting nil)


;; (setq web-mode-enable-current-element-highlight t)
;; (setq web-mode-enable-current-column-highlight t)


(require 'web-mode)
(define-key web-mode-map (kbd "C-c C-a") 'web-mode-attribute-select)
(define-key web-mode-map (kbd "C-c C-c") 'web-mode-element-content-select)
(define-key web-mode-map (kbd "C-c C-t") 'web-mode-tag-select)
(define-key web-mode-map (kbd "C-c C-e") 'web-mode-element-select)
(define-key web-mode-map (kbd "C-c C-w") 'web-mode-tag-end)


;; TABbar mode configure
(tabbar-mode 1)
(define-key global-map (kbd "s-{") 'tabbar-backward-tab)
(define-key global-map (kbd "s-}") 'tabbar-forward-tab)
(define-key global-map (kbd "C-s-{") 'tabbar-backward-group)
(define-key global-map (kbd "C-s-}") 'tabbar-forward-group)

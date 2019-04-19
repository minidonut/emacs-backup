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
(global-hl-line-mode 1)
(global-display-line-numbers-mode 1)

;; This lets me say where my temp dir is.
(setq temporary-file-directory "~/.emacs.d/tmp/")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(counsel-mode t)
 '(custom-safe-themes
   (quote
    ("7846b7ea129e7fc626aa5d1787b0d1168668ea38b796177f4107496ac5c7e51d" "50a1962fe2e32885c3f7b3a25e6ded59dbb6a3ea677782e84593c78f38cd5237" "2c345b7952807a666dcf6d8523266ee10e56bcc44053a53566233d0fe41d29d0" "0acb13488bdb48c106ca4faf3dab289d605be158c1556c49872ff94f4e1d47dd" "0096e8605736587219e09abc09295291ba9d0b94c465fcb9fa052e79318f1405" "98632fdeb0464d0e6b944ba351f909a7b09d721931ed75b1291d3a7bd8231420" "178b79ad5235063129474ed114c3bc15238be2576192d45bf7276f33421c87a6" "ab3de490daf360c55f9448229b641fe4fe5581cdad48de741a466656213f41fb" "9da44f1fdba9fd170c2a372f3048d89b581ac4aadfe14fd416934cc2a979d3d6" "184d7705291f8c0689fdeacbbecbd03ed8bfaf591f33bd471ca0764138b1db81" "1567bb8eba71854b24649e93a5d3591c793d3f0d8b58abf86be3b0fb1fb30128" "8aca557e9a17174d8f847fb02870cb2bb67f3b6e808e46c0e54a44e3e18e1020" "becc1fa64b79e5019cbd661efe74985d6b435e88d3fda72c5faf5b2992b742ee" "69e75ffca6acc27b0d4db9fabe224988b4ad219ea1c06192cf0d132d014383b8" "7e78a1030293619094ea6ae80a7579a562068087080e01c2b8b503b27900165c" "b35a14c7d94c1f411890d45edfb9dc1bd61c5becd5c326790b51df6ebf60f402" "93a0885d5f46d2aeac12bf6be1754faa7d5e28b27926b8aa812840fe7d0b7983" "75d3dde259ce79660bac8e9e237b55674b910b470f313cdf4b019230d01a982a" "d2e9c7e31e574bf38f4b0fb927aaff20c1e5f92f72001102758005e53d77b8c9" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "ecba61c2239fbef776a72b65295b88e5534e458dfe3e6d7d9f9cb353448a569e" "cd736a63aa586be066d5a1f0e51179239fe70e16a9f18991f6f5d99732cabb32" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "6b289bab28a7e511f9c54496be647dc60f5bd8f9917c9495978762b99d8c96a0" "b54826e5d9978d59f9e0a169bbd4739dd927eead3ef65f56786621b53c031a7c" "fe666e5ac37c2dfcf80074e88b9252c71a22b6f5d2f566df9a7aa4f9bea55ef8" "356e5cbe0874b444263f3e1f9fffd4ae4c82c1b07fe085ba26e2a6d332db34dd" default)))
 '(lsp-ui-doc-enable nil)
 '(lsp-ui-sideline-enable nil)
 '(package-selected-packages
   (quote
    (flycheck-haskell find-file-in-project drag-stuff nlinum-relative lsp-haskell lsp-ui company-lsp lsp-mode haskell-mode tide web-beautify ox-html5slide json-mode yaml-mode graphql-mode tabbar treemacs-projectile treemacs-evil treemacs magit js2-refactor evil-textobj-anyblock doom-modeline company-tern fold-this dired-ranger nyan-mode markdown-mode company editorconfig expand-region evil-surround ace-jump-mode rjsx-mode web-mode yasnippet evil golden-ratio beacon doom-themes counsel smex ivy ##))))
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
(load-theme 'doom-subliminal t)
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
(global-set-key (kbd "C-p") 'find-file-in-project)    ;; find file in project
(global-set-key (kbd "C-s") 'save-buffer)            ;; save
(global-set-key (kbd "<C-S-tab>") 'quit-window)            ;; return의 의미
(global-set-key (kbd "s-w") 'kill-this-buffer)       ;; close의 의미
(global-set-key (kbd "C-f") 'swiper)                 ;; swiper
(global-set-key (kbd "C-s-f") 'counsel-rg)                 ;; swiper
(global-set-key (kbd "C-b") 'counsel-ibuffer)       ;; switch to buffer
(global-set-key (kbd "C-`") 'other-window)       ;; Switch window
(global-set-key (kbd "C-~") 'copy-buffers-in-windows) ;; copy-buffers-in-windows
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
(global-set-key (kbd "s-<left>") 'move-beginning-of-line)
(global-set-key (kbd "s-<right>") 'move-end-of-line)
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

(require 'web-mode)
(require 'flycheck)
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
  (setq tide-completion-detailed t)
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
(add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "ts" (file-name-extension buffer-file-name))
              (setup-tide-mode))))

;; enable typescript-tslint checker
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


(define-key web-mode-map (kbd "C-c C-a") 'web-mode-attribute-select)
(define-key web-mode-map (kbd "C-c C-c") 'web-mode-element-content-select)
(define-key web-mode-map (kbd "C-c C-t") 'web-mode-tag-select)
(define-key web-mode-map (kbd "C-c C-e") 'web-mode-element-select)
(define-key web-mode-map (kbd "C-c C-w") 'web-mode-tag-end)
(define-key web-mode-map (kbd "C-c C-r") 'web-mode-element-rename)
(define-key web-mode-map (kbd "C-c C-d") 'web-mode-attribute-kill)
(define-key web-mode-map (kbd "C-c f") 'fold-active-region)


;; TABbar mode configure
(tabbar-mode 1)
(define-key global-map (kbd "s-{") 'tabbar-backward-tab)
(define-key global-map (kbd "s-}") 'tabbar-forward-tab)
(define-key global-map (kbd "C-s-{") 'tabbar-backward-group)
(define-key global-map (kbd "C-s-}") 'tabbar-forward-group)


;; SmartParen
(electric-pair-mode 1)
(put 'scroll-left 'disabled nil)

(add-hook 'haskell-mode-hook #'flycheck-haskell-setup)
(add-hook 'haskell-mode-hook 'flycheck-mode)
(require 'lsp-ui)
(require 'lsp-mode)
(require 'lsp-haskell)
(require 'company-lsp)
(setq lsp-haskell-process-path-hie "hie-wrapper")

(add-hook 'lsp-mode-hook 'lsp-ui-mode)

;;https://stackoverflow.com/questions/18347968/how-to-open-emacs-gui-ide-from-mac-terminal
(setq ns-pop-up-frames nil)

(drag-stuff-global-mode 1)
(drag-stuff-define-keys)

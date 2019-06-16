;;----------------------------------------------------------------------------
;; Javascript utilities
;;----------------------------------------------------------------------------

;; (defun browse-current-file ()
;;   "Open the current file as a URL using `browse-url'."
;;   (interactive)
;;   (let ((file-name (buffer-file-name)))
;;     (if (and (fboundp 'tramp-tramp-file-p)
;;              (tramp-tramp-file-p file-name))
;;         (error "Cannot open tramp file")
;;       (browse-url (concat "file://" file-name)))))

(defun js/hello-world ()
  (interactive)
  (message "Hello World!"))

(provide 'js-utils)

(setq ts-module-alist
      '(("react" . "import * as React from \"react\";")
        ("styled-components" . "import styled from \"styled-components\";")))
    

;; <Text a=1 b=2 c={3}>


;; <Text
;;   a=1
;;   b=2/>
(defun custom/sample ()
  (interactive)
  (if (equal major-mode 'web-mode)
      (message "it's web-mode")
    (message "it's not a web-mode")))

(defun insert-string-at-buffer-begin (str)
  (save-excursion
    (goto-char (point-min))
    (insert str "\n")))

(defun import/ts ()
  "Lookup ts-module-alist and insert selected module at the beginning of buffer"
  (interactive)
  (ivy-read "module: "
            ts-module-alist
            :keymap counsel-describe-map
            :preselect (ivy-thing-at-point)
            :require-match t
            :sort t
            :action (lambda (x) (insert-string-at-buffer-begin (cdr x)))
            ))

;; (setq custom/var1 "custom ahaha")
;; cousel-describe-variable RET custom/var1 RET  -> "custom ahaha"

(defun jsx/delete-insideof-tag ()
  (interactive)
  (let ( (left (save-excursion (re-search-backward "<" nil t)))
      (right (save-excursion (re-search-forward ">" nil t))))
  (when (and left right)
    (kill-region (+ left 1) (+ right -1)))))

(defun jsx/mark-insideof-tag ()
  (interactive)
  (let ( (left (save-excursion (re-search-backward "<" nil t)))
      (right (save-excursion (re-search-forward ">" nil t))))
  (when (and left right)
    (goto-char right)
    (push-mark (+ left 1))
    (setq mark-active t))))

(defun _sum (a b)
  (interactive
   (list
    (read-number "First num: ")
    (read-number "Second num: ")))
  (message (+ a b)))
      

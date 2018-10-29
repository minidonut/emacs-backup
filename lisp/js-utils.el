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


    

;; <Text a=1 b=2 c={3}>


;; <Text
;;   a=1
;;   b=2/>


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

      

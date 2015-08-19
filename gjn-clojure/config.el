
;; Add magic requires that modify the namespace if a require is missing when
;; it's alias is used.
(add-hook
 'clj-refactor-mode-hook
 (lambda ()

   (dolist (pair '(("async" . "clojure.core.async")
                   ("string" . "clojure.string")
                   ("str" . "clojure.string")
                   ("component" . "com.stuartsierra.component")
                   ("gen" . "clojure.test.check.generators")
                   ("prop" . "clojure.test.check.properties")
                   ("s" . "schema.core")))
     (add-to-list 'cljr-magic-require-namespaces pair))))


(defun adulteratedjedi/clojure-hooks ()
  (spacemacs|diminish cider-mode " " " cider")
  (spacemacs|diminish clj-refactor-mode " ⇮" " cljr")
  (eldoc-mode 1)
  (subword-mode t)
  (setq font-lock-verbose nil)
  (paredit-mode 1)
  (diminish 'paredit-mode " ()")
  )

(use-package clojure-mode
  :config
  (progn
    (add-hook 'clojure-mode-hook 'adulteratedjedi/clojure-hooks)))

(defun adulteratedjedi/setup-cider ()
  (lambda ()
    (setq cider-history-file "~/.nrepl-history"
          cider-hide-special-buffers t
          cider-repl-history-size 10000
          cider-prefer-local-resources t
          cider-popup-stacktraces-in-repl t
          clojure-enable-fancify-symbols t)
    (paredit-mode 1)
    (eldoc-mode 1)))

(use-package cider
  :init
  (progn
    (add-hook 'cider-mode-hook 'adulteratedjedi/setup-cider)
    (add-hook 'cider-repl-mode-hook 'adulteratedjedi/setup-cider)
    (add-hook 'cider-mode-hook 'adulteratedjedi/clojure-hooks)
    (add-hook 'cider-repl-mode-hook 'adulteratedjedi/clojure-hooks))
  )

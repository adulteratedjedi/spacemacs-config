;; Add magic requires that modify the namespace if a require is missing when
;; it's alias is used.
(add-hook
 'clj-refactor-mode-hook
 (lambda ()
   (spacemacs|diminish cider-mode " " " cider")

   (dolist (pair '(("async" . "clojure.core.async")
                   ("string" . "clojure.string")
                   ("str" . "clojure.string")
                   ("component" . "com.stuartsierra.component")
                   ("gen" . "clojure.test.check.generators")
                   ("prop" . "clojure.test.check.properties")
                   ("s" . "schema.core")))
     (add-to-list 'cljr-magic-require-namespaces pair))))

(add-hook
 'cider-mode-hook
 (lambda ()
   (spacemacs|diminish clj-refactor-mode " ⇮" " cljr")))

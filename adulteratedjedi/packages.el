;;; packages.el --- adulteratedjedi Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq adulteratedjedi-packages
    '(
      wakatime-mode
      exec-path-from-shell
      ))

(setq adulteratedjedi-excluded-packages '())

(defun adulteratedjedi/init-wakatime-mode ()
  (use-package wakatime-mode
    :config
    (setq wakatime-api-key "a9d3c07c-fa7c-451f-8fa6-cb16e5aa72b5"
          wakatime-cli-path "/usr/local/bin/wakatime")
    :diminish wakatime-mode 
    :init
    (progn
      (global-wakatime-mode)))
  )

(defun adulteratedjedi/init-exec-path-from-shell ()
  (use-package exec-path-from-shell
    :init (when (memq window-system '(mac ns x))
            (exec-path-from-shell-initialize)))
  )


; turn off welcome screen
(setq inhibit-startup-screen t)
; turn off help message
(setq initial-scratch-message nil)

; do not show menubar
(menu-bar-mode -1)
; do not show toolbar
(tool-bar-mode -1)

; turn off blinking cursor
(blink-cursor-mode 0)

; backups settings
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.emacs-saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

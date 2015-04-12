
;; AltキーをMetaキーとする
(setq w32-alt-is-meta t)

;; yes/no -> y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; 起動メニュー＆メッセージを表示しない
(setq inhibit-startup-menu t)
(setq inhibit-startup-message t)

;; メニューバー表示しない
(menu-bar-mode -1)

;; ツールバー表示しない
(tool-bar-mode -1)

;; ウィンドウ間移動
(global-set-key (kbd "C-;") (lambda () (interactive) (other-window 1)))
(global-set-key (kbd "C-+") (lambda () (interactive) (other-window -1)))

;; ウィンドウリサイズ
(global-set-key (kbd "<S-up>"   ) (lambda () (interactive) (enlarge-window 1   )))
(global-set-key (kbd "<S-down>" ) (lambda () (interactive) (enlarge-window -1  )))
(global-set-key (kbd "<S-right>") (lambda () (interactive) (enlarge-window 1  t)))
(global-set-key (kbd "<S-left>" ) (lambda () (interactive) (enlarge-window -1 t)))

;; Shell-modeのショートカット
;(global-set-key (kbd "[f1]") 'shell)


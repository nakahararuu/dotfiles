runtime init/plugins.vim

" look and feel
set number " 行番号を表示
set hlsearch " 検索キーワードをハイライト
set tabstop=4 " tabをspace4文字で表示
set shiftwidth=4 " space4文字分でインデント
set laststatus=2 " ステータスラインを常に表示
set nowrap " 行の折り返し無効
syntax on " シンタックスハイライト
filetype plugin indent on " ファイルタイプ・インデント検出

" search
" 大文字と小文字を無視して検索
set ignorecase
set smartcase

" EXモードへの切り替えを無効化
nnoremap Q <Nop>

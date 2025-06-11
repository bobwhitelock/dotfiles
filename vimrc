
" Force Vim to use Python 3 rather than have plugins (like UltiSnips)
" sporadically blow up and complain depending on which plugins are already
" loaded. See https://robertbasic.com/blog/force-python-version-in-vim/.
call has('python3')

call plug#begin()
" Sensible defaults.
Plug 'tpope/vim-sensible'

" Handle surroundings (ys/cs/ds).
Plug 'tpope/vim-surround'

" Various mappings for HTML/XML/ERB etc. In particular extra replacements for
" vim-surround:
" - `-` -> `<% ^ %>`
" - `=` -> `<%= ^ %>`
" - `#` -> `<%# ^ %>`
Plug 'tpope/vim-ragtag'

" Comment and uncomment (gc*).
Plug 'tpope/vim-commentary'

" Unix command helpers (e.g. SudoWrite).
Plug 'tpope/vim-eunuch'

" Git command helpers (:G*).
Plug 'tpope/vim-fugitive'

" GitHub :GBrowse handling for the above.
Plug 'tpope/vim-rhubarb'

" Various paired bracket mappings.
Plug 'tpope/vim-unimpaired'

" Date/time handling for C-a and C-x.
Plug 'tpope/vim-speeddating'

" Readline key bindings for Vim (C-a, C-e etc.).
Plug 'tpope/vim-rsi'

" - Generate abbreviations (Abolish).
" - Substitute related names (Subvert).
" - Coerce word cases: snake_case (crs), MixedCase (crm), camelCase (crc),
"   snake_case (crs), UPPER_CASE (cru), dash-case (cr-), dot.case (cr.), space
"   case (cr<space>), and Title Case (crt).
Plug 'tpope/vim-abolish'
" Have either of these work to convert to camelCase, since I always mix these
" up.
nmap crC crc

" Continuously updating session files (record with `Obsess`; stop recording
" with `Obsess!`).
Plug 'tpope/vim-obsession'

" Show git changes in gutter.
Plug 'airblade/vim-gitgutter'

" Asynchronous linting/fixing.
" Plug 'w0rp/ale'
let g:ale_linters = {'ruby': ['standardrb']}
let g:ale_fixers = {'ruby': ['standardrb']}
let g:ale_fix_on_save = 1
let g:ruby_indent_assignment_style = 'variable'
let g:ale_sh_shellcheck_options = '--shell=bash'
let g:ale_python_pylint_options = '--rcfile ~/.pylintrc'

" Single command (gw) for grabbing then swapping windows.
Plug 'wesQ3/vim-windowswap'

" Autocompletion.
" XXX Was slowing things down? And also erroring sometimes
Plug 'neoclide/coc.nvim', {'do': 'source /usr/share/nvm/init-nvm.sh && nvm use system && yarn install --frozen-lockfile'}

" Reopen last-closed window (C-w u)
Plug 'AndrewRadev/undoquit.vim'

" Transition between single and multiline code (gS / gJ).
Plug 'AndrewRadev/splitjoin.vim'

" Motions through camel-case/underscore-case words.
Plug 'bkad/CamelCaseMotion'

" Emacs-like handling of previously yanked text.
Plug 'vim-scripts/YankRing.vim'

" Add commands and functions to include different syntax settings within a
" file.
Plug 'vim-scripts/ingo-library'
Plug 'vim-scripts/SyntaxRange'

" For custom text objects, needed for all vim-textobj plugins.
Plug 'kana/vim-textobj-user'

" Variable (CamelCase or underscore) segment text object (iv / av).
Plug 'Julian/vim-textobj-variable-segment'

" Comment text object (ic / ac / aC).
Plug 'glts/vim-textobj-comment'

" Entire buffer text object (ie / ae).
Plug 'kana/vim-textobj-entire'

" HTML/XML attribute text object (ix / ax).
Plug 'whatyouhide/vim-textobj-xmlattr'

" Indent-level text object (ai / ii / aI / iI).
Plug 'michaeljsmith/vim-indent-object'

" ERB text object (iE / aE).
Plug 'whatyouhide/vim-textobj-erb'

" Text object for pairs of quotes of any type (single, double, or backtick; iq
" / aq).
Plug 'beloglazov/vim-textobj-quotes'

" For custom operators, needed for all vim-operator plugins.
Plug 'kana/vim-operator-user'

" Operator to replace with register content.
Plug 'kana/vim-operator-replace'
map _  <Plug>(operator-replace)

" Operator to search web.
" TODO: Modify this so can pass in the filetype and get more relevant results.
Plug 'kana/vim-wwwsearch'
map gW <Plug>(operator-wwwsearch)
let g:wwwsearch_command_to_open_uri = 'xdg-open {uri}'

" Operator to search using Ag/Ack/CtrlSF/Ggrep/etc.
Plug 'rgrinberg/vim-operator-gsearch'
map gr <Plug>(operator-ggrep)
let g:gsearch_ggrep_command = 'Ggrep!'

" View tree of all undos.
Plug 'sjl/gundo.vim/'

" Automatically close HTML/XML tags.
Plug 'alvan/vim-closetag'

" Improved navigation between vim and tmux panes (C-h/C-j/C-k/C-l).
Plug 'christoomey/vim-tmux-navigator'

" Better file browser than netrw.
Plug 'justinmk/vim-dirvish'
let g:dirvish_mode = ':sort'

" Adds commands to resize/create splits to/for current visual selection
" (VSResize, VSSplit etc).
Plug 'wellle/visual-split.vim'

" Numerous extra text objects (see
" https://github.com/wellle/targets.vim/blob/master/cheatsheet.md).
Plug 'wellle/targets.vim'

" Fuzzy finder for many different sources.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let g:fzf_layout = { 'down': '40%' }

" Search for current visual selection with */#.
Plug 'bronson/vim-visual-star-search'

" A Vim function to automatically commit to Git.
Plug 'tlvince/vim-auto-commit'

" Commands/maps for opening browser.
Plug 'tyru/open-browser.vim'

" Snippets.
" Need to make sure venv will use UltiSnips in is sourced at point this is
" installed, otherwise things won't work right.
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Commands to run tests in different ways.
Plug 'janko-m/vim-test'
Plug 'tpope/vim-dispatch' " Recommended for use by `vim-test`.

" Command to send a command to a given Tmux pane.
Plug 'jgdavey/tslime.vim'

" Maps/commands to look things up in devdocs.io.
Plug 'rhysd/devdocs.vim'

" " Make C-a/C-x work as expected when `-` in front of number.
" XXX Disabled atm as conflicts with `vim-speeddating`.
" Plug 'osyo-manga/vim-trip'
" nmap <C-a> <Plug>(trip-increment)
" nmap <C-x> <Plug>(trip-decrement)

" Plug 'bobwhitelock/vim-lumberjack'
" Operator to log motion as output.
Plug '~/src/bobwhitelock/vim-lumberjack'
map gl <Plug>(operator-print-below)
map gL <Plug>(operator-print-above)

" Slightly better `:%s/<cword>/foo/gc` - starts at current word and can scope
" to visual selection.
Plug 'wincent/scalpel'

" Tweaks and commands for working with bulleted/numbered lists.
Plug 'dkarter/bullets.vim'
let g:bullets_outline_levels = ['ROM', 'ABC', 'num', 'abc', 'rom', 'std-', 'std-']
let g:bullets_renumber_on_change = 0
let g:bullets_nested_checkboxes = 0

" Commands to hide/show lines of buffer using regexes (Hide / Show / ShowAll).
Plug 'ctechols/vim-hideshow'

" Easily filter quickfix list:
" <Leader>gg to filter entries (defined in `vim/ftplugin/qf.vim`);
" <Leader>gi to inverted filter entries (defined in `vim/ftplugin/qf.vim`);
" <Leader>r to restore original quickfix list before filtering.
Plug 'sk1418/QFGrep'

" Expand braces on current line/visual selection (Expand) - e.g.
" `function {add,remove}_user()` -> 2 function definitions.
Plug 'Olical/vim-expand'

" GitHub Copilot.
" Plug 'github/copilot.vim'

" Language-specific.
Plug 'markcornick/vim-bats'
Plug 'ElmCast/elm-vim'
Plug 'rdolgushin/gitignore.vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'elzr/vim-json'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'tpope/vim-liquid'
Plug 'othree/nginx-contrib-vim'
Plug 'nvie/vim-flake8'
" XXX Could replace this, maybe other things (vim-rubocop, Black etc?) with
" just using ALE/COC?
" Plug 'tell-k/vim-autopep8'
" If Black gets out of sync with Rescale Black version, `rm -rf ~/.vim/black`,
" `:PlugUpdate`, restart Vim outside of Rescale venv and run `:Black` to
" reinstall this. (Will this always actually work? Is there a better way?)
" Also see https://github.com/psf/black/issues/2547.
" XXX Use this instead but does not work, figure out why and then can ensure
" black versions in sync
" let g:black_use_virtualenv = 0
Plug 'psf/black', { 'branch': 'stable' }
Plug 'yaymukund/vim-rabl'
Plug 'ngmy/vim-rubocop'
Plug 'vim-ruby/vim-ruby'
" Bundler support - alters `path` and `tags` to include Gems etc.
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
" Project-specific configuration; dependency of `vim-rake`.
Plug 'tpope/vim-projectionist'
Plug 'killphi/vim-ruby-refactoring'
Plug 'nelstrom/vim-textobj-rubyblock' " Ruby block text object (ir / ar).
Plug 'Matt-Deacalion/vim-systemd-syntax'
Plug 'tmux-plugins/vim-tmux'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
let g:rust_clip_command = 'xclip -selection clipboard'
Plug 'mattn/webapi-vim' " Required by rust.vim for :RustPlay.
" Plug 'fatih/vim-go'
Plug 'https://gitlab.com/dbeniamine/todo.txt-vim.git'
Plug 'chrisbra/csv.vim'
let g:no_csv_maps = 1
Plug 'neovimhaskell/haskell-vim'
Plug 'alx741/vim-hindent' " Haskell auto-formatting, with `hindent` installed.
Plug 'saltstack/salt-vim'
Plug 'vim-python/python-syntax'
let g:python_highlight_all = 1
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'hashivim/vim-terraform'
Plug 'google/vim-jsonnet'
Plug 'MTDL9/vim-log-highlighting'
Plug 'kyoh86/vim-jsonl'
Plug 'terrastruct/d2-vim'
" TODO: Remove some of above in favour of this?
" Breaks markdown formatting, snippets, maybe other things - due to duplicate
" plugin installs?
" Plug 'sheerun/vim-polyglot'

" Passive features.
Plug 'tpope/vim-endwise' " Automatically end certain structures.
Plug 'tpope/vim-sleuth' " Automatic indent settings.
Plug 'tpope/vim-repeat' " Make '.' work with mappings.
Plug 'kreskij/Repeatable.vim', { 'on': 'Repeatable' }
Plug 'ntpeters/vim-better-whitespace' " Highlight trailing whitespace.
Plug 'henrik/vim-indexed-search' " Show number of search results.
Plug 'valloric/MatchTagAlways' " Highlight enclosing HTML/XML tags.
Plug 'jiangmiao/auto-pairs' " Inserting and deleting brackets.
Plug 'jkerian/HiCursorWords' " Highlight occurrences of word under cursor.
let g:HiCursorWords_linkStyle='ColorColumn'
" TODO disabled for now as was slowing things down.
" Plug 'vimtaku/hl_matchit.vim' " Highlight matchit.vim matches.
Plug 'junegunn/vim-peekaboo' " Popup window showing all registers whenever attempt to access.
Plug 'ap/vim-css-color' " Highlight background of CSS colors.
Plug 'pbrisbin/vim-mkdir' " Automatically create parent directories on write when don't exist already.
Plug 'unblevable/quick-scope' " Highlight useful chars to jump to for `f`/`F`/`t`/`T`.
" Handle opening GitHub links (like those passed to `Plug`) with `gx`.
Plug 'gabebw/vim-github-link-opener', {'branch': 'main'}

" Indentation lines (Note: can seriously affect performance for files with
" long lines, see https://github.com/Yggdroot/indentLine/issues/48)
" Plug 'Yggdroot/indentLine'

 " Status line. Currently pinned to old commit as colours broke on upgrade.
Plug 'bling/vim-airline', { 'commit': 'ca6ab34' }

" Colorschemes.
Plug 'tomasr/molokai'
call plug#end()

colorscheme molokai

set cursorline " Highlight current line.

" Highlight settings.
highlight Visual ctermfg=233 ctermbg=67 guifg=#1b1d1e guibg=#465457
highlight MatchParen ctermfg=233 ctermbg=67 guifg=#1b1d1e guibg=#465457

set hlsearch
highlight clear Search
highlight Search gui=underline cterm=underline

" Reset gitgutter highlighting to what it used to be (see
" https://github.com/airblade/vim-gitgutter/commit/afa4f2ddf0fecb37914ec37357636abb18013422).
highlight GitGutterAdd    guifg=#009900 guibg=#232526 ctermfg=2 ctermbg=236
highlight GitGutterChange guifg=#bbbb00 guibg=#232526 ctermfg=3 ctermbg=236
highlight GitGutterDelete guifg=#ff2222 guibg=#232526 ctermfg=1 ctermbg=236

" Subtle highlighting for `quick-scope` characters.
highlight QuickScopePrimary gui=underline cterm=underline
highlight QuickScopeSecondary ctermbg=236

set number " Show current line number.

set undofile " Maintain undo history between sessions.
set undodir=~/.vim/undodir " Dir for undo history.

" Don't use swap files. Cause more trouble than they're worth; saving often,
" undofiles, and committing often are better ways to avoid losing things.
set noswapfile

" Add new splits on right/below existing.
set splitbelow
set splitright

set lazyredraw " Redraw only when needed.

set linebreak " Wrap lines at better places.

set hidden " Allow hidden buffers with unsaved content.

set nostartofline " Don't move cursor to start of line after various commands.

set ignorecase " Ignore case in searches...
set smartcase " ...unless search includes a capital.

" Better default indentation handling (indent is 2 spaces and expand tabs as
" this); `vim-sleuth` will still pick up correct indentation settings for an
" existing file if it is written in a different style.
set expandtab
set shiftwidth=2

" Use correct language for spellcheck (cos to toggle; z= for corrections).
set spelllang=en_gb

" Ignore these in various cases.
set wildignore+=.git/*,*.swp,*.swo

" Start scrolling when certain distance from edges of window.
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" Allow use of `gf` for relative imports in JS.
set suffixesadd+=.js

" Allow modeline settings.
" TODO: Apparently insecure sometimes.
set modeline
set modelines=20

" Show current key strokes, or size of select area when in visual mode, in
" bottom right corner.
set showcmd

" Always show sign column, to avoid shift when signs appear.
set signcolumn=yes

" Do not treat `#` as part of a file name so can e.g. use `gF` while cursor in
" `foo.md#5` to jump to line 5 of `foo.md`.
set isfname-=#

" Include tags from `.git/tags`.
set tags^=./.git/tags;

" Other settings recommended by coc (https://github.com/neoclide/coc.nvim).
set nowritebackup
set cmdheight=2

" Highlight shell scripts as bash by default unless specified otherwise.
let g:is_bash=1

augroup autocmds
  autocmd!

  " Miscellaneous file types.
  autocmd BufNewFile,BufRead .babelrc set filetype=javascript
  autocmd BufNewFile,BufRead .eslintrc,.reduxrc set filetype=json
  autocmd BufNewFile,BufRead gitconfig set filetype=gitconfig
  autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
  autocmd BufNewFile,BufRead *.zsh set filetype=sh
  autocmd BufNewFile,BufRead *.pyconf set filetype=conf
  autocmd BufNewFile,BufRead *cloud.cfg set filetype=yaml
  autocmd BufNewFile,BufRead .prettierrc set filetype=json
  autocmd BufNewFile,BufRead *.mm set filetype=xml
  autocmd BufNewFile,BufRead *.xaml set filetype=xml
  autocmd BufNewFile,BufRead *.todo set filetype=todo
  autocmd BufNewFile,BufRead .sqlfluff set filetype=confini

  " Set Rescale Jenkins configs to be Jenkins-specific filetype.
  autocmd BufNewFile,BufRead **/jenkins-jobs/**/*.groovy set filetype=Jenkinsfile

  " oh-my-zsh themes are shell.
  autocmd BufNewFile,BufRead *.zsh-theme set filetype=sh

  " Tmuxinator configs can contain embedded ERB.
  autocmd BufNewFile,BufRead **/tmuxinator/*.yml set filetype=yaml.eruby

  " Graphviz files use `dot` language.
  autocmd BufNewFile,BufRead *.gv set filetype=dot

  " Always want spellcheck for text files.
  autocmd BufNewFile,BufRead *.txt,*.md,*.markdown,*.rst,*.todo setlocal spell
  autocmd FileType gitcommit setlocal spell

  " Open quickfix window after any grep.
  autocmd QuickFixCmdPost *grep* cwindow

  " Resize panes whenever containing window resized.
  autocmd VimResized * wincmd =

  " Follow symlinks when opening files.
  autocmd BufReadPost * nested call FollowSymlink(expand('%'))

  " Make `3` in Markdown files trigger vim-surround maps for code blocks.
  autocmd FileType markdown let b:surround_51 = "```\n\r\n```"

  " XXX Has been needed before for some reason; may be needed again.
  " autocmd FileType javascript.jsx set syntax=javascript.jsx

  " Force syntax highlighting to synchronize from start on entering a buffer;
  " fixes issue where syntax highlighting can break sometimes (see
  " https://stackoverflow.com/questions/27235102/vim-randomly-breaks-syntax-highlighting).
  autocmd BufEnter * syntax sync fromstart
augroup END

" Create CamelCaseMotion maps name-spaced behind leader.
call camelcasemotion#CreateMotionMappings('<leader>')

" Toggle automatically formatting Python according to PEP8 (default), using
" Black, or disabling auto-formatting.
" TODO Move this to appropriate ftplugin file?
" - Not sure how this would work with making this toggle-able though.
" TODO Make these work for Python files without an extension.
function! s:EnablePythonAutoFormatAutopep8()
  augroup python_auto_format
    autocmd!
    autocmd BufWritePre *.py call Autopep8()
  augroup END
endfunction
command! EnablePythonAutoFormatAutopep8 call s:EnablePythonAutoFormatAutopep8()

function! s:EnablePythonAutoFormatBlack()
  augroup python_auto_format
    autocmd!
    autocmd BufWritePre *.py execute ':Black'
  augroup END
endfunction
command! EnablePythonAutoFormatBlack call s:EnablePythonAutoFormatBlack()
EnablePythonAutoFormatBlack

function! s:DisablePythonAutoFormat()
  augroup python_auto_format
    autocmd!
  augroup END
endfunction
command! DisablePythonAutoFormat call s:DisablePythonAutoFormat()

" Commands to enable/disable auto-committing on every save in git repos -
" useful when developing something where changes won't take effect until a
" commit is made, and can then squash when finished.
function! s:EnableAutoCommit()
  augroup git_auto_commit
    autocmd!
    autocmd BufWritePost * call AutoCommit()
  augroup END
endfunction
command! EnableAutoCommit call s:EnableAutoCommit()

function! s:DisableAutoCommit()
  augroup git_auto_commit
    autocmd!
  augroup END
endfunction
command! DisableAutoCommit call s:DisableAutoCommit()

augroup prettier_on_save
  autocmd!
  autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx call s:PrettierWrite()
augroup END

let g:prettier_running = 0

function! s:PrettierWrite()
  let l:output = system('npx prettier --write ' . shellescape(@%))
  if v:shell_error
    echohl ErrorMsg
    echo "Prettier failed:\n" . l:output
    echohl None
  else
    silent! edit!
  endif
endfunction

" When searching for ctags include generated tag files in neighbouring repos.
command! IncludeNeighbourTags set tags+=../*/.git/tags

" Disable some built in plugins.
" As dicussed in https://www.reddit.com/r/vim/comments/7anxss.
let g:loaded_getscript         = 1 "$VIMRUNTIME/autoload/getscript.vim
let g:loaded_getscriptPlugin   = 1 "$VIMRUNTIME/plugin/getscriptPlugin.vim
let g:loaded_vimball           = 1 "$VIMRUNTIME/autoload/vimball.vim
let g:loaded_vimballPlugin     = 1 "$VIMRUNTIME/plugin/vimballPlugin.vim
" let g:loaded_netrw             = 1 "$VIMRUNTIME/autoload/netrw.vim
" let g:loaded_netrwFileHandlers = 1 "$VIMRUNTIME/autoload/netrwFileHandlers.vim
" let g:loaded_netrwPlugin       = 1 "$VIMRUNTIME/plugin/netrwPlugin.vim
" let g:loaded_netrwSettings     = 1 "$VIMRUNTIME/autoload/netrwSettings.vim

" Low vim-plug timeout to get around issue where installing fails sometimes
" and have to wait 60 seconds for timeout.
let g:plug_timeout = 5

let g:vim_json_syntax_conceal = 0 " Don't hide Json syntax.

let g:jsx_ext_required = 0 " Let vim-jsx handle JSX in `.js` files.

let g:indentLine_char = '│' " indentLine character.

let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'javascript.jsx' : 1,
    \ 'jinja' : 1,
    \ 'liquid' : 1,
    \ 'markdown' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \}

" Disable unimpaired mappings which I don't want.
let g:nremap = {
  \ '[Q': '<Nop>',
  \ ']Q': '<Nop>',
  \ 'cox': '<Nop>',
  \}

" Bring back unimpaired `co` maps without deprecation warning (see
" https://github.com/tpope/vim-unimpaired/issues/150#issuecomment-387608331).
nmap co yo

" Override unimpaired map to just toggle `cursorcolumn`, since I always want
" `cursorline`.
nnoremap cox :set cursorcolumn!<CR>

" Unimpaired-style maps to jump to next/previous file in quickfix list
" (Unimpaired defaults for this conflict with my Tmux prefix).
nnoremap ]f :cnfile<CR>
nnoremap [f :cpfile<CR>

let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.js,*.jsx,*.tsx,*.html.erb'
let g:closetag_xhtml_filenames = '*.js,*.jsx,*.tsx'

let g:markdown_fenced_languages = [
    \ 'bash=sh',
    \ 'crontab',
    \ 'css',
    \ 'dot',
    \ 'elm',
    \ 'js=javascript',
    \ 'json',
    \ 'log',
    \ 'python',
    \ 'qf',
    \ 'ruby',
    \ 'sh',
    \ 'sql',
    \ 'ts=typescript',
    \ 'xml',
    \ 'yaml'
    \]
let g:markdown_syntax_conceal = 0

let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 0

let g:windowswap_map_keys = 0 " Prevent default bindings.
nnoremap <silent> gw :call WindowSwap#EasyWindowSwap()<CR>

let g:HiCursorWords_delay = 100

let g:rustfmt_autosave = 1 " Run rustfmt on save of rust files.

let g:yankring_replace_n_pkey = '<C-u>'
let g:yankring_replace_n_nkey = '<C-d>'
nnoremap <C-y> :YRShow<CR>

let g:AutoPairsShortcutToggle = ''

" Default maps minus quote maps, which were getting in the way.
let g:AutoPairs = {
    \ '(': ')',
    \ '[': ']',
    \ '{': '}',
    \ '`': '`'
    \}

let g:elm_setup_keybindings = 0
let g:elm_format_autosave = 1

let g:hl_matchit_enable_on_vim_startup = 1
let g:hl_matchit_hl_groupname = 'MatchParen'
let g:hl_matchit_speed_level = 2

let g:autopep8_disable_show_diff=1

let g:zv_disable_mapping = 1

let g:gundo_prefer_python3 = 1

let g:UltiSnipsExpandTrigger='<C-e>'
let g:UltiSnipsJumpForwardTrigger='<C-d>'
let g:UltiSnipsJumpBackwardTrigger='<C-u>'
nnoremap <leader>ue :UltiSnipsEdit<CR>

" Custom vim-test strategy; identical to `tslime` strategy except caches
" results for loading into QuickFix window using `Failures` command below (so
" can quickly jump between failures), and also interrupts anything currently
" running so can cancel already running tests/any other running command.
function! TslimeAndCacheStrategy(cmd)
  " Interrupt twice to also send interrupt to e.g. RSpec's graceful interrupt
  " handling.
  TmuxInterrupt
  TmuxInterrupt

  " TODO: Need to create new temp file each time? Should remove old temp file?
  let s:output_file = trim(system('mktemp'))
  let l:test_command = 'faketty '.a:cmd.' | tee >(stripcolours > '.s:output_file.')'
  " let l:test_command = 'faketty '.a:cmd.' | tee >(stripcolours > '.s:output_file.') ; pingme "Tests complete\!"'
  " Uncomment for developing Datasette plugin.
  " let l:test_command = "python3 -m pip install -e '.[test]' && ".a:cmd
  call test#strategy#tslime(l:test_command)

  " Uncomment this line and comment above to just run standard command without
  " results caching performed by above (which is mostly transparent but has
  " interacted badly with the test command before, with `elm-test`).
  " call test#strategy#tslime(a:cmd)
endfunction

let g:test#custom_strategies = {'tslime_and_cache': function('TslimeAndCacheStrategy')}
" let test#strategy = 'tslime_and_cache'
let test#strategy = 'tslime'
let g:test#preserve_screen = 1

" XXX WIP, hacky, transform for seamlessly running tests within
" Docker/`docker-compose` environment.
function! DockerTransform(cmd) abort
  " XXX make this line work for Docker, copied from Vagrant-specific example
  " at https://github.com/janko-m/vim-test - need to find container name of
  " current project rather than hard-coding `cloudware` below.
  " let docker_project = get(matchlist(s:cat('Vagrantfile'), '\vconfig\.vm.synced_folder ["''].+[''"], ["''](.+)[''"]'), 1)
  let docker_project='cloudware'
  return 'docker-compose exec '.docker_project.' '.a:cmd
endfunction

let g:test#custom_transformations = {'docker': function('DockerTransform')}
" Uncomment to use hacky Docker test Transform above.
" let g:test#transformation = 'docker'

command! Failures cexpr readfile(s:output_file)
nnoremap <leader>tF :Failures<CR>

" Re-run entire Elm test suite on change; every Elm project I've worked on has
" a fast test suite.
let test#elm#elmtest#options = {
  \ 'suite': '--watch',
\}

let test#python#djangotest#options = '--keepdb'
" Useful in some situations, but these can also cause weird test failures
" sometimes.
" let test#python#djangotest#options = '--keepdb --debug-mode'
" let test#python#djangotest#options = '--keepdb --debug-sql'

let g:test#runner_commands = ['RSpec', 'CargoTest', 'DjangoTest']

" XXX Was being used when not in Java, for some reason.
" let test#java#runner = 'gradletest'
let test#javascript#jest#executable = 'npm run test'

" Maps to run tests.
nnoremap <silent> <leader>ts :call RunTests('TestSuite')<CR>
nnoremap <silent> <leader>tt :call RunTests('TestNearest')<CR>
nnoremap <silent> <leader>tf :call RunTests('TestFile')<CR>

nnoremap <silent> <leader>tv :TestVisit<CR>

function! RunTests(test_command)
  " Enable TDD mode.
  CrTdd

  " XXX Disabled for now as secondary session not working
  " Launch terminal for tests to run in, unless this has already been
  " configured.
  " if !exists('g:tslime')
  "   TmuxLaunchTerminal
  "   sleep 4 " Give terminal time to launch before running tests in it.
  " endif

  execute a:test_command
endfunction

" Map <CR> to re-run most recently run tests (the default).
function! s:CrTdd()
  nnoremap <silent> <CR> :TestLast<CR>
endfunction
command! CrTdd call s:CrTdd()
CrTdd

" Map <CR> to attempt to execute the current file.
function! s:CrRunCurrentFile()
  " Expand current file and then save and use this in mapping, rather than
  " just using `TmuxRunCurrentFile`, as want <CR> to always execute the
  " current file at the point this function is run, not whatever file the
  " cursor is in at the point the mapping is run.
  let g:current_file = expand('%:p')
  nnoremap <silent> <CR> :execute TmuxInterruptAndRun('Tmux '.g:current_file)<CR>
endfunction
command! CrRunCurrentFile call s:CrRunCurrentFile()

" Map <CR> to send content of current buffer to another Tmux pane (useful for
" sending code to a REPL).
" TODO Doesn't handle escaping or multiline file correctly.
function! s:CrSendCurrentFile()
  execute 'nnoremap <silent> <CR> ggyG:TmuxInterruptAndRun <C-q><C-l><C-r>0<CR>'
endfunction
command! CrSendCurrentFile call s:CrSendCurrentFile()

" Map <CR> to run any arbitrary command.
function! s:CrRunCommand(...)
  execute 'nnoremap <silent> <CR> :TmuxInterruptAndRun ' join(a:000) '<CR>'
endfunction
command! -nargs=? CrRunCommand call s:CrRunCommand(<q-args>)

" Run a command in the Tmux pane, sending an interrupt first.
function! TmuxInterruptAndRun(command)
  " Interrupt twice to also send interrupt to e.g. RSpec's graceful interrupt
  " handling.
  TmuxInterrupt
  TmuxInterrupt
  execute a:command
endfunction
command! -nargs=? TmuxInterruptAndRun call TmuxInterruptAndRun('Tmux '.<q-args>)
command! -nargs=0 TmuxRunCurrentFile execute TmuxInterruptAndRun('Tmux '.expand('%:p'))

function! TmuxInterrupt()
  execute 'Tmux'
endfunction
command! TmuxInterrupt call TmuxInterrupt()
nnoremap <leader>ti :TmuxInterrupt<CR>

" Maps to interact with Tmux pane.
nnoremap <silent> <leader>m :Tmux make<CR>
nnoremap <leader>T :Tmux<space>
vmap <leader>tS <Plug>SendSelectionToTmux

command! TmuxReset execute "normal <Plug>SetTmuxVars"
nnoremap <leader>tr :TmuxReset<CR>

" Launch another terminal on leftmost monitor, running Tmux session with
" unique name and same working directory, and set this to be where tslime
" commands will run.
function! TmuxLaunchTerminal()
  let current_tmux_session_name = trim(system('tmux display-message -p "#S"'))
  let secondary_tmux_session_name = join([
        \ l:current_tmux_session_name,
        \ 'secondary',
        \ trim(system('echo $$'))
        \ ], '-')
  let save_secondary_name_command = join([
        \ 'echo',
        \ l:secondary_tmux_session_name,
        \ '> /tmp/tmux_session_name'
        \ ])

  call system(save_secondary_name_command)
  call system('terminator --maximise --profile secondary --geometry  1x1+0+0 --working-directory '.getcwd().' &')

  let g:tslime = {}
  let g:tslime['session'] = l:secondary_tmux_session_name
  let g:tslime['window'] = 1
  let g:tslime['pane'] = 1
endfunction
command! TmuxLaunchTerminal call TmuxLaunchTerminal()
nnoremap <leader>tT :TmuxLaunchTerminal<CR>

" See http://vim.wikia.com/wiki/Using_vim_as_a_man-page_viewer_under_Unix.
let $PAGER=''

" Map Space to Leader; don't use `mapleader` so something shows in `showcmd`
" corner.
map <Space> <Leader>

" Explicitly map double-space to double-leader in case want to map this.
map <Space><Space> <Leader><Leader>

" Tmux window is maximized if any pane has the 'Z' flag.
function! TmuxMaximized()
  call system('tmux list-panes -F "#{window_flags}" | head -n 1 | grep Z')
  return !v:shell_error
endfunction

" Define custom vim-tmux-navigator mappings: if window is maximized only move
" within Vim panes, so navigating doesn't break out of Vim unexpectedly,
" otherwise navigate between Vim and Tmux as normal.
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <expr> <C-h> TmuxMaximized() ? ':wincmd h<CR>' : ':TmuxNavigateLeft<CR>'
nnoremap <silent> <expr> <C-j> TmuxMaximized() ? ':wincmd j<CR>' : ':TmuxNavigateDown<CR>'
nnoremap <silent> <expr> <C-k> TmuxMaximized() ? ':wincmd k<CR>' : ':TmuxNavigateUp<CR>'
nnoremap <silent> <expr> <C-l> TmuxMaximized() ? ':wincmd l<CR>' : ':TmuxNavigateRight<CR>'

" Normal previous pane mapping.
nnoremap <silent> <C-\> :TmuxNavigatePrevious<CR>

" Refresh screen and clear highlight with C-q C-l in Tmux, or just C-q
" otherwise (Tmux will then send us C-q). Mapping adapted from vim-sensible.
nnoremap <silent> <C-q> :nohlsearch<C-r>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-l>

nnoremap <leader>sv :call UltiSnips#RefreshSnippets()<CR>:source $MYVIMRC<CR>
nnoremap <leader>sf :source %<CR>

" Move by visual line.
nnoremap j gj
nnoremap k gk

" Make Y behave like C and D; defined like this so YankRing behaviour still
" works and doesn't overwrite existing map.
function! YRRunAfterMaps()
  nnoremap Y :<C-U>YRYankCount 'y$'<CR>
endfunction

" Easier macro executing (with added benefit of preventing accidentally
" entering 'Ex' mode). Rerun macro in `p` rather than `q` register to avoid
" accidentally overriting this if hit `qq`.
nnoremap Q @p

" Quick find and replace in file of current word with a new string, with and
" without confirmation respectively.
nnoremap <Leader>gc :Scalpel/\<<C-r><C-w>\>//<Left>
nnoremap <leader>gg :%s/\<<C-r><C-w>\>//gI<Left><Left><Left>

" Similarly, quick find and replace of last search.
nnoremap <leader>c/ :%s///gcI<Left><Left><Left><Left>
nnoremap <leader>g/ :%s///gI<Left><Left><Left>

" Similarly, quick find and replace of current visual selection. Adapted from
" https://stackoverflow.com/a/676619.
xnoremap <leader>gc "zy:%s/<C-r>z//gcI<Left><Left><Left><Left>
xnoremap <leader>gg "zy:%s/<C-r>z//gI<Left><Left><Left>

" XXX remove, doesn't seem to work anyway?
" " Shift-tab to indent left in insert mode.
" inoremap <S-Tab> <C-d>

" Tab/shift-tab to indent/unindent in visual mode.
xnoremap <Tab> >gv
xnoremap <S-Tab> <gv

" Delete above/below current line.
noremap [<Backspace> mzkdd`z
noremap ]<Backspace> mzjdd`z

" Don't go to next immediately when searching current word.
" TODO: broken by indexed-search? - remove indexed search mappings then remap
" all with some changed
" nnoremap * <Plug>(indexed-search-*)N

" Quick close/open of special windows.
nnoremap <leader>q :cclose \| lclose \| pclose<CR>
nnoremap <leader>Q :copen<CR>
nnoremap <leader>L :lopen<CR>

" Move through quickfix list history.
nnoremap <silent> [Q :colder<CR>
nnoremap <silent> ]Q :cnewer<CR>

" 'go quickfix' = open new tab with full size quickfix window on right, and
" first item in quickfix window open and focused on left; useful for browsing
" through quickfix list.
nnoremap <leader>gq :tabnew<CR>:wincmd v<CR>:copen<CR>:wincmd k<CR>:q<CR>:wincmd l<CR><CR>

" Reload files in all windows.
" TODO: go back to original window afterwards
" TODO: do in other tabs?
nnoremap <leader>re :windo edit!<CR>

" Delete current buffer while preserving layout.
noremap <C-c> :q<CR>

" Open file relative to current file.
noremap <C-e> :e <C-R>=expand("%:p:h") . "/" <CR>

" Replace current window with new empty buffer.
nnoremap <leader>n :new<CR><C-w>p:q<CR><C-w>p

" Easily create horizontal/vertical splits.
noremap <leader>h :wincmd s<CR>
noremap <leader>v :wincmd v<CR>

" Zoom split.
nnoremap <C-w>z :wincmd <bar><CR>:wincmd _<CR>

" C-s to save in all modes.
noremap <silent> <C-s> <Esc>:write<CR>
noremap! <silent> <C-s> <Esc>:write<CR>

" Map page up/down to C-u/C-d so cursor stays in same position.
nnoremap <PageUp> <C-u>
nnoremap <PageDown> <C-d>

" Format Json and set filetype (adapted from
" coderwall.com/p/faceag/format-json-in-vim)
noremap <silent> =J :%!python -m json.tool<CR> :setfiletype json<CR>

nnoremap <leader>gu :GundoToggle<CR>

" Sort visual selection/current paragraph, by locale or numerically
" respectively.
xnoremap gz :sort<CR>
nnoremap gz vip:sort<CR>
xnoremap gZ :sort n<CR>
nnoremap gZ vip:sort n<CR>

nnoremap <leader>tn :call CreateNewTab()<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap <leader>t> :tabmove +<CR>
nnoremap <leader>t< :tabmove -<CR>

function! CreateNewTab()
  if empty(bufname())
    tabnew
  else
    tabnew %
  endif
endfunction

nnoremap <leader>rr :Rename <C-R>=expand('%:t')<CR>

" Git mappings.
nnoremap gb :Git blame<CR>
nnoremap gd :Gdiffsplit<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gS :Gwrite<CR>:edit!<CR>
nnoremap <leader>gR :Gread<CR>
nnoremap <silent> <leader>gC :GitGutterQuickFix<CR>:call ResizeQuickFix()<CR>:cc 1<CR>

" Grep for current filename, less extension if present.
nnoremap <leader>gf :Ggrep! <C-R>=expand('%:t:r')<CR><CR><CR>

nnoremap <leader>G :Ggrep!<space>
nnoremap <leader>I :Ggrep! -i<space>

let g:gitgutter_map_keys = 0
nmap <leader>gs <Plug>(GitGutterStageHunk)
nmap <leader>gr <Plug>(GitGutterUndoHunk)
nmap <leader>gp <Plug>(GitGutterPreviewHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap ]h <Plug>(GitGutterNextHunk)
omap ih <Plug>(GitGutterTextObjectInnerPending)
omap ah <Plug>(GitGutterTextObjectOuterPending)
xmap ih <Plug>(GitGutterTextObjectInnerVisual)
xmap ah <Plug>(GitGutterTextObjectOuterVisual)

nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" Resize to show entire buffer (or as much as possible).
nmap <silent> gV mzvae:VSResize<CR>`z

" Resize quickfix window to fit content.
function! ResizeQuickFix()
  let s:current_window = winnr()

  copen
  execute "normal! mzggvG:VSResize\<CR>`z"

  " Return to previous window; can't use <C-w>p as visual-split changes
  " previous window.
  execute 'normal! ' . s:current_window . "\<C-w>w"
endfunction
nnoremap gQ :call ResizeQuickFix()<CR>

" Resize to/split out visual selection.
xnoremap <silent> gV :VSResize<CR>
xnoremap <silent> gA :VSSplitAbove<CR>
xnoremap <silent> gB :VSSplitBelow<CR>

xnoremap <silent> SI :SyntaxInclude<space>

" Maps for using system clipboard with <leader> instead of "+.
xnoremap <leader>d "+d
xnoremap <leader>y "+y
xnoremap <leader>p "+p
xnoremap <leader>P "+P
xmap <leader>_ "+_
nnoremap <leader>d "+d
nnoremap <leader>D "+D
nnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P
nmap <leader>_ "+_
nmap <leader>Y "+Y

" Move last thing yanked to system clipboard.
nnoremap <leader>cc :let @+=@"<cr>:echo "copied!"<cr>

" Copy various permutations of file name/path to system clipboard.
nnoremap <leader>ca :let @+ = expand("%:p")<CR>:echo "copied absolute filepath!"<CR>
nnoremap <leader>cp :let @+ = expand("%")<CR>:echo "copied relative filepath!"<CR>
nnoremap <leader>cf :let @+ = expand("%:t")<CR>:echo "copied filename!"<CR>
nnoremap <leader>cn :let @+ = expand("%:t:r")<CR>:echo "copied file basename!"<CR>

" Copy SHA or path to current object using Fugitive.
nmap <leader>ch "+y<C-g>:echo "copied SHA/current object path!"<CR>

" Paste above/below, justify, and return to original position.
nnoremap <leader>A mzO<esc>p==`z
nnoremap <leader>B mzo<esc>p==`z

" Make J not shift cursor position.
nnoremap J mzJ`z

" Join current line with line above; also do not move cursor as with J above.
nnoremap K mzkJ`z

" Look current word up in devdocs.io.
nmap gK <Plug>(devdocs-under-cursor)

" Open current file/current visual selection of current file in Github.
noremap <leader>gh :GBrowse<CR><CR>

nnoremap <leader>do :diffoff<CR>
" XXX Conditionally enable these only when in diff mode? Can conflict with
" other `<leader>d` maps.
nnoremap <leader>dt :diffthis<CR>
nnoremap <leader>dg :diffget<CR>
nnoremap <leader>dp :diffput<CR>

" TODO: do better, just have `z=` and `1z=` maps which enable spell first
nmap z+ cos1z=cos

" Quick appending of commonly appended chars.
Repeatable nnoremap <leader>g. mzA.<esc>`z
Repeatable nnoremap <leader>g; mzA;<esc>`z
Repeatable nnoremap <leader>g, mzA,<esc>`z

" Remove last char on line.
nnoremap g<Backspace> mzA<Backspace><Esc>`z

" Split line in different places.
Repeatable nnoremap gs( f(a<CR><Esc>
Repeatable nnoremap gs) f)i<CR><Esc>
Repeatable nnoremap gs{ f{a<CR><Esc>
Repeatable nnoremap gs} f}i<CR><Esc>
Repeatable nnoremap gs[ f[a<CR><Esc>
Repeatable nnoremap gs] f]i<CR><Esc>
Repeatable nnoremap gs, f,a<CR><Esc>
Repeatable nnoremap gs. f.i<CR><Esc>
" XXX doesn't work ¯\_(ツ)_/¯
" Repeatable nnoremap gs| echom hey<CR>f\|i<CR><Esc>
Repeatable nnoremap gss i<CR><Esc>
Repeatable nnoremap gs<space> hf<space>xi<CR><Esc>

nmap <leader>` ysiW`
nmap <leader>' ysiW'
nmap <leader>) ysiW)
nmap <leader>] ysiW]
nmap <leader>> ysiW>

" For some reason something in my config is causing `<Esc>b` in insert mode to
" jump back into insert mode. Not sure what's doing this, but ensuring
" `<Esc>b` just means `<Esc>b` appears to fix it.
inoremap <Esc>b <Esc>b

" TODO: Would be useful to make these jump over current section if in matching
" section already.
nnoremap ]+  /^+ <CR>
nnoremap [+  ?^+ <CR>
nnoremap ]-  /^- <CR>
nnoremap [-  ?^- <CR>

nnoremap <leader><leader> :e!<CR>

" Rails maps.
nnoremap <leader>eC :Econtroller<CR>
nnoremap <leader>eD :Eschema<CR>
nnoremap <leader>eI :Einitializer<CR>
nnoremap <leader>eJ :Ejavascript<CR>
nnoremap <leader>eL :Elayout<CR>
nnoremap <leader>eM :Emodel<CR>
nnoremap <leader>eS :Espec<CR>
nnoremap <leader>eV :Eview<CR>
nnoremap <leader>ec :Econtroller<space>
nnoremap <leader>ed :Eschema<space>
nnoremap <leader>ei :Einitializer<space>
nnoremap <leader>ej :Ejavascript<space>
nnoremap <leader>el :Elayout<space>
nnoremap <leader>em :Emodel<space>
nnoremap <leader>es :Espec<space>
nnoremap <leader>ev :Eview<space>
nnoremap <leader>ea :A<CR>

" Attempt to fix typo immediately after typing word, and then jump back into
" insert mode in original position.
inoremap <C-z> <esc>mzB1z=`za

nnoremap <leader>rn :RenumberList<CR>
xnoremap <leader>rn :RenumberSelection<CR>

" Re-run last command, whatever that was.
nnoremap <leader>; :<up><CR>

" Automatically set/unset paste when pasting in insert mode
" (see http://superuser.com/a/904446 - simpler method works for me under Tmux,
" and more complex one doesn't).
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ''
endfunction

" Adapted from http://stackoverflow.com/a/8459043/2620402.
function! DeleteHiddenBuffers(bwipeout_command)
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute a:bwipeout_command buf
    endfor
endfunction
command! -bang DeleteHiddenBuffers call DeleteHiddenBuffers('bwipeout<bang>')

" From http://vim.wikia.com/wiki/Underline_using_dashes_automatically.
function! s:Underline(chars)
  let chars = empty(a:chars) ? '=' : a:chars
  let nr_columns = virtcol('$') - 1
  let uline = repeat(chars, (nr_columns / len(chars)) + 1)
  put =strpart(uline, 0, nr_columns)
endfunction
command! -nargs=? Underline call s:Underline(<q-args>)

" Follow symlinks when opening files. From
" https://github.com/blueyed/dotfiles/blob/e6af94cc6aaac34becfb08bd7af14af8ddb03483/vimrc#L1637.
" Note: this happens with directory symlinks anyway (due to Vim's chdir/getcwd
" magic when getting filenames).
function! FollowSymlink(...)
  if exists('w:no_resolve_symlink') && w:no_resolve_symlink
    return
  endif
  if &ft == 'help'
    return
  endif
  let fname = a:0 ? a:1 : expand('%')
  if fname =~ '^\w\+:/'
    " Do not mess with 'fugitive://' etc.
    return
  endif
  let fname = simplify(fname)

  let resolvedfile = resolve(fname)
  if resolvedfile == fname
    return
  endif
  let resolvedfile = fnameescape(resolvedfile)
  let sshm = &shm
  set shortmess+=A  " silence ATTENTION message about swap file (would get displayed twice)
  redraw  " Redraw now, to avoid hit-enter prompt.
  exec 'file ' . resolvedfile
  let &shm=sshm

  unlet! b:git_dir
  call fugitive#detect(resolvedfile)

  if &modifiable
    " Only display a note when editing a file, especially not for `:help`.
    redraw  " Redraw now, to avoid hit-enter prompt.
    echomsg 'Resolved symlink: =>' resolvedfile
  endif
endfunction
command! ToggleFollowSymlink let w:no_resolve_symlink = !get(w:, 'no_resolve_symlink', 0) | echo "w:no_resolve_symlink =>" w:no_resolve_symlink

" Edit a file for a new 1-to-1 meeting, with today's date. Assumes Vim has
" been opened in my notes directory.
" XXX Allow creating this file for days other than today. Alternatively have
" this be created for one week after last 1-to-1, if that's in the future (and
" otherwise create for today).
function! s:OneToOne(with)
  " XXX Have this be copied into new 1-to-1 file (and then cleared up), iff
  " that doesn't already exist (in which case this is for next week)
  let next_path = join(['reference/rescale/1-to-1s', a:with, 'next.md'])

  let todays_file_name = strftime('%Y-%m-%d').'.md'
  let path = join(['reference/rescale/1-to-1s', a:with, l:todays_file_name], '/')
  execute 'edit '.l:path
endfunction
command! -nargs=1 OneToOne call s:OneToOne(<q-args>)

function! s:ProfileVim(arg)
  let l:profile_file = 'profile.log'
  if a:arg ==? 'stop'
    echom 'Profile saved as ' . l:profile_file
    profile pause
  else
    echom 'Started profiling...'
    profile start l:profile_file
    profile func *
    profile file *
  endif
endfunction
command! -nargs=? ProfileVim call s:ProfileVim(<q-args>)

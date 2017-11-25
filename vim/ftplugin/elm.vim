
" Log current word on line below/above, defining new `let` block for this.
nnoremap <buffer> gl mz"zyiwolet logDefinition = Debug.log "<C-r>z" <C-r>z in<esc>`z
nnoremap <buffer> gL mz"zyiwOlet logDefinition = Debug.log "<C-r>z" <C-r>z in<esc>`z

" As above, but without defining a new `let` block; assumes a `let` block
" already encloses cursor.
nnoremap <buffer> <leader>gl mz"zyiwologDefinition = Debug.log "<C-r>z" <C-r>z<esc>`z
nnoremap <buffer> <leader>gL mz"zyiwOlogDefinition = Debug.log "<C-r>z" <C-r>z<esc>`z

" Map to look up docs consistent with devdocs.io map in Vimrc.
nmap <buffer> gK <Plug>(elm-browse-docs)

nmap <buffer> <leader>sd <Plug>(elm-show-docs)
nmap <buffer> <leader>em <Plug>(elm-make)
nmap <buffer> <leader>eM <Plug>(elm-make-main)

" Commands for quickly adding imports.
command! -buffer -nargs=* Import call s:import(<f-args>)
command! -buffer -nargs=* ImportAs call s:import_as(<f-args>)
command! -buffer -nargs=* ImportType call s:import_type(<f-args>)

function! s:import(...)
  if empty(a:000)
    let module = expand('<cword>')
    let exposing = []
  else
    let module = a:1
    let exposing = a:000[1:]
  endif

  call s:add_import_line(module, v:null, exposing)
endfunction

function! s:import_as(first, ...)
  let module = a:first
  if empty(a:000)
    let as = expand('<cword>')
    let exposing = []
  else
    let as = a:1
    let exposing = a:000[1:]
  endif

  call s:add_import_line(module, as, exposing)
endfunction

function! s:import_type(...)
  if empty(a:000)
    let cword = expand('<cword>')
    let module = cword
    let exposing = [cword]
  else
    let module = a:1
    let exposing = [a:1] + a:000[1:]
  endif

  call s:add_import_line(module, v:null, exposing)
endfunction

function! s:add_import_line(module, as, exposing)
  let exposing_string = join(a:exposing, ',')

  let import_line = 'gg}oimport ' . a:module
  if !empty(a:as)
    let import_line .= ' as ' . a:as
  endif
  if !empty(exposing_string)
    let import_line .= ' exposing (' . exposing_string . ')'
  endif

  normal! mz
  execute 'normal!' import_line
  normal! `z
endfunction

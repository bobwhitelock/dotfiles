
" Map to look up docs consistent with devdocs.io map in Vimrc.
nmap <buffer> gK <Plug>(elm-browse-docs)

nmap <buffer> <leader>sd <Plug>(elm-show-docs)
nmap <buffer> <leader>em <Plug>(elm-make)
nmap <buffer> <leader>eM <Plug>(elm-make-main)

" Commands for quickly adding imports:
"
" `Import` => `import <cword>`
" `Import Foo` => `import `Foo`
" `Import Foo bar baz` => `import Foo exposing (bar, baz)`
"
" `ImportAs Foo` => `import Foo as <cword>`
" `ImportAs Foo Bar` => `import Foo as Bar`
" `ImportAs Foo Bar baz` => `import Foo as Bar exposing (baz)`
"
" `ImportType` => `import <cword> exposing (<cword>)`
" `ImportType Foo` => `import Foo exposing (Foo)`
" `ImportType Foo bar` => `import Foo exposing (Foo, bar)`
command! -buffer -nargs=* Import call s:import(<f-args>)
command! -buffer -nargs=* ImportAs call s:import_as(<f-args>)
command! -buffer -nargs=* ImportType call s:import_type(<f-args>)

command! -buffer ImportJsonEncode call s:import_as('Json.Encode', 'E')
command! -buffer ImportJsonDecode call s:import_as('Json.Decode', 'D')
command! -buffer ImportJsonDecodePipeline call s:import_as('Json.Decode.Pipeline', 'P')

" TODO for these functions:
" - Handle things like `ImportType Tier.Level` correctly (should give `import
"   Tier.Level exposing (Level)`)
" - Add similar functions for module exports (`exposing`)?
" - Handle importing visual selection

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

" Description {{{
"   Original by Shai Coleman, 2008-04-21.  http://colemak.com/
"   Modified by Esko, 2012-09-14.
"   Modified by agentlewis, 2017-08-06
"
"   Load dvorak.vim after all other Vim scripts.
"
"   Refer to ../README.markdown for keymap explanations.
" }}}
" Require Vim >=7.0 {{{
    if v:version < 700 | echohl WarningMsg | echo "dvorak.vim: You need Vim version 7.0 or later." | echohl None | finish | endif
" }}}
" Up/down/left/right {{{
    nnoremap h h|xnoremap h h|onoremap h h|
    nnoremap t j|xnoremap t j|onoremap t j|
    nnoremap n k|xnoremap n k|onoremap n k|
    nnoremap s l|xnoremap s l|onoremap s l|
" }}}
" Words forward/backward {{{
    " g/G = back word/WORD
    " c/C = end of word/WORD
    " r/R = forward word/WORD
    nnoremap g b|xnoremap g b|onoremap g b|
    nnoremap G B|xnoremap G B|onoremap G B|
    nnoremap r w|xnoremap r w|onoremap r w|
    nnoremap R W|xnoremap R W|onoremap R W| 
    nnoremap l e|xnoremap l e|onoremap l e|
    nnoremap L E|xnoremap L E|onoremap L E|
    cnoremap <C-G> <C-Left>
    cnoremap <C-R> <C-Right>
" }}}
" Command {{{
    nnoremap b g|xnoremap b g|onoremap b g|
    nnoremap B G|xnoremap B G|onoremap B G|
" }}}
" inSert/Replace/append (T) {{{
    nnoremap e s|
    nnoremap E S|
" }}}
" Change {{{
    nnoremap p c|xnoremap p c|
    nnoremap P C|xnoremap P C|
    nnoremap pp cc|
" }}}
" Cut/copy/paste {{{
    nnoremap x x|xnoremap x d|
    nnoremap j y|xnoremap j y|
    nnoremap k p|xnoremap k p|
    nnoremap X dd|xnoremap X d|
    nnoremap J yy|xnoremap J y|
    nnoremap K P|xnoremap K P|
    nnoremap bk gp|xnoremap bk gp|
    nnoremap bK gP|xnoremap bK gP|
" }}}
" Undo/redo {{{
    nnoremap z u|xnoremap z :<C-U>undo<CR>|
    nnoremap gz U|xnoremap gz :<C-U>undo<CR>|
    nnoremap Z <C-R>|xnoremap Z :<C-U>redo<CR>|
    nnoremap c r|xnoremap c r|onoremap c r|
    nnoremap C R|xnoremap C R|onoremap C R|
" }}}
" Visual mode {{{
    " Make insert/add work also in visual line mode like in visual block mode
    xnoremap <silent> <expr> i (mode() =~# "[V]" ? "\<C-V>0o$I" : "I")
    xnoremap <silent> <expr> I (mode() =~# "[V]" ? "\<C-V>0o$I" : "I")
    xnoremap <silent> <expr> a (mode() =~# "[V]" ? "\<C-V>0o$A" : "A")
    xnoremap <silent> <expr> A (mode() =~# "[V]" ? "\<C-V>0o$A" : "A")
" }}}
" Search {{{
    " f/F are unchanged
    nnoremap y t|xnoremap y t|onoremap y t|
    nnoremap Y T|xnoremap Y T|onoremap Y T|
    nnoremap w ;|xnoremap w ;|onoremap w ;|
    nnoremap W ,|xnoremap W ,|onoremap W ,|
" }}}
" Overridden keys must be prefixed with g {{{
    nnoremap bX X|xnoremap bX X|
    nnoremap bK K|xnoremap bK K|
    nnoremap bL L|xnoremap bL L|
" }}}
" Window handling {{{
    nnoremap <C-P>h <C-P>h|xnoremap <C-P>h <C-P>h|
    nnoremap <C-P>t <C-P>j|xnoremap <C-P>t <C-P>j|
    nnoremap <C-P>n <C-P>k|xnoremap <C-P>n <C-P>k|
    nnoremap <C-P>s <C-P>l|xnoremap <C-P>s <C-P>l|
" }}}

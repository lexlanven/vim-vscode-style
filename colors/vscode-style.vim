" -----------------------------------------------------------------------------
"  VSCode-Style Colorscheme for Vim / Neovim
" -----------------------------------------------------------------------------
"  Description:  A colorscheme inspired by Visual Studio Code
"  Author:       Alexander Lanven
"  License:      MIT
" -----------------------------------------------------------------------------

scriptencoding utf-8

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="vscode-style"

" Highlight function
fun! <sid>hi(group, fg, bg, attr)
  if !empty(a:fg)
    exec "hi " . a:group . " guifg=" . a:fg.gui . " ctermfg=" . a:fg.cterm256
  endif
  if !empty(a:bg)
    exec "hi " . a:group . " guibg=" . a:bg.gui . " ctermbg=" . a:bg.cterm256
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
endfun

" Style options
if !exists("g:vscode_transparent")
    let g:vscode_transparent=1
endif
if !exists("g:vscode_modern")
    let g:vscode_modern=0
endif
if !exists("g:vscode_italics")
    let g:vscode_italics=0
endif

" Color definitions
let s:cdNone = {'gui': 'NONE', 'cterm256': 'NONE'}
let s:cdFront = {'gui': '#D4D4D4', 'cterm256': '188'}
let s:cdBack = {'gui': '#1E1E1E', 'cterm256': '234'}
if g:vscode_modern | let s:cdBack = {'gui': '#1f1f1f', 'cterm256': '234'} | endif
if g:vscode_transparent | let s:cdBack = {'gui': 'NONE', 'cterm256': 'NONE'} | endif
let s:cdBlue = {'gui': '#569CD6', 'cterm256': '75'}
let s:cdLightBlue = {'gui': '#9CDCFE', 'cterm256': '117'}
let s:cdGreen = {'gui': '#6A9955', 'cterm256': '65'}
let s:cdLightGreen = {'gui': '#B5CEA8', 'cterm256': '151'}
let s:cdRed = {'gui': '#F44747', 'cterm256': '203'}
if g:vscode_modern | let s:cdRed = {'gui': '#f85149', 'cterm256': '203'} | endif
let s:cdOrange = {'gui': '#CE9178', 'cterm256': '173'}
let s:cdYellow = {'gui': '#DCDCAA', 'cterm256': '187'}
let s:cdPink = {'gui': '#C586C0', 'cterm256': '176'}
let s:cdLineNumber = {'gui': '#5A5A5A', 'cterm256': '240'}
let s:cdCursorDark = {'gui': '#51504F', 'cterm256': '239'}
let s:cdCursorLight = {'gui': '#AEAFAD', 'cterm256': '145'}
let s:cdSelection = {'gui': '#264F78', 'cterm256': '24'}

" UI settings
call <sid>hi('Normal', s:cdFront, s:cdBack, 'none')
call <sid>hi('Cursor', s:cdCursorDark, s:cdCursorLight, 'none')
call <sid>hi('CursorLine', {}, s:cdBack, 'none')
call <sid>hi('LineNr', s:cdLineNumber, s:cdBack, 'none')
call <sid>hi('Visual', s:cdNone, s:cdSelection, 'none')
call <sid>hi('Search', s:cdNone, s:cdSelection, 'none')
call <sid>hi('StatusLine', s:cdFront, s:cdBack, 'none')
call <sid>hi('StatusLineNC', s:cdLineNumber, s:cdBack, 'none')
call <sid>hi('Pmenu', s:cdFront, s:cdBack, 'none')
call <sid>hi('PmenuSel', s:cdFront, s:cdSelection, 'none')
call <sid>hi('ErrorMsg', s:cdRed, s:cdBack, 'none')
call <sid>hi('WarningMsg', s:cdOrange, s:cdBack, 'none')

" Git and diff settings
call <sid>hi('DiffAdd', s:cdFront, s:cdLightGreen, 'none')
call <sid>hi('DiffChange', s:cdFront, s:cdBlue, 'none')
call <sid>hi('DiffDelete', s:cdFront, s:cdRed, 'none')
hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffRemoved DiffDelete
if g:vscode_italics | call <sid>hi('Comment', s:cdGreen, {}, 'italic') | else | call <sid>hi('Comment', s:cdGreen, {}, 'none') | endif

" Syntax groups
call <sid>hi('Constant', s:cdBlue, {}, 'none')
call <sid>hi('String', s:cdOrange, {}, 'none')
call <sid>hi('Number', s:cdLightGreen, {}, 'none')
call <sid>hi('Boolean', s:cdBlue, {}, 'none')
call <sid>hi('Identifier', s:cdLightBlue, {}, 'none')
call <sid>hi('Function', s:cdYellow, {}, 'none')
call <sid>hi('Statement', s:cdPink, {}, 'none')
call <sid>hi('Keyword', s:cdPink, {}, 'none')
call <sid>hi('PreProc', s:cdPink, {}, 'none')
call <sid>hi('Type', s:cdBlue, {}, 'none')
call <sid>hi('Special', s:cdYellow, {}, 'none')
call <sid>hi('Error', s:cdRed, s:cdBack, 'undercurl')
call <sid>hi('Todo', s:cdYellow, s:cdBack, 'bold')

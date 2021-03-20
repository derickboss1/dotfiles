" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "customlight"
set termguicolors

" vim: sw=2
let s:white = ['#eeeeee', '231']
let s:darkred = ['#af0000', '124']
let s:turquoise = ['#00a979', '36']
let s:green = ['#008700', '28']
let s:teal = ['#56b6c2', '73']
let s:darkgrey = ['#878787', '102']
let s:lightblue = ['#03b9d5', '38']
let s:black = ['#444444', '59']
let s:grey = ['#bcbcbc', '145']
let s:red = ['#d70000', '160']
let s:purple = ['#a626a4', '127']
let s:darkblue = ['#005faf', '25']
let s:orange = ['#d75f00', '166']
let s:yellow = ['#c69000', '172']
let s:highlightyellow=['#f4e900', '220']
let s:blue = ['#0787a9', '31']
let s:purpleblue = ['#4078f2', '69']

let s:bold='bold'
let s:italic='italic'
let s:none='NONE'
let s:undercurl='undercurl'
let s:underline='underline'

" {{{ highlight function
function! <sid>hi(group, fg, bg, attr, attrsp)
  " fg, bg, attr, attrsp
  if !empty(a:fg)
    exec "hi " . a:group . " guifg=" .  a:fg[0]
    exec "hi " . a:group . " ctermfg=" . a:fg[1]
  endif
  if !empty(a:bg)
    exec "hi " . a:group . " guibg=" .  a:bg[0]
    exec "hi " . a:group . " ctermbg=" . a:bg[1]
  endif
  if !empty(a:attr)
    exec "hi " . a:group . " gui=" .   a:attr
    exec "hi " . a:group . " cterm=" . a:attr
  endif
  if !empty(a:attrsp)
    exec "hi " . a:group . " guisp=" . a:attrsp[0]
  endif
endfunction
"}}}


" {{{ call s::hi(group, fg, bg, gui, guisp)
  call s:hi('Bold', '', '', s:bold, '')
  call s:hi('Debug', s:darkred, '', '', '')
  call s:hi('Directory', s:darkblue, '', '', '')
  call s:hi('ErrorMsg', s:darkred, s:white, '', '')
  call s:hi('Exception', s:darkred, '', '', '')
  call s:hi('FoldColumn', s:purpleblue, s:white, '', '')
  call s:hi('Folded', s:darkgrey, s:grey, s:italic, '')
  call s:hi('IncSearch', s:darkred, s:orange, s:none, '')
  call s:hi('Italic', '', '', s:italic, '')
 
  call s:hi('Macro', s:darkred, '', '', '')
  call s:hi('MatchParen', '', s:grey, '', '')
  call s:hi('ModeMsg', s:green, '', '', '')
  call s:hi('MoreMsg', s:green, '', '', '')
  call s:hi('Question', s:purpleblue, '', '', '')
  call s:hi('Search', '', s:highlightyellow, '', '')
  call s:hi('SpecialKey', s:green, '', '', '')
  call s:hi('TooLong', s:darkred, '', '', '')
  call s:hi('Underlined', s:darkred, '', '', '')
  call s:hi('Visual', s:white, s:blue, '', '')
  call s:hi('VisualNOS', s:darkred, '', '', '')
  call s:hi('WarningMsg', s:darkred, '', '', '')
  call s:hi('WildMenu', s:black, s:purpleblue, '', '')
  call s:hi('Title', s:purpleblue, '', '', '')
  call s:hi('Conceal', s:purpleblue, s:white, '', '')
  call s:hi('Cursor', s:white, s:black, '', '')
  call s:hi('NonText', s:green, '', '', '')
  call s:hi('Normal', s:black, '' , '', '')
  call s:hi('EndOfBuffer', s:black, '', '', '')
  call s:hi('LineNr', s:darkgrey, '' , '', '')
  call s:hi('SignColumn', s:white, s:white, '', '')
  call s:hi('StatusLine', s:darkred, s:green, '', '')
  call s:hi('StatusLineNC', s:black, s:darkred, '', '')
  call s:hi('VertSplit', s:white, s:black, '', '')
  call s:hi('ColorColumn', '', s:darkgrey, '', '')
  call s:hi('CursorColumn', '', s:darkgrey, '', '')
  call s:hi('CursorLine', '', s:white, s:none, '')
  call s:hi('CursorLineNR', s:white, s:white, '', '')
  call s:hi('CursorLineNr', s:yellow, s:white, '', '')
  call s:hi('PMenu', '', s:grey, '', '')
  call s:hi('PMenuSel', s:black, s:purpleblue, '', '')
  call s:hi('PmenuSbar', '', s:turquoise, '', '')
  call s:hi('PmenuThumb', '', s:black, '', '')
  call s:hi('TabLine', s:green, s:darkred, '', '')
  call s:hi('TabLineFill', s:green, s:darkred, '', '')
  call s:hi('TabLineSel', s:green, s:darkred, '', '')
  call s:hi('helpExample', s:yellow, '', '', '')
  call s:hi('helpCommand', s:yellow, '', '', '')
 
  " Standard syntax highlighting
  call s:hi('Boolean', s:orange, '', '', '')
  call s:hi('Character', s:darkred, '', '', '')
  call s:hi('Comment', s:darkgrey, '', s:italic, '')
  call s:hi('Conditional', s:purple, '', '', '')
  call s:hi('Constant', s:orange, '', '', '')
  call s:hi('Define', s:purple, '', '', '')
  call s:hi('Delimiter', s:purpleblue, '', '', '')
  call s:hi('Float', s:orange, '', '', '')
  call s:hi('Function', s:purpleblue, '', '', '')
 
  call s:hi('Identifier', s:lightblue, '', '', '')
  call s:hi('Include', s:purpleblue, '', '', '')
  call s:hi('Keyword', s:purple, '', '', '')
 
  call s:hi('Label', s:yellow, '', '', '')
  call s:hi('Number', s:orange, '', '', '')
  call s:hi('Operator', s:black, '', '', '')
  call s:hi('PreProc', s:darkblue, '', '', '')
  call s:hi('Repeat', s:yellow, '', '', '')
  call s:hi('Special', s:blue, '', '', '')
  call s:hi('SpecialChar', s:turquoise, '', '', '')
  call s:hi('Statement', s:purple, '', s:none, '')
  call s:hi('StorageClass', s:yellow, '', '', '')
  call s:hi('String', s:green, '', '', '')
  call s:hi('Structure', s:purple, '', '', '')
  call s:hi('Tag', s:yellow, '', '', '')
  call s:hi('Todo', s:green, s:white, s:bold, '')
  call s:hi('Type', s:darkblue, '', s:none, '')
  call s:hi('Typedef', s:yellow, '', '', '')
 
  " LSP
  call s:hi('LspDiagnosticsDefaultError', '', '', '', '')
  call s:hi('LspDiagnosticsSignError', s:darkred, '', '', '')
  call s:hi('LspDiagnosticsUnderlineError', '', '', s:undercurl, '')
 
  call s:hi('LspDiagnosticsDefaultWarning', '', '', '', '')
  call s:hi('LspDiagnosticsSignWarning', s:yellow, '', '', '')
  call s:hi('LspDiagnosticsUnderlineWarning', '', '', s:undercurl, '')
 
  call s:hi('LspDiagnosticsDefaultInformation', '', '', '', '')
  call s:hi('LspDiagnosticsSignInformation', s:purpleblue, '', '', '')
  call s:hi('LspDiagnosticsUnderlineInformation', '', '', s:undercurl, '')
 
  call s:hi('LspDiagnosticsDefaultHint', '', '', '', '')
  call s:hi('LspDiagnosticsSignHint', s:blue, '', '', '')
  call s:hi('LspDiagnosticsUnderlineHint', '', '', s:undercurl, '')
 
  " TreeSitter stuff
  call s:hi('TSInclude', s:blue, '', '', '')
  call s:hi('TSPunctBracket', s:blue, '', '', '')
  call s:hi('TSPunctDelimiter', s:black, '', '', '')
  call s:hi('TSParameter', s:black, '', '', '')
  call s:hi('TSType', s:purpleblue, '', '', '')
  call s:hi('TSFunction', s:blue, '', '', '')
 
  call s:hi('TSTagDelimiter', s:blue, '', '', '')
  call s:hi('TSProperty', s:yellow, '', '', '')
  call s:hi('TSMethod', s:purpleblue, '', '', '')
  call s:hi('TSParameter', s:yellow, '', '', '')
  call s:hi('TSConstructor', s:black, '', '', '')
  call s:hi('TSVariable', s:black, '', '', '')
  call s:hi('TSOperator', s:black, '', '', '')
  call s:hi('TSTag', s:black, '', '', '')
  call s:hi('TSKeyword', s:purple, '', '', '')
  call s:hi('TSKeywordOperator', s:purple, '', '', '')
  call s:hi('TSVariableBuiltin', s:darkred, '', '', '')
  call s:hi('TSLabel', s:blue, '', '', '')
 
  call s:hi('SpellBad', '', '', s:undercurl, '')
  call s:hi('SpellLocal', '', '', s:undercurl, '')
  call s:hi('SpellCap', '', '', s:undercurl, '')
  call s:hi('SpellRare', '', '', s:undercurl, '')
 
  call s:hi('csClass', s:yellow, '', '', '')
  call s:hi('csAttribute', s:yellow, '', '', '')
  call s:hi('csModifier', s:purple, '', '', '')
  call s:hi('csType', s:darkred, '', '', '')
  call s:hi('csUnspecifiedStatement', s:purpleblue, '', '', '')
  call s:hi('csContextualStatement', s:purple, '', '', '')
  call s:hi('csNewDecleration', s:darkred, '', '', '')
  call s:hi('cOperator', s:blue, '', '', '')
  call s:hi('cPreCondit', s:purple, '', '', '')
 
  call s:hi('cssColor', s:blue, '', '', '')
  call s:hi('cssBraces', s:black, '', '', '')
  call s:hi('cssClassName', s:purple, '', '', '')
 
 
  call s:hi('DiffAdd', s:green, s:darkred, s:bold, '')
  call s:hi('DiffChange', s:green, s:darkred, '', '')
  call s:hi('DiffDelete', s:darkred, s:darkred, '', '')
  call s:hi('DiffText', s:purpleblue, s:darkred, '', '')
  call s:hi('DiffAdded', s:black, s:green, s:bold, '')
  call s:hi('DiffFile', s:darkred, s:white, '', '')
  call s:hi('DiffNewFile', s:green, s:white, '', '')
  call s:hi('DiffLine', s:purpleblue, s:white, '', '')
  call s:hi('DiffRemoved', s:black, s:darkred, s:bold, '')
 
  call s:hi('gitCommitOverflow', s:darkred, '', '', '')
  call s:hi('gitCommitSummary', s:green, '', '', '')
 
  call s:hi('htmlBold', s:yellow, '', '', '')
  call s:hi('htmlItalic', s:purple, '', '', '')
  call s:hi('htmlTag', s:blue, '', '', '')
  call s:hi('htmlEndTag', s:blue, '', '', '')
  call s:hi('htmlArg', s:yellow, '', '', '')
  call s:hi('htmlTagName', s:black, '', '', '')
 
  call s:hi('javaScript', s:black, '', '', '')
  call s:hi('javaScriptNumber', s:orange, '', '', '')
  call s:hi('javaScriptBraces', s:black, '', '', '')
 
  call s:hi('jsonKeyword', s:green, '', '', '')
  call s:hi('jsonQuote', s:green, '', '', '')
 
  call s:hi('markdownCode', s:green, '', '', '')
  call s:hi('markdownCodeBlock', s:green, '', '', '')
  call s:hi('markdownHeadingDelimiter', s:purpleblue, '', '', '')
  call s:hi('markdownItalic', s:purple, '', s:italic, '')
  call s:hi('markdownBold', s:yellow, '', s:bold, '')
  call s:hi('markdownCodeDelimiter', s:turquoise, '', s:italic, '')
  call s:hi('markdownError', s:black, s:white, '', '')
 
  call s:hi('typescriptParens', s:black, '', '', '')
 
  call s:hi('NeomakeErrorSign', s:darkred, s:white, '', '')
  call s:hi('NeomakeWarningSign', s:yellow, s:white, '', '')
  call s:hi('NeomakeInfoSign', s:white, s:white, '', '')
  call s:hi('NeomakeError', s:darkred, '', s:underline, s:darkred)
  call s:hi('NeomakeWarning', s:darkred, '', s:underline, s:darkred)
 
  call s:hi('ALEErrorSign', s:darkred,s:white, s:bold, '')
  call s:hi('ALEWarningSign', s:yellow, s:white, s:bold, '')
  call s:hi('ALEInfoSign', s:white, s:white, s:bold, '')
 
  call s:hi('NERDTreeExecFile', s:black, '', '', '')
  call s:hi('NERDTreeDirSlash', s:purpleblue, '', '', '')
  call s:hi('NERDTreeOpenable', s:purpleblue, '', '', '')
  call s:hi('NERDTreeFile', '', '', '', '')
  call s:hi('NERDTreeFlags', s:purpleblue, '', '', '')
 
  call s:hi('phpComparison', s:black, '', '', '')
  call s:hi('phpParent', s:black, '', '', '')
  call s:hi('phpMemberSelector', s:black, '', '', '')
 
  call s:hi('pythonRepeat', s:purple, '', '', '')
  call s:hi('pythonOperator', s:purple, '', '', '')
 
  call s:hi('rubyConstant', s:yellow, '', '', '')
  call s:hi('rubySymbol', s:green, '', '', '')
  call s:hi('rubyAttribute', s:purpleblue, '', '', '')
  call s:hi('rubyInterpolation', s:green, '', '', '')
  call s:hi('rubyInterpolationDelimiter', s:turquoise, '', '', '')
  call s:hi('rubyStringDelimiter', s:green, '', '', '')
  call s:hi('rubyRegexp', s:blue, '', '', '')
 
  call s:hi('sassidChar', s:darkred, '', '', '')
  call s:hi('sassClassChar', s:orange, '', '', '')
  call s:hi('sassInclude', s:purple, '', '', '')
  call s:hi('sassMixing', s:purple, '', '', '')
  call s:hi('sassMixinName', s:purpleblue, '', '', '')
 
  call s:hi('vimfilerLeaf', s:black, '', '', '')
  call s:hi('vimfilerNormalFile', s:black, s:white, '', '')
  call s:hi('vimfilerOpenedFile', s:purpleblue, '', '', '')
  call s:hi('vimfilerClosedFile', s:purpleblue, '', '', '')
 
  call s:hi('GitGutterAdd', s:green, s:white, s:bold, '')
  call s:hi('GitGutterChange', s:purpleblue, s:white, s:bold, '')
  call s:hi('GitGutterDelete', s:darkred, s:white, s:bold, '')
  call s:hi('GitGutterChangeDelete', s:purple, s:white, s:bold, '')
 
  call s:hi('SignifySignAdd', s:green, s:white, s:bold, '')
  call s:hi('SignifySignChange', s:purpleblue, s:white, s:bold, '')
  call s:hi('SignifySignDelete', s:darkred, s:white, s:bold, '')
  call s:hi('SignifySignChangeDelete', s:purple, s:white, s:bold, '')
  call s:hi('SignifySignDeleteFirstLine', s:darkred, s:white, s:bold, '')
 
  call s:hi('xmlTag', s:blue, '', '', '')
  call s:hi('xmlTagName', s:black, '', '', '')
  call s:hi('xmlEndTag', s:blue, '', '', '')
  call s:hi('Defx_filename_directory', s:purpleblue, '', '', '')
 
  call s:hi('CocErrorSign', s:darkred, '', '', '')
  call s:hi('CocWarningSign', s:yellow, '', '', '')
  call s:hi('CocInfoSign', s:purpleblue, '', '', '')
  call s:hi('CocHintSign', s:blue, '', '', '')
  call s:hi('CocErrorFloat', s:darkred, '', '', '')
  call s:hi('CocWarningFloat', s:yellow, '', '', '')
  call s:hi('CocInfoFloat', s:purpleblue, '', '', '')
  call s:hi('CocHintFloat', s:blue, '', '', '')
  call s:hi('CocDiagnosticsError', s:darkred, '', '', '')
  call s:hi('CocDiagnosticsWarning', s:yellow, '', '', '')
  call s:hi('CocDiagnosticsInfo', s:purpleblue, '', '', '')
  call s:hi('CocDiagnosticsHint', s:blue, '', '', '')
  call s:hi('CocSelectedText', s:purple, '', '', '')
  call s:hi('CocCodeLens', s:teal, '', '', '')
" }}}
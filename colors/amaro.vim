highlight clear
if exists("syntax_on")
  syntax reset
endif

set background=dark
set colorcolumn=80

let g:colors_name="amaro"

" colors {{{
let s:black = "#000000"
let s:liver = "#5b4849"
let s:old_burgundy = "#453637"
let s:black_coffee = "#403233"
let s:slightly_blacker_coffee "#392d2e"
let s:raisin_black = "#2b2222"
let s:light_gray = "#dbd1d1"
let s:platinum = "#ebe5e5"
let s:new_york_pink = "#d68585"
let s:candy_pink = "#e67575"
let s:ocean_green = "#6bbf8e"
let s:medium_aquamarine = "#70d298"
let s:cadet_blue = "#63a7b0"
let s:sky_blue_crayola = "#3cc5d7"
let s:turquoise_green = "#98d9c2"
let s:aquamarine = "#7ef1c9"
let s:lilac = "#cfa9d4"
let s:bright_lilac = "#de97e7"
let s:light_orange = "#f6cda2"
let s:mellow_apricot = "#ffc180"
" }}}

"variables {{{
" fg color variables {{{
let s:foreground = s:light_gray
let s:foreground_alt = s:platinum
let s:muted = s:liver
" }}}

" bg color variables {{{
let s:background = s:black_coffee
let s:bg_light = s:old_burgundy
let s:bg_barely_darker = s:slightly_blacker_coffee
let s:bg_dark = s:raisin_black
" let s:cursor = s:super_cyan
" }}}

" syntax color variables {{{
let s:keyword = s:ocean_green
let s:keyword_alt = s:medium_aquamarine
let s:string = s:new_york_pink
let s:string_alt = s:candy_pink
let s:accent_1 = s:light_orange
let s:accent_1_alt = s:mellow_apricot
let s:accent_2 = s:lilac
let s:accent_2_alt = s:bright_lilac
let s:accent_3 = s:turquoise_green
let s:accent_3_alt = s:aquamarine
" }}}

" misc color variables {{{
let s:selected = s:black
let s:invisibles = s:black
let s:alert = "#d72862"
let s:warning = "#f6b961"
let s:success = "#00aa7b"
let s:info = "#0095aa"
" }}}
" }}}

function! s:create_highlight(group, style)
  execute "highlight" a:group
    \ "guifg=" (has_key(a:style, "fg") ? a:style.fg : "NONE")
    \ "guibg=" (has_key(a:style, "bg") ? a:style.bg : "NONE")
    \ "guisp=" (has_key(a:style, "sp") ? a:style.sp : "NONE")
    \ "gui=" (has_key(a:style, "gui") ? a:style.gui : "NONE")
endfunction

" popup menu {{{
call s:create_highlight("Pmenu", { "fg": s:foreground,"bg": s:bg_dark })
call s:create_highlight("PmenuThumb", { "bg": s:muted })
call s:create_highlight("PmenuSBar", { "bg": s:bg_light })
call s:create_highlight("PmenuSel", { "fg": s:keyword_alt, "bg": s:bg_dark,"gui": "bold" })
" }}}

" spelling {{{
call s:create_highlight("SpellBad", { "sp": s:warning, "gui": "undercurl" })
hi! link SpellCap Normal
hi! link SpellRare Normal
hi! link SpellLocal Normal
" }}}

" editor {{{
call s:create_highlight("ColorColumn", { "bg": s:bg_barely_darker })
call s:create_highlight("MatchParen",  { "fg": s:background, "bg": s:muted })
call s:create_highlight("Visual", { "bg": s:selected })

call s:create_highlight("IncSearch", { "gui": "reverse" })
call s:create_highlight("Search", { "gui": "bold,underline" })
hi! link WildMenu IncSearch

call s:create_highlight("StatusLine", { "fg": s:foreground, "bg": s:background })
call s:create_highlight("StatusLineNC", { "fg": s:muted })
call s:create_highlight("TabLine", { "fg": s:muted })
call s:create_highlight("TabLineSel", { "fg": s:foreground, "gui": "bold" })

call s:create_highlight("LineNr", { "fg": s:foreground_alt, "bg": s:bg_dark })
call s:create_highlight("CursorLine", { "bg": s:background })
call s:create_highlight("CursorLineNr", { "fg": s:accent_1_alt, "bg": s:bg_dark, "gui": "bold" })
call s:create_highlight("VertSplit", { "fg": s:background, "bg": s:background })
call s:create_highlight("Folded", { "fg": s:accent_2, "bg": s:bg_barely_darker })
call s:create_highlight("FoldColumn", { "fg": s:accent_2,"bg": s:bg_dark })
" call s:create_highlight("SignColumn", { "fg": s:orange,"bg": s:red })
hi! link TabLineFill StatusLineNC
hi! link SignColumn LineNr

call s:create_highlight("Title", { "fg": s:accent_3, "gui": "bold" })
call s:create_highlight("ErrorMsg", { "fg": s:alert })
call s:create_highlight("WarningMsg", { "fg": s:warning })
call s:create_highlight("MoreMsg", { "fg": s:info })
hi! link Question MoreMsg
hi! link ModeMsg MoreMsg

call s:create_highlight("QfError", { "fg": s:alert, "bg": s:bg_dark })

call s:create_highlight("DiffAdd", { "bg": s:success })
call s:create_highlight("DiffChange", { "bg": s:warning })
call s:create_highlight("DiffDelete", { "fg": s:alert })
call s:create_highlight("DiffText", { "bg": s:info })
" }}}

" NERDTree {{{
call s:create_highlight("Directory", { "fg": s:accent_3_alt })

call s:create_highlight("NERDTreeDirSlash", { "fg": s:accent_3 })
hi! link NERDTreeOpenable NERDTreeDirSlash
hi! link NERDTreeClosable NERDTreeDirSlash
" }}}

" general highlighting rules {{{
call s:create_highlight("Normal", { "fg": s:foreground, "bg": s:background })
call s:create_highlight("NonText", { "fg": s:invisibles })
hi! link SpecialKey NonText

call s:create_highlight("String", { "fg": s:string })
hi! link Character String

call s:create_highlight("Number", { "fg": s:accent_1 })
hi! link Float Number
hi! link Boolean Number
hi! link Constant Number

call s:create_highlight("Keyword", { "fg": s:keyword })
hi! link Statement Keyword
hi! link Conditional Keyword
hi! link Repeat Keyword
hi! link Label Keyword

call s:create_highlight("Exception", { "fg": s:accent_3 })
hi! link PreProc Exception

call s:create_highlight("Comment", { "fg": s:muted, "gui": "italic" })
hi! link SpecialComment Comment
hi! link Delimeter Comment

call s:create_highlight("Operator", { "fg": s:foreground_alt })
hi! link Special Operator

call s:create_highlight("Type", { "fg": s:accent_3_alt })
hi! link Function Type

call s:create_highlight("Todo", { "gui": "reverse" })

hi! link Identifier Normal
hi! link Underlined Normal
" }}}

" typescript {{{
call s:create_highlight("TypescriptImport", { "fg": s:accent_2 })
hi! link TypescriptExport TypescriptImport

hi! link TypescriptTypeReference Type
hi! link TypescriptVariable Keyword
hi! link TypescriptTypeBrackets Exception
hi! link TypescriptGlobal Number
hi! link TypescriptBraces Normal
hi! link TypescriptAsyncFuncKeyword Number
hi! link TypescriptMember Normal
hi! link TypescriptObjectLabel Operator
hi! link TypescriptObjectLiteral Normal
hi! link TypescriptTry Number
hi! link TypescriptExceptions TypescriptTry
" }}}

" ALE {{{
call s:create_highlight("ALEError", { "fg": s:alert, "bg": s:background, "gui": "bold" })
call s:create_highlight("ALEErrorSign", { "fg": s:alert, "bg": s:bg_dark, "gui": "bold" })
call s:create_highlight("ALEWarning", { "fg": s:warning, "gui": "bold" })
hi! link ALEWarningSign ALEWarning
" }}}

" git gutter {{{
call s:create_highlight("GitGutterAdd", { "fg": s:success, "bg": s:bg_dark })
call s:create_highlight("GitGutterDelete", { "fg": s:alert, "bg": s:bg_dark })
call s:create_highlight("GitGutterChange", { "fg": s:warning, "bg": s:bg_dark })
call s:create_highlight("GitGutterChangeDelete", { "fg": s:info, "bg": s:bg_dark })
" }}}

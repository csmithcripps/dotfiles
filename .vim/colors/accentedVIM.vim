" Vim color scheme
"
" Name:         accentedVim.vim
" Author:       Cody SmithCripps
"
" Colour Scheme File, with functionality for easy editing 


set background=dark
hi clear
if exists("syntax_on")
	syntax reset
endif

let g:colors_name = "accentedVIM"



"VARSET:Colours
let s:olive         = 114
let s:pink          = 211
let s:purple        = 98 
let s:blue          = 26
let s:paleBlue      = 38
let s:white         = 15
let s:black         = 16
let s:grey          = 234
let s:brightPink    = 212

"VARSET: Standard Colors
        let s:stdFg     = s:white
        let s:stdBg     = s:black
        let s:accent    = s:paleBlue

"FUNCTION: Simpler colour setting
"   Param:
"       section: the highlight section to be edited
"       args(Optional):    Foreground Colour, Background Colour, term(??)
"                               set to 0 if you only want to change later
"                               values.
function! s:setSect(section, ...)
        let l:fgColour = get(a:, 1, 0)
        let l:bgColour = get(a:, 2, 0)
        let l:term     = get(a:, 3, 0)

        let l:expression = "highlight ". a:section

        if l:fgColour
                let l:expression = l:expression . " ctermfg=". l:fgColour
        endif
        if l:bgColour
                let l:expression = l:expression . " ctermbg=". l:bgColour
        endif
        if l:term
                let l:expression = l:expression . " cterm=none"
        endif
        
        execute l:expression 
endfunction

"HIGHLIGHT_DECLARATIONS: Editor Colours
"   Normal:     Main Window Colours
        call s:setSect("Normal",s:white,s:black)

"   Cursor:     Current Cursor Position
        call s:setSect('Cursor',s:black,s:white)

"   CursorLine: Shows Cursor Position
        call s:setSect('CursorLine',0,s:grey, 1)

"   LineNr:     The colours of the line number bar
        call s:setSect('LineNr',s:accent, s:grey)
        call s:setSect('CursorLineNr',s:grey, s:accent)
"   Visual:     Visual Mode Highlighting
        call s:setSect('Visual',0,236)

"   Tabline:    Top Bar.
        call s:setSect('Tabline',s:grey,s:accent-1)
        call s:setSect('TablineFill',s:accent,s:grey)
        call s:setSect('TablineSel',s:accent,s:grey)

"   StatusBar: Bottom Bar
        call s:setSect('StatusLine',s:accent,s:grey)
        call s:setSect('Title', s:accent, s:grey)

"   ColorColumn:
        call s:setSect('ColorColumn', s:grey,s:accent)
        
"HIGHLIGHT_DECLARATIONS: Syntax Highlight (Comments are the sections that can
"                                           be editted, indenting represents
"                                           subsections)
"   Comment:	any comment
        call s:setSect("Comment",s:olive)

"	Constant:	any constant
        call s:setSect("Constant",s:pink)

"	    String:		a string constant: "This is a string"
            call s:setSect("String", s:olive)

"	    Character:	a character constant: 'c', '\n'
"	    Number:		a number constant: 234, 0xff
"	    Boolean:    a boolean constant: TRUE, false
"	    Float:		a floating point constant: 2.3e10

"	Identifier:	any variable name
        call s:setSect("Identifier", s:brightPink)

"	    Function:	function name (also: methods for classes)
            call s:setSect("Function", s:purple)

"	Statement:	any statement
        call s:setSect("Statement", s:paleBlue)

"	    Conditional:    if, then, else, endif, switch, etc.
"	    Repeat:	    	for, do, while, etc.
"	    Label:	    	case, default, etc.
"	    Operator:	    "sizeof", "+", "*", etc.
"	    Keyword:	    any other keyword
"	    Exception:  	try, catch, throw

"	PreProc:    	generic Preprocessor
        call s:setSect("PreProc",s:purple)

"	    Include:        preprocessor #include
"	    Define:	    	preprocessor #define
"	    Macro:  		same as Define
"	    PreCondit:	    preprocessor #if, #else, #endif, etc.

"	Type:		int, long, char, etc.
"	    StorageClass:	static, register, volatile, etc.
"	    Structure:	    struct, union, enum, etc.
"	    Typedef:        A typedef

"	Special:	any special symbol
        call s:setSect("Special", s:purple)

"	    SpecialChar:	special character in a constant
"	    Tag:		    you can use CTRL-] on this
"	    Delimiter:	    character that needs attention
"	    SpecialComment:	special things inside a comment
"	    Debug:		debugging statements

"	Underlined:	text that stands out, HTML links

"	Ignore:		left blank, hidden  |hl-Ignore|

"	Error:		any erroneous construct

"	Todo:		anything that needs extra attention; mostly the
"			        keywords TODO FIXME and XXX




"Diff colors
    highlight DiffAdd ctermbg=22
    highlight DiffChange ctermbg=17
    highlight DiffDelete ctermfg=Red ctermbg=52
    highlight DiffText ctermbg=17

"Indent guides
    highlight IndentGuidesOdd ctermbg=234
    highlight IndentGuidesEven ctermbg=235

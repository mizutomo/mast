" Vim syntax file
" Language:     MAST
" Maintainer:   Tomokatsu Mizukusa "mizukusa.tomokatsu@gmail.com"
" Last Change:  26/12/2012
" Comments:     MAST Launguage is designed to write mixes-signal hardware
" discription launguage by Synopsys.
"
" This is based on spectre.vim and verilog.vim

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" MAST syntax is case INsensitive
syn case ignore

syn keyword mastTodo contained TODO FIXME

syn keyword mastSpecialStatement control_section element equations parameters template values output state var
syn keyword mastStatement2 branch component enum external foreign group inf return simvar states string struc undef union unit dc_domain dc_done dc_init dc_start freq freq_domain freq_mag freq_phase next_time statistical time step_size time_domain time_init time_step_done tr_done tr_start abs acos acosh asin asinh atan atanh cos cosh d_dy_dt delay deschedule error event event_on expc instance len limexp ln log message random schedule_event schedule_next_time sin sinh sqrt tan tanh threshold union_type warning
syn keyword mastType electrical flow hyd_mks light magnetic pneumatic rotational rotational_ang rotational_vel thermal thermal_c nu thermal_k translational translational_pos logic_3 logic_4 ref val number pin
syn keyword mastConditional else if when then

" Numbers, all with engineering suffixes and optional units
"==========================================================
"floating point number, with dot, optional exponent
syn match mastNumber "\<[0-9]\+\.[0-9]*\(e[-+]\=[0-9]\+\)\=\(meg\=\|[afpnumkg]\)\="
"floating point number, starting with a dot, optional exponent
syn match mastNumber "\.[0-9]\+\(e[-+]\=[0-9]\+\)\=\(meg\=\|[afpnumkg]\)\="
"integer number with optional exponent
syn match mastNumber "\<[0-9]\+\(e[-+]\=[0-9]\+\)\=\(meg\=\|[afpnumkg]\)\="

" Misc
"=====

syn match mastStatement "^ \=\.\I\+"
syn region mastString start=+"+ skip=+\\"+ end=+"+
syn region mastComment start="#" end="$" contains=mastTodo
syn match mastOperator "[|&=><~*+-/(){}]"
syn match mastStatement "v("me=e-1
syn match mastStatement "i("me=e-1
syn match mastLabel "^[^#]\+:"

" TODO
"=====
" template FPGA Term1 Term2 = Para1, Para2
" という行があった時に、FPGA, Term*, Para*をそれぞれ色付けする。

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_mast_syntax_inits")
  if version < 508
    let did_mast_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink mastTodo             TODO
  HiLink mastConditional      Conditional
  HiLink mastStatement        Statement
  HiLink mastSpecialStatement Define
  HiLink mastStatement2       Keyword
  HiLink mastType             Type
  HiLink mastNumber           Number
  HiLink mastComment          Comment
  HiLink mastString           String
  HiLink mastOperator         Special
  HiLink mastLabel            Label

  delcommand HiLink
endif

let b:current_syntax = "mast"

" insert the following to $VIM/syntax/scripts.vim
" to autodetect HSpice netlists and text listing output:
"
" " Spice netlists and text listings
" elseif getline(1) =~ 'spectre\>' || getline("$") =~ '^\.end'
"   so <sfile>:p:h/spectre.vim

" vim: ts=4

" based on 
" https://github.com/liquidz/vim-iced
" commit: 2576a2ee06a768d03553d18182e7f5eeb73a2f6d

"" Commands {{{
command! -nargs=? Connect               call iced#nrepl#connect(<q-args>)
command!          Disconnect            call iced#nrepl#disconnect()
command!          Reconnect             call iced#nrepl#reconnect()
command!          Interrupt             call iced#nrepl#interrupt()
command! -nargs=? CljsRepl              call iced#nrepl#cljs#start_repl(<q-args>)
command! -nargs=+ -complete=custom,iced#nrepl#cljs#env_complete
\ StartCljsRepl    call iced#nrepl#cljs#start_repl_via_env(<f-args>)
command!          QuitCljsRepl          call iced#nrepl#cljs#stop_repl_via_env()
command!          CycleSession          call iced#nrepl#cljs#cycle_session()
command! -nargs=1 Eval                  call iced#nrepl#eval#code(<q-args>)
command! -nargs=1 EvalRepl              call iced#nrepl#eval#repl(<q-args>)
command!          EvalNs                call iced#nrepl#eval#ns()
command! -range   EvalVisual            call iced#nrepl#eval#visual()
command! -range   EvalReplVisual        call iced#nrepl#eval#repl_visual()
command!          Require               call iced#nrepl#ns#load_current_file()
command!          RequireAll            call iced#nrepl#ns#reload_all()
command! -nargs=? Undef                 call iced#nrepl#eval#undef(<q-args>)
command!          EvalOuterTopList      call iced#nrepl#eval#outer_top_list()
command!          PrintLast             call iced#nrepl#eval#print_last()
command!          MacroExpandOuterList  call iced#nrepl#macro#expand_outer_list()
command!          MacroExpand1OuterList call iced#nrepl#macro#expand_1_outer_list()
command!          TestNs                call iced#nrepl#test#ns()
command!          TestAll               call iced#nrepl#test#all()
command!          TestRedo              call iced#nrepl#test#redo()
command!          TestUnderCursor       call iced#nrepl#test#under_cursor()
command!          TestRerunLast         call iced#nrepl#test#rerun_last()
command! -nargs=? TestSpecCheck         call iced#nrepl#test#spec_check(<q-args>)
command!          TestBufferOpen        call iced#buffer#error#open()
command!          StdoutBufferOpen      call iced#buffer#stdout#open()
command!          StdoutBufferClear     call iced#buffer#stdout#clear()
command!          StdoutBufferClose     call iced#buffer#stdout#close()
command! -nargs=? DefJump               call iced#nrepl#navigate#jump_to_def(<q-args>)
command!          DefBack               call iced#nrepl#navigate#jump_back()
command! -nargs=1 -complete=custom,iced#nrepl#navigate#ns_complete
\ OpenNs                          call iced#nrepl#navigate#open_ns('e', <q-args>)
command! -nargs=? DocumentOpen          call iced#nrepl#document#open(<q-args>)
command! -nargs=? PopupDocumentOpen     call iced#nrepl#document#popup_open(<q-args>)
command!          FormDocument          call iced#nrepl#document#current_form()
command! -nargs=? UseCaseOpen           call iced#nrepl#document#usecase(<q-args>)
command!          NextUseCase           call iced#nrepl#document#next_usecase()
command!          PrevUseCase           call iced#nrepl#document#prev_usecase()
command!          DocumentClose         call iced#nrepl#document#close()
command! -nargs=? SourceShow            call iced#nrepl#source#show(<q-args>)
command! -nargs=? PopupSourceShow       call iced#nrepl#source#popup_show(<q-args>)
command!          CommandPalette        call iced#palette#show()
command! -nargs=? SpecForm              call iced#nrepl#spec#form(<q-args>)
command! -nargs=? SpecExample           call iced#nrepl#spec#example(<q-args>)
command! -nargs=? ClojureDocsOpen       call iced#clojuredocs#open(<q-args>)
command!          ClojureDocsRefresh    call iced#clojuredocs#refresh()
command!          Slurp                 call iced#paredit#deep_slurp()
command!          Barf                  call iced#paredit#barf()
command!          Format                call iced#format#form()
command!          ToggleSrcAndTest      call iced#nrepl#navigate#toggle_src_and_test()
command! -nargs=? Grep                  call iced#grep#exe(<q-args>)
command!          BrowseRelatedNamespace call iced#nrepl#navigate#related_ns()
command!          BrowseSpec             call iced#nrepl#spec#list()
command!          BrowseTestUnderCursor  call iced#nrepl#navigate#test()
command!          BrowseReferences       call iced#nrepl#navigate#browse_references()
command!          BrowseDependencies     call iced#nrepl#navigate#browse_dependencies()
command! -nargs=? BrowseVarReferences    call iced#nrepl#navigate#browse_var_references(<q-args>)
command! -nargs=? BrowseVarDependencies  call iced#nrepl#navigate#browse_var_dependencies(<q-args>)
command!          ClearCtrlpCache        call ctrlp#iced#cache#clear()
command!          CleanNs               call iced#nrepl#refactor#clean_ns()
command! -nargs=? AddMissing            call iced#nrepl#refactor#add_missing_ns(<q-args>)
command! -nargs=? AddNs                 call iced#nrepl#refactor#add_ns(<q-args>)
command!          ThreadFirst           call iced#nrepl#refactor#thread_first()
command!          ThreadLast            call iced#nrepl#refactor#thread_last()
command!          ExtractFunction       call iced#nrepl#refactor#extract_function()
command!          AddArity              call iced#nrepl#refactor#add_arity()
command!          MoveToLet             call iced#let#move_to_let()
command           ListTapped            call iced#nrepl#debug#list_tapped()
command           ClearTapped           call iced#nrepl#debug#clear_tapped()
command! -nargs=1 -complete=custom,iced#nrepl#debug#complete_tapped
\ BrowseTapped                    call iced#nrepl#debug#browse_tapped(<q-args>)
command! -nargs=? ToggleTraceVar        call iced#nrepl#trace#toggle_var(<q-args>)
command! -nargs=? ToggleTraceNs         call iced#nrepl#trace#toggle_ns(<q-args>)
command!          InReplNs              call iced#nrepl#ns#in_repl_session_ns()
command!          LintCurrentFile       call iced#lint#current_file()
command!          LintToggle            call iced#lint#toggle()
command!          JumpToNextSign        call iced#sign#jump_to_next()
command!          JumpToPrevSign        call iced#sign#jump_to_prev()
command!          JumpToLet             call iced#let#jump_to_let()
"" }}}

""  mappings {{{

"silent! nmap <buffer> <Leader>' <Plug>(iced_connect)

"" Evaluating (<Leader>e)
"" ------------------------------------------------------------------------
"silent! nmap <buffer> <Leader>eq <Plug>(iced_interrupt)
"silent! nmap <buffer> <Leader>ei <Plug>(iced_eval)<Plug>(sexp_inner_element)``
"silent! nmap <buffer> <Leader>ee <Plug>(iced_eval)<Plug>(sexp_outer_list)``
"silent! nmap <buffer> <Leader>et <Plug>(iced_eval_outer_top_list)
"silent! vmap <buffer> <Leader>ee <Plug>(iced_eval_visual)
"silent! vmap <buffer> <Leader>er <Plug>(iced_eval_repl_visual)
"silent! nmap <buffer> <Leader>er <Plug>(iced_eval_repl)<Plug>(sexp_outer_top_list)``
"silent! nmap <buffer> <Leader>en <Plug>(iced_eval_ns)
"silent! nmap <buffer> <Leader>ep <Plug>(iced_print_last)
"silent! nmap <buffer> <Leader>eb <Plug>(iced_require)
"silent! nmap <buffer> <Leader>eB <Plug>(iced_require_all)
"silent! nmap <buffer> <Leader>eu <Plug>(iced_undef)
"silent! nmap <buffer> <Leader>eM <Plug>(iced_macroexpand_outer_list)
"silent! nmap <buffer> <Leader>em <Plug>(iced_macroexpand_1_outer_list)

"" Testing (<Leader>t)
"" ------------------------------------------------------------------------
"silent! nmap <buffer> <Leader>tt <Plug>(iced_test_under_cursor)

"silent! nmap <buffer> <Leader>tl <Plug>(iced_test_rerun_last)
"silent! nmap <buffer> <Leader>ts <Plug>(iced_test_spec_check)
"silent! nmap <buffer> <Leader>to <Plug>(iced_test_buffer_open)
"silent! nmap <buffer> <Leader>tn <Plug>(iced_test_ns)
"silent! nmap <buffer> <Leader>tp <Plug>(iced_test_all)
"silent! nmap <buffer> <Leader>tr <Plug>(iced_test_redo)

"" Stdout buffer (<Leader>s)
"" ------------------------------------------------------------------------
"silent! nmap <buffer> <Leader>ss <Plug>(iced_stdout_buffer_open)
"silent! nmap <buffer> <Leader>sl <Plug>(iced_stdout_buffer_clear)
"silent! nmap <buffer> <Leader>sq <Plug>(iced_stdout_buffer_close)

"" Refactoring (<Leader>r)
"" ------------------------------------------------------------------------
"silent! nmap <buffer> <Leader>rcn <Plug>(iced_clean_ns)
"silent! nmap <buffer> <Leader>ram <Plug>(iced_add_missing)
"silent! nmap <buffer> <Leader>ran <Plug>(iced_add_ns)
"silent! nmap <buffer> <Leader>rtf <Plug>(iced_thread_first)
"silent! nmap <buffer> <Leader>rtl <Plug>(iced_thread_last)
"silent! nmap <buffer> <Leader>ref <Plug>(iced_extract_function)
"silent! nmap <buffer> <Leader>raa <Plug>(iced_add_arity)
"silent! nmap <buffer> <Leader>rml <Plug>(iced_move_to_let)

"" Help/Document (<Leader>h)
"" ------------------------------------------------------------------------
"silent! nmap <buffer> K <Plug>(iced_popup_document_open)
"silent! nmap <buffer> <Leader>hb <Plug>(iced_document_open)
"silent! nmap <buffer> <Leader>hu <Plug>(iced_use_case_open)
"silent! nmap <buffer> <Leader>hn <Plug>(iced_next_use_case)
"silent! nmap <buffer> <Leader>hN <Plug>(iced_prev_use_case)
"silent! nmap <buffer> <Leader>hq <Plug>(iced_document_close)
"silent! nmap <buffer> <Leader>hS <Plug>(iced_source_show)
"silent! nmap <buffer> <Leader>hs <Plug>(iced_popup_source_show)
"silent! nmap <buffer> <Leader>hc <Plug>(iced_clojuredocs_open)
"silent! nmap <buffer> <Leader>hh <Plug>(iced_command_palette)

"" Browsing (<Leader>b)
"" ------------------------------------------------------------------------
"silent! nmap <buffer> <Leader>bn <Plug>(iced_browse_related_namespace)
"silent! nmap <buffer> <Leader>bs <Plug>(iced_browse_spec)
"silent! nmap <buffer> <Leader>bt <Plug>(iced_browse_test_under_cursor)
"silent! nmap <buffer> <Leader>br <Plug>(iced_browse_references)
"silent! nmap <buffer> <Leader>bd <Plug>(iced_browse_dependencies)
"silent! nmap <buffer> <Leader>bvr <Plug>(iced_browse_var_references)
"silent! nmap <buffer> <Leader>bvd <Plug>(iced_browse_var_dependencies)

"" Jumping cursor (<Leader>j)
"" ------------------------------------------------------------------------
"silent! nmap <buffer> <C-]> <Plug>(iced_def_jump)
"silent! nmap <buffer> <C-t> <Plug>(iced_def_back)
"silent! nmap <buffer> <Leader>jn <Plug>(iced_jump_to_next_sign)
"silent! nmap <buffer> <Leader>jN <Plug>(iced_jump_to_prev_sign)
"silent! nmap <buffer> <Leader>jl <Plug>(iced_jump_to_let)

"" Debugging (<Leader>d)
"" ------------------------------------------------------------------------
"silent! nmap <buffer> <Leader>dtl <Plug>(iced_list_tapped)
"silent! nmap <buffer> <Leader>dtc <Plug>(iced_clear_tapped)

"" Misc
"" ------------------------------------------------------------------------
"silent! nmap <buffer> == <Plug>(iced_format)
"silent! nmap <buffer> <Leader>* <Plug>(iced_grep)
"silent! nmap <buffer> <Leader>/ :<C-u>IcedGrep<Space>
"" }}}

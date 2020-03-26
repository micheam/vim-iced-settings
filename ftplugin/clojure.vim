" based on 
" https://github.com/liquidz/vim-iced
" commit: 2576a2ee06a768d03553d18182e7f5eeb73a2f6d

let g:iced#nrepl#connect#jack_in_command='iced repl -A:dev:test'

" Commands
" https://github.com/liquidz/vim-iced/blob/master/ftplugin/clojure.vim
command! -nargs=? Connect               call iced#nrepl#connect(<q-args>)
command!          Disconnect            call iced#nrepl#disconnect()
command!          Reconnect             call iced#nrepl#reconnect()
command!          Interrupt             call iced#nrepl#interrupt()
command!          InterruptAll          call iced#nrepl#interrupt_all()
command!          InstantConnect        call iced#nrepl#connect#instant()
command!          JackIn                call iced#nrepl#connect#jack_in()

command! -nargs=? CljsRepl              call iced#nrepl#cljs#start_repl(<q-args>)
command! -nargs=+ -complete=custom,iced#nrepl#cljs#env_complete IcedStartCljsRepl    call iced#nrepl#cljs#start_repl_via_env(<f-args>)
command!          QuitCljsRepl          call iced#nrepl#cljs#stop_repl_via_env()
command!          CycleSession          call iced#nrepl#cljs#cycle_session()

command! -nargs=1 Eval                  call iced#nrepl#eval#code(<q-args>, {'ignore_session_validity': v:true})
command!          EvalNs                call iced#nrepl#eval#ns()
command! -range   EvalVisual            call iced#nrepl#eval#visual()
command!          Require               call iced#nrepl#ns#load_current_file()
command!          RequireAll            call iced#nrepl#ns#reload_all()
command! -nargs=? Undef                 call iced#nrepl#eval#undef(<q-args>)
command! -nargs=? UndefAllInNs          call iced#nrepl#eval#undef_all_in_ns(<q-args>)
command!          EvalOuterTopList      call iced#nrepl#eval#outer_top_list()
command!          PrintLast             call iced#nrepl#eval#print_last()
command!          MacroExpandOuterList  call iced#nrepl#macro#expand_outer_list()
command!          MacroExpand1OuterList call iced#nrepl#macro#expand_1_outer_list()

command!          TestNs                call iced#nrepl#test#ns()
command!          TestAll               call iced#nrepl#test#all()
command!          TestRedo              call iced#nrepl#test#redo()
command!          TestUnderCursor       call iced#nrepl#test#under_cursor()
command!          TestRerunLast         call iced#nrepl#test#rerun_last()
command! -nargs=? SpecCheck             call iced#nrepl#test#spec_check(<q-args>)
command!          TestBufferOpen        call iced#buffer#error#open()

command!          StdoutBufferOpen      call iced#buffer#stdout#open()
command!          StdoutBufferClear     call iced#buffer#stdout#clear()
command!          StdoutBufferClose     call iced#buffer#stdout#close()

command! -nargs=? DefJump               call iced#nrepl#navigate#jump_to_def(<q-args>)
command! -nargs=1 -complete=custom,iced#nrepl#navigate#ns_complete OpenNs call iced#nrepl#navigate#open_ns('e', <q-args>)

command! -nargs=? Document              call iced#nrepl#document#open(<q-args>)
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
command! -nargs=? ClojureDocs           call iced#clojuredocs#open(<q-args>)
command!          ClojureDocsRefresh    call iced#clojuredocs#refresh()

command!          Slurp                 call iced#paredit#deep_slurp()
command!          Barf                  call iced#paredit#barf()
command!          Format                call iced#format#form()
command!          FormatAll             call iced#format#all()
command!          CycleSrcAndTest       call iced#nrepl#navigate#cycle_src_and_test()
command! -nargs=? Grep                  call iced#grep#exe(<q-args>)

command!          BrowseRelatedNamespace call iced#nrepl#navigate#related_ns()
command!          SpecList               call iced#nrepl#spec#browse()
command!          BrowseTestUnderCursor  call iced#nrepl#navigate#test()
command!          BrowseReferences       call iced#nrepl#navigate#browse_references()
command!          BrowseDependencies     call iced#nrepl#navigate#browse_dependencies()
command! -nargs=? BrowseVarReferences    call iced#nrepl#navigate#browse_var_references(<q-args>)
command! -nargs=? BrowseVarDependencies  call iced#nrepl#navigate#browse_var_dependencies(<q-args>)
command!          ClearCtrlpCache        call ctrlp#iced#cache#clear()

command!          CleanNs               call iced#nrepl#refactor#clean_ns()
command!          CleanAll              call iced#nrepl#refactor#clean_all()
command! -nargs=? AddMissing            call iced#nrepl#refactor#add_missing_ns(<q-args>)
command! -nargs=? AddNs                 call iced#nrepl#refactor#add_ns(<q-args>)
command!          ThreadFirst           call iced#nrepl#refactor#thread_first()
command!          ThreadLast            call iced#nrepl#refactor#thread_last()
command!          ExtractFunction       call iced#nrepl#refactor#extract_function()
command!          AddArity              call iced#nrepl#refactor#add_arity()
command!          MoveToLet             call iced#let#move_to_let()

command! -nargs=? -complete=custom,iced#nrepl#debug#complete_tapped BrowseTapped call iced#nrepl#debug#browse_tapped(<q-args>)
command!          ClearTapped            call iced#nrepl#debug#clear_tapped()
command!          ToggleWarnOnReflection call iced#nrepl#debug#toggle_warn_on_reflection()

command! -nargs=? ToggleTraceVar        call iced#nrepl#trace#toggle_var(<q-args>)
command! -nargs=? ToggleTraceNs         call iced#nrepl#trace#toggle_ns(<q-args>)

command!          InInitNs              call iced#nrepl#ns#in_init_ns()

command!          JumpToNextSign        call iced#system#get('sign').jump_to_next()
command!          JumpToPrevSign        call iced#system#get('sign').jump_to_prev()
command!          JumpToNextError       call iced#system#get('sign').jump_to_next({'name': iced#nrepl#test#sign_name()})
command!          JumpToPrevError       call iced#system#get('sign').jump_to_next({'name': iced#nrepl#test#sign_name()})
command!          JumpToLet             call iced#let#jump_to_let()



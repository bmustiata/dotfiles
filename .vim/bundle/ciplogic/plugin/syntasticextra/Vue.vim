
function! RegisterVueAttributes()
    call add(g:syntastic_html_tidy_ignore_errors, ' attribute name ":')
    call add(g:syntastic_html_tidy_ignore_errors, ' attribute name "@')

    call RegisterAttributeName("v-if")
    call RegisterAttributeName("v-else")
    call RegisterAttributeName("v-for")
endfunction

call RegisterVueAttributes()

function! SyntasticEditVue()
    edit ~/.vim/bundle/ciplogic/plugin/syntasticextra/Vue.vim
endfunction
command SyntasticEditVue call SyntasticEditVue()


function! RegisterVueAttributes()
    call add(g:syntastic_html_tidy_ignore_errors, ' attribute name ":')
    call add(g:syntastic_html_tidy_ignore_errors, ' attribute name "@')

    call RegisterAttributeName("v-if")
    call RegisterAttributeName("v-else")
    call RegisterAttributeName("v-for")
    call RegisterAttributeName("v-html")
    call RegisterAttributeName("slot")

    call RegisterTagName("transition")
    call RegisterTagName("slot")
endfunction

call RegisterVueAttributes()

function! SyntasticEditVue()
    edit ~/.vim/bundle/ciplogic/plugin/syntasticextra/Vue.vim
endfunction
command SyntasticEditVue call SyntasticEditVue()

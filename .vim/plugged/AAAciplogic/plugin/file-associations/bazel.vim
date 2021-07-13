"
" please files
"
au BufRead,BufNewFile BUILD set filetype=X_Please.bzl
au BufRead,BufNewFile WORKSPACE set filetype=X_Please.bzl
au BufRead,BufNewFile *.plz set filetype=X_Please.bzl

"
" bazel files
"
au BufRead,BufNewFile *.bzl set filetype=X_Bazel.bzl
au BufRead,BufNewFile WORKSPACE.bazel set filetype=X_Bazel.bzl
au BufRead,BufNewFile BUILD.bazel set filetype=X_Bazel.bzl

[ -f ~/.zshenv_local ] && source ~/.zshenv_local

typeset -T C_INCLUDE_PATH c_include_path
typeset -T CPLUS_INCLUDE_PATH cplus_include_path
typeset -T LIBRARY_PATH library_path
typeset -T LD_LIBRARY_PATH ld_library_path
typeset -U path cdpath fpath manpath c_include_path cplus_include_path library_path ld_library_path

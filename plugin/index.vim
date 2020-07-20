" returns a matching combo of characters

" key - the key it was mapped to (for example: {)
" char - the peer character (for example: })
function! InsertMatchingChar(key, char)
  let l:charRight =  getline('.')[col('.')-1]
  let l:finalStr = a:key . a:char . "\<left>"
  if charRight ==# " "
    return finalStr
  elseif charRight ==# ""
    if a:key ==# "\"" || a:key ==# "'" || a:key ==# "`"
      return a:key
    endif
    return finalStr
  elseif charRight ==# a:char
    if a:key ==# "{" || a:key ==# "[" || a:key ==# "("
      return finalStr
    endif
    return "\<right>"
  endif
  return a:key
endfunction

" mapping
inoremap <expr> ( InsertMatchingChar("(", ")")
inoremap <expr> { InsertMatchingChar("{", "}")
inoremap <expr> [ InsertMatchingChar("[", "]")

inoremap <expr> " InsertMatchingChar("\"", "\"")
inoremap <expr> ' InsertMatchingChar("'", "'")
inoremap <expr> ` InsertMatchingChar("`", "`")


function gitam --wraps='git add . && git commit --amend --no-edit' --description 'alias gitam=git add . && git commit --amend --no-edit'
  git add . && git commit --amend --no-edit $argv; 
end

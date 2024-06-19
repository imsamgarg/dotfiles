function topten --wraps='du -sh * | sort -nr | head -10' --wraps='du -h --max-depth=1 | sort -rh | head -n 10' --description 'alias topten=du -h --max-depth=1 | sort -rh | head -n 10'
  du -h --max-depth=1 | sort -rh | head -n 10 $argv; 
end

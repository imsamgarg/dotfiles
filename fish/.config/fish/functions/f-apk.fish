function f-apk --wraps='flutter build apk --split-per-abi' --description 'alias f-apk=flutter build apk --split-per-abi'
  flutter build apk --split-per-abi $argv; 
end

function asm-run --wraps='nasm -f elf  && ld -m elf_i386  -o  && ./' --description 'alias asm-run=nasm -f elf  && ld -m elf_i386  -o  && ./'
  nasm -f elf "$argv[1].asm" && ld -m elf_i386 "$argv[1].o" -o $argv[1] && ./$argv[1]; 
end

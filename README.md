AssemblyProjects
================

Collection of small projects created while learning x86 and x86_64 assembly.

NASM is assembler, ld is linker.

System calls are from:
http://blog.rchapman.org/post/36801038863/linux-system-call-table-for-x86-64

Linux (64-bit ubuntu) commands to compile/link/run:
nasm -f elf64	-o COMPILEDNAME.o 	ASSEMBLYNAME.asm
ld -o LINKEDNAME	COMPILEDNAME.o
./LINKEDNAME

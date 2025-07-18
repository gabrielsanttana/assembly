; hello.asm
section .data
  message db 'Hello, World!', 0x0a ; Define the message string,  0x0a == /n
  length equ $ - message ; Calculate the length of the message == 14

section .text
  global _start ; Make the _start label visible to the linker

_start:
  ; write(1, message, length)
  mov rax, 1 ; syscall number for sys_write
  mov rdi, 1 ; file descriptor 1 is stdout
  mov rsi, message ; pointer to the message
  mov rdx, length ; length of the message
  syscall ; execute the system call

 ; exit(0)
  mov rax, 60 ; syscall number for sys_exit
  xor rdi, rdi ; exit code 0
  syscall ; execute the system call
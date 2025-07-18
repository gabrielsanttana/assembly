; add.asm
section .data
  prompt1 db 'Enter the first number (0-9): ', 0xa ; Prompt for the first number
  firstPromptLength equ $ - prompt1 ; Length of prompt1

  prompt2 db 'Enter the second number (0-9): ', 0xa ; Prompt for the second number
  secondPromptLength equ $ - prompt2 ; Length of prompt2

  resultMessage db 'The sum is: ' ; The result message
  resultMessageLength equ $ - resultMessage ; Length of the result message

  newline db 0xa ; Newline character

section .bss
  num1 resb 2 ; Reserve 2 bytes for first number (digit + newline)
  num2 resb 2 ; Reserve 2 bytes for second number
  sum resb 1 ; Reserve 1 byte for the sum result

section .text
  global _start

_start:
  ; --- Prompt for and read the first number ---
  mov rax, 1 ; syscall for sys_write
  mov rdi, 1 ; stdout
  mov rsi, prompt1 ; message to write
  mov rdx, firstPromptLength ; message length
  syscall

  mov rax, 0 ; syscall for sys_read
  mov rdi, 0 ; stdin
  mov rsi, num1 ; buffer to store input
  mov rdx, 2 ; max bytes to read
  syscall

  ; --- Prompt for and read the second number ---
  mov rax, 1 ; sys_write
  mov rdi, 1 ; stdout
  mov rsi, prompt2 ; message to write
  mov rdx, secondPromptLength ; message length
  syscall

  mov rax, 0 ; sys_read
  mov rdi, 0 ; stdin
  mov rsi, num2 ; buffer to store input
  mov rdx, 2 ; max bytes to read
  syscall

  ; --- Perform the calculation ---
  mov al, [num1] ; Move the first ASCII number into the AL register
  sub al, '0' ; Convert from ASCII character '5' to integer 5

  mov bl, [num2] ; Move the second ASCII number into the BL register
  sub bl, '0' ; Convert from ASCII to integer

  add al, bl ; Add the two integer values. The result is in AL.

  ; --- Convert sum back to ASCII and store it ---
  add al, '0' ; Convert the integer sum back to an ASCII character
  mov [sum], al ; Store the ASCII result in our 'sum' variable

  ; --- Print the result message and the sum ---
  mov rax, 1 ; sys_write
  mov rdi, 1 ; stdout
  mov rsi, resultMessage ; message to write
  mov rdx, resultMessageLength ; message length
  syscall

  mov rax, 1 ; sys_write
  mov rdi, 1 ; stdout
  mov rsi, sum ; the calculated sum
  mov rdx, 1 ; length of the sum (1 byte)
  syscall

  ; --- Print a final newline ---
  mov rax, 1 ; sys_write
  mov rdi, 1 ; stdout
  mov rsi, newline ; the newline character
  mov rdx, 1 ; length of newline
  syscall

  ; --- Exit the program ---
  mov rax, 60 ; syscall for sys_exit
  xor rdi, rdi ; exit code 0 (success)
  syscall

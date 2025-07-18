section .data
  firstPrompt db 'Enter the first number (0-9)', 0xa
  firstPromptLen equ $ - firstPrompt

  secondPrompt db 'Enter the second number (0-9)', 0xa
  secondPromptLen equ $ - secondPrompt

  greaterResultMessage db ' is greater', 0xa
  greaterResultMessageLen equ $ - greaterResultMessage
  
  equalResultMessage db 'They are equal', 0xa
  equalResultMessageLen equ $ - equalResultMessage

section .bss
  num1 resb 2
  num2 resb 2

section .text
  global _start

_start:
  mov rax, 1
  mov rdi, 1
  mov rsi, firstPrompt
  mov rdx, firstPromptLen
  syscall

  mov rax, 0
  mov rdi, 0
  mov rsi, num1
  mov rdx, 2
  syscall

  mov rax, 1
  mov rdi, 1
  mov rsi, secondPrompt
  mov rdx, secondPromptLen
  syscall

  mov rax, 0
  mov rdi, 0
  mov rsi, num2
  mov rdx, 2
  syscall

  mov al, [num1]
  mov bl, [num2]

  cmp al, bl

  jg firstIsGreater
  jl secondIsGreater
  je numbersAreEqual

  firstIsGreater:
    mov rdi, num1
    call printIsGreater
    jmp exitProgram

  secondIsGreater:
    mov rdi, num2
    call printIsGreater
    jmp exitProgram

  numbersAreEqual:
    mov rax, 1
    mov rdi, 1
    mov rsi, equalResultMessage
    mov rdx, equalResultMessageLen
    syscall

  exitProgram:
    mov rax, 60
    xor rdi, rdi
    syscall

printIsGreater:
  mov rsi, rdi
  
  mov rax, 1
  mov rdi, 1
  mov rdx, 1
  syscall

  mov rax, 1
  mov rdi, 1
  mov rsi, greaterResultMessage
  mov rdx, greaterResultMessageLen
  syscall
  
  ret


#include <stdio.h>

void printIsGreater(char number) {
  printf("%c is greater\n", number);
}

int main() {
  // These variables are the equivalent of .bss section reservations
  char num1;
  char num2;

  printf("Enter the first number (0-9)\n");
  scanf(" %c", &num1);

  printf("Enter the second number (0-9)\n");
  scanf(" %c", &num2);

  // This if/else if/else block is the direct equivalent to cmp, jg, jl, and je instruction sequence
  if (num1 > num2) {
    // Eequivalent of 'mov rdi, num1' followed by 'call printIsGreater'
    printIsGreater(num1);
  } else if (num2 > num1) {
    // Equivalent of 'mov rdi, num2' followed by 'call printIsGreater'
    printIsGreater(num2);
  } else {
    // This corresponds to 'numbersAreEqual' block.
    printf("They are equal\n");
  }

  return 0;
}

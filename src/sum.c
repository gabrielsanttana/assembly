#include <stdio.h>

int main() {
  char firstNumber;
  char secondNumber;
  int sum;

  printf("Enter the first number (0-9): \n");
  scanf(" %c", &firstNumber);

  printf("Enter the second number (0-9): \n");
  scanf(" %c", &secondNumber);

  sum = (firstNumber - '0') + (secondNumber - '0');

  printf("The sum is: %d\n", sum);

  return 0;
}
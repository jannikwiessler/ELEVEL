#include <stdio.h>

int main()
{

    int myInt = 0;
    double myDouble = 0.0;
    char myChar = 'A';

    printf("please enter an integer: ");
    scanf("%d", &myInt);

    printf("please enter a double: ");
    scanf("%lf", &myDouble);

    printf("please enter a character: ");
    scanf(" %c", &myChar);

    printf("you entered int: %d, double: %lf, char: %c", myInt, myDouble, myChar);

    return 0;
}
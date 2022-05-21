#include <stdio.h>

int main()
{

    int eingabe = 0;
    int zahlen[10] = {0};
    int stelle = 11;

    for (int i = 0; i < 10; i++)
    {
        printf("Bitte Nummer %i eingeben: \n", i);
        scanf("%i", &zahlen[i]);
    }
    printf("Bitte jetzt eine beliebige Zahl aus der Reihe erneut eingeben: ");
    scanf("%i", &eingabe);
    for (int j = 0; j < 10; j++)
    {
        if (zahlen[j] == eingabe)
        {
            stelle = j;
            break;
        }
    }
    if (stelle <= 9)
        printf("Das war die %i. Nummer,\nmit Adresse %p, erste Adresse ist %p und die Adresse nach dem Array ist %p \n", stelle + 1, &zahlen[stelle], &zahlen[0], &zahlen[0] + 10);
    else
        printf("Das war keine Zahl aus der Reihe! \n");

    return 0;
}
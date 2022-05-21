#include <stdio.h>

void myVoidIncrementFcn(int *para)
{
    (*para)++;
}

int myIntIncrementFcn(int para)
{
    para++;
    return para;
}

int main()
{

    int myValueToIncement = 10;

    int myIncemenetedValue = myIntIncrementFcn(myValueToIncement);
    printf("myIntIncrementFcn(%d) = %d\n", myValueToIncement, myIncemenetedValue);

    myVoidIncrementFcn(&myValueToIncement);
    printf("myVoidIncrementFcn(%d) = %d\n", myValueToIncement - 1, myValueToIncement);

    return 0;
}
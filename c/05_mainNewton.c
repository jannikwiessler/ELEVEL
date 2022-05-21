#include <stdio.h>
#include <stdlib.h>
#include <math.h>

double myPolyGrad3(double x)
{
    // y = a3x^3 + a2x^2 + a1x + a0
    double a0 = 0;
    double a1 = 0;
    double a2 = 1;
    double a3 = 0;

    return a3 * x * x * x + a2 * x * x + a1 * x + a0;
}

double numDiffGrad1(double (*FCN)(double), double x)
{

    double dx = 1e-8;

    return (FCN(x + dx) - FCN(x)) / dx;
}

int main()
{

    int maxIter = 30;
    double x = 1;
    double y = 0;
    double xOld = 5;
    double xNew = 0;
    double xSave[maxIter + 1];
    double ySave[maxIter + 1];
    double abort = 1e-10;
    int totalLen = 0;

    // fcn pointer
    double (*myPolyGrad3PTR)(double);
    double (*numDiffPTR)(double (*)(double), double);
    myPolyGrad3PTR = &myPolyGrad3;
    numDiffPTR = &numDiffGrad1;

    // test the pointer
    y = (*myPolyGrad3PTR)(x);
    printf("polyGrad3(%.3lf) = %.3lf\n", x, y);
    y = numDiffGrad1(myPolyGrad3PTR, x);
    printf("numDiffGrad1(%.3lf) = %.10lf\n", x, y);

    // newton fcn
    xSave[0] = xOld;
    ySave[0] = (*myPolyGrad3PTR)(xOld);
    for (int i = 0; i < maxIter; i++)
    {
        xNew = xOld - (*myPolyGrad3PTR)(xOld) / (*numDiffPTR)(myPolyGrad3PTR, xOld);
        xOld = xNew;
        xSave[i + 1] = xNew;
        ySave[i + 1] = myPolyGrad3PTR(xNew);
        totalLen++;
        if (fabs(myPolyGrad3PTR(xOld)) <= abort)
            break;
    }

    // ausgabe
    printf("total loops performed: %d\n", totalLen);
    for (int i = 0; i < totalLen + 1; i++)
    {
        printf("%d.: \t %.10lf \t %.10lf\n", i, xSave[i], ySave[i]);
    }

    return 0;
}
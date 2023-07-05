#include<conio.h>
#include <iostream>

int main()
{
    int a, b, sum;
    a = (INT16_MAX / 2) + 1;
    b = (INT16_MAX / 2) + 1;
    sum = a + b;
    std::cout << "Sum of the two number is " << sum;
}


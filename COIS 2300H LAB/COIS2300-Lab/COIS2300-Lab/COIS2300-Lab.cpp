#include <iostream>
//#include "stdafx.h"
using namespace std;

int a = 1;
int b = 2;

float fA = 1.0;
float fB = 3.0;

int main()
{
	cout.precision(10);
	float inc = 0.000001, sum = 0.0;
	for (float i = 1.0; i <= 1000000.0;)
	{
		sum += (1.0 / i);
		i += 1.0;
	}

	cout << sum;
	cin.get();
	return 0;
}






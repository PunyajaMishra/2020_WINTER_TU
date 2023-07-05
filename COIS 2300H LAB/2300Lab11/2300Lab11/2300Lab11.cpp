// CpptoASM.cpp : Defines the entry point for the console application.
//

#pragma float_control(precise)
//#pragma float_control(fast)
// Code that uses /fp:precise mode


//#include "stdafx.h"
#include <iostream>
using namespace std;

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

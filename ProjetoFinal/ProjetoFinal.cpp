// ProjetoFinal.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include "conio.h"


extern "C" {
	int add_vectors(int* a, int* b, int* c, int l);
}

/*void adicionaArray(int a[], int b[], int c[], int l) {
	for (int i = 0; i < l; i++) {
		c[i] = a[i] + b[i];
		printf("C[%d] = %d\n", i, c[i]);
	}
}*/





int main(int argc, char* argv[])
{
	
	int array1[] = { 1000,1001,1002,1003,1004,1005,1006,1007,1008,1009, 1010,1000,1001,1002,1003,1001,1002,1003,1004,1005,1006,1007,1008,1009, 1010,1000,1001,1002,1003,1001,1002,1003,1004,1005,1006,1007,1008,1009, 1010,1000,1001,1002,1003,1001,1002,1003,1004,1005,1006,1007,1008,1009, 1010,1000,1001,1002,1003,1001,1002,1003,1004,1005,1006,1007,1008,1009, 1010,1000,1001,1002,1003,1001,1002,1003,1004,1005,1006,1007,1008,1009, 1010,1000,1001,1002,1003 };
	int array2[] = { 1000,1001,1002,1003,1004,1005,1006,1007,1008,1009, 1010,1000,1001,1002,1003,1001,1002,1003,1004,1005,1006,1007,1008,1009, 1010,1000,1001,1002,1003,1001,1002,1003,1004,1005,1006,1007,1008,1009, 1010,1000,1001,1002,1003,1001,1002,1003,1004,1005,1006,1007,1008,1009, 1010,1000,1001,1002,1003,1001,1002,1003,1004,1005,1006,1007,1008,1009, 1010,1000,1001,1002,1003,1001,1002,1003,1004,1005,1006,1007,1008,1009, 1010,1000,1001,1002,1003 };
	int array3[1000] = { 0 };
	int indice = 84;
	add_vectors(array1, array2, array3, indice);
	//adicionaArray(arra1,arra2,array3,indice);
	for (int i = 0; i < indice; i++) {
		printf("Array3[%d] = %d\n", i, array3[i]);
	}
}

// Run program: Ctrl + F5 or Debug > Start Without Debugging menu
// Debug program: F5 or Debug > Start Debugging menu

// Tips for Getting Started: 
//   1. Use the Solution Explorer window to add/manage files
//   2. Use the Team Explorer window to connect to source control
//   3. Use the Output window to see build output and other messages
//   4. Use the Error List window to view errors
//   5. Go to Project > Add New Item to create new code files, or Project > Add Existing Item to add existing code files to the project
//   6. In the future, to open this project again, go to File > Open > Project and select the .sln file

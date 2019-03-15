
#include <stdio.h>
#include "cdecl.h"

int PRE_CDECL func(int number) POST_CDECL; 
int PRE_CDECL bin_search(int* arr, int first, int last, int target) POST_CDECL; 

int main(void)
{
	int arr[5] = {1,2,3,4,5}; 
	int number = bin_search(arr, 0, 4, 3); 
	func(number);
}

int func(int number)
{
	//int arr[5] = {1,2,3,4,5}; 
	//int number = bin_search(arr, 0, 4, 2); 
	printf("%d\n", number );
}


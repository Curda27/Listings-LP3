#include <stdio.h>
#include <stdlib.h>
#include "reciprocal.hpp"

int main(int argc, char **argv)
{
	// si no hay argumentos al llamar al programa se indica este caso
	if (argc > 1)
	{
		int i;
		i = atoi(argv[1]);
		printf("The reciprocal of %d is %g\n", i, reciprocal(i));
	}
	else
		printf("No se ejecuto con argumentos\n");
	return 0;
}
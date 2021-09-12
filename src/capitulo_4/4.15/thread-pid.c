#include <pthread.h>
#include <stdio.h>
#include <unistd.h>

void* thread_function (void* arg)
{
	fprintf (stderr, "child thread pid is %d\n", (int) getpid ());
	/* 	Spin forever. */
	while (1);
	return NULL;
}

int main ()
{
	pthread_t thread;
	fprintf (stderr, "Ctrl+c para terminar, los ids son iguales desde linux 2.4\nmain thread pid is %d\n", (int) getpid ());
	pthread_create (&thread, NULL, &thread_function, NULL);
	/* 	Spin forever. */
	while (1);
	return 0;
}
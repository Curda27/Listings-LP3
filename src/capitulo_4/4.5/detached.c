#include <pthread.h>
#include <stdio.h>
#include <unistd.h>

void* thread_function (void* thread_arg)
{
	/* 	Do work here... */
	for (int i = 0; i < 2000; ++i)
		fputc ('x', stderr);
	return NULL;
}

int main ()
{
	pthread_attr_t attr;
	pthread_t thread;

	pthread_attr_init (&attr);
	pthread_attr_setdetachstate (&attr, PTHREAD_CREATE_DETACHED);
	pthread_create (&thread, &attr, &thread_function, NULL);
	pthread_attr_destroy (&attr);

	/* 	Do work here...	*/
	for (int i = 0; i < 5000; ++i)
		printf("o");

	/* Espera 1 segundo */
	sleep(1);
	/* No need to join the second thread. */
	return 0;
}
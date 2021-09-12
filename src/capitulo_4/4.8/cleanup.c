#include <malloc.h>
#include <pthread.h>
#include <stdlib.h>
#include <unistd.h>

/* Allocate a temporary buffer.	*/

void* allocate_buffer (size_t size)
{
	return malloc (size);
}

/* Deallocate a temporary buffer.	*/

void deallocate_buffer (void* buffer)
{
	free (buffer);
}

void do_some_work ()
{
	/* 	Allocate a temporary buffer.	*/
	void* temp_buffer = allocate_buffer (1024);
	/* 	Register a cleanup handler for this buffer, to deallocate it in
		case the thread exits or is cancelled. */
	pthread_cleanup_push (deallocate_buffer, temp_buffer);

	/* 	Do some work here that might call pthread_exit or might be
		cancelled... */

	while(1){
		srand (time(NULL));
		int random = rand()%1001;
		printf("El numero es: %d\n", random);

	/* si el numero random es impar se sale del thread */
		if(random%2){
			printf("Saliendo\n");
			pthread_exit(NULL);
		}

		printf("Sigue en el thread\n");
		sleep(1);
	}
	/* 	Unregister the cleanup handler. Because we pass a nonzero value,
		this actually performs the cleanup by calling
		deallocate_buffer. */
	pthread_cleanup_pop (1);
}

void* work(void* args)
{
	do_some_work();
}

int main()
{
	printf("Se imprimen numeros aleatorios y se sale del thread si es que el numero es impar\n");
	
	/* Se crea el thread */
	pthread_t thread;
	pthread_create(&thread, NULL, &work, NULL);

	/* Se espera a que el thread creado termine */
	pthread_join(thread, NULL);

	return 0;
}
#include <pthread.h>
#include <cstdio>
#include <unistd.h>
#include <stdlib.h>

bool flag;

class ThreadExitException
{
public:
	/* 	Create an exception-signaling thread exit with RETURN_VALUE.	*/
	ThreadExitException (void* return_value)
		: thread_return_value_ (return_value)
	{
	}

	/* 	Actually exit the thread, using the return value provided in the
		constructor. */
	void* DoThreadExit ()
	{
		pthread_exit (thread_return_value_);
	}
private:
	/* 	The return value that will be used when exiting the thread.	*/
	void* thread_return_value_;
};


void do_some_work ()
{
	while (1) {
		/* 	Do some useful things here...	*/
		flag = false;
		srand (time(NULL));
		int random = rand()%1001;
		printf("%d\n", random);

		/* si el numero random es impar se sale del thread */
		if(random%2){
			printf("Saliendo\n");
			flag = true;
		}else
			printf("Sigue en el thread\n");
		sleep(1);
		if (flag)
			throw ThreadExitException (/* thread’s return value = */ NULL);
	}
}

void* thread_function (void*)
{
	try {
		do_some_work ();
	}
	catch (ThreadExitException ex) {
		/* 	Some function indicated that we should exit the thread.	*/
		ex.DoThreadExit ();
	}
	return NULL;
}

int main(){
	printf("Se imprimen numeros aleatorios y se sale del thread si es que el numero es impar\n");
	
	pthread_t thread;
	pthread_create (&thread, NULL, &thread_function, NULL);

	sleep(2);

	flag = false;

	pthread_join(thread, NULL);

	return 0;
}
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int thread_flag;
pthread_mutex_t thread_flag_mutex;

void initialize_flag ()
{
	pthread_mutex_init (&thread_flag_mutex, NULL);
	thread_flag = 1;
}

/* Sets the value of the thread flag to FLAG_VALUE.	*/
void set_thread_flag (int flag_value)
{
	/* 	Protect the flag with a mutex lock. */
	pthread_mutex_lock (&thread_flag_mutex);
	thread_flag = flag_value;
	pthread_mutex_unlock (&thread_flag_mutex);
}
void do_work()
{

	/* se imprimen numeros aleatorios del 0 al 1000 */

	int ran = rand() %1001;
	printf("%d\n", ran);

	/* si el numero random es multiplo de 10 se detiene */
	if(ran%10 == 0){
		set_thread_flag(0);
	}
}


/* 	Calls do_work repeatedly while the thread flag is set; otherwise
	spins. */

void* thread_function (void* thread_arg)
{
	while (1) {

		int flag_is_set;

		/* 	Protect the flag with a mutex lock. */
		pthread_mutex_lock (&thread_flag_mutex);
		flag_is_set = thread_flag;
		pthread_mutex_unlock (&thread_flag_mutex);
		if (flag_is_set)
			do_work ();
		/* 	Else don’t do anything.	Just loop again.	*/
	}
	return NULL;
}

int main()
{
	printf("Se imprimen numeros aleatorios hasta que se encuentre un multiplo de 10\n");

  	srand(time(NULL));

	pthread_t thread;

	initialize_flag();

	pthread_create(&thread, NULL, &thread_function, NULL);

	while(thread_flag) {
		sleep(2);
	}

	return 0;
}
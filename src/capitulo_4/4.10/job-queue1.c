#include <malloc.h>
#include <pthread.h>

struct job {
	/* 	Link field for linked list.	*/
	struct job* next;

	/* 	Other fields describing work to be done... */
	int id;
};

/* Tamaño de struct job */
int size_job = sizeof(struct job);

/* A linked list of pending jobs.	*/
struct job* job_queue;

/* 	Process queued jobs until the queue is empty.	*/
void process_job(struct job* job)
{
	printf("Procesando trabajo %d\n",job->id + 1);
}

void* thread_function (void* arg)
{
	while (job_queue != NULL) {
		/* 	Get the next available job. */
		struct job* next_job = job_queue;
		/*	Remove this job from the list. */
		job_queue = job_queue->next;
		/* 	Carry out the work. */
		process_job (next_job);
		/* Clean up. */
		free (next_job);
	}
	return NULL;
}

int main()
{

	for(int i = 0; i < 5; i++){
		struct job* newJob = malloc( size_job );
		newJob->next = job_queue;
		newJob->id = i;
		job_queue = newJob;
	}

	int tam = 3;
	pthread_t threads[tam];

	for(int i = 0; i < tam; i++){
		int* thread_pos = malloc( sizeof(int) );
		*thread_pos = i;
		pthread_create(&(threads[i]), NULL, &thread_function, thread_pos);
	}

	for(int i = 0; i < tam; i++)
		pthread_join(threads[i], NULL);

	return 0;
}
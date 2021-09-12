#include <malloc.h>
#include <pthread.h>
#include <string.h>

struct job {
	/* 	Link field for linked list.	*/
	struct job* next;

	/* 	Other fields describing work to be done... */
	int id;
};

/* Tamaño de struct job */
int size_job = sizeof(struct job);

/* 	A linked list of pending jobs.	*/
struct job* job_queue;

pthread_t thread1;
	pthread_t thread2;

void process_job(struct job* job)
{
	printf("Procesando trabajo %d\n",job->id);
}

/* A mutex protecting job_queue. */
pthread_mutex_t job_queue_mutex = PTHREAD_MUTEX_INITIALIZER;

/* Process queued jobs until the queue is empty. */

void* thread_function (void* arg)
{
	while (1) {
		struct job* next_job;
		/* 	Lock the mutex on the job queue. */
		pthread_mutex_lock (&job_queue_mutex);
		/* 	Now it’s safe to check if the queue is empty. */
		if (job_queue == NULL)
			next_job = NULL;
		else {
			/* 	Get the next available job. */
			next_job = job_queue;
			/* 	Remove this job from the list. */
			job_queue = job_queue->next;
		}
		/* 	Unlock the mutex on the job queue because we’re done with the
			queue for now. */
		pthread_mutex_unlock (&job_queue_mutex);

		/* 	Was the queue empty? If so, end the thread.	*/
		if (next_job == NULL)
			break;

		/* 	Carry out the work. */
		process_job (next_job);
		/* Clean up. */
		free (next_job);
	}
	return NULL;
}

int main()
{
	
	struct job* job1 = malloc ( size_job );
	job1->id = 0;
	job_queue = job1;

	for(int i = 1; i<5; i++){
		struct job* newJob = malloc ( size_job );
		newJob->id = i;
		newJob->next = NULL;
		job1->next = newJob;
		job1 = newJob;
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
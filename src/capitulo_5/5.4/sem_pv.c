#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/sem.h>
#include <sys/stat.h>
#include <unistd.h>
#include <stdio.h>
/* Wait on a binary semaphore. Block until the semaphore value is positive,
then decrement it by 1. */
int binary_semaphore_wait(int semid)
{
  struct sembuf operations[1];
  /* Use the first (and only) semaphore. */
  operations[0].sem_num = 0;
  /* Decrement by 1. */
  operations[0].sem_op = -1;
  /* Permit undo'ing. */
  operations[0].sem_flg = SEM_UNDO;
  return semop(semid, operations, 1);
}
/* Post to a binary semaphore: increment its value by 1.
This returns immediately. */
int binary_semaphore_post(int semid)
{
  struct sembuf operations[1];
  /* Use the first (and only) semaphore. */
  operations[0].sem_num = 0;
  /* Increment by 1. */
  operations[0].sem_op = 1;
  /* Permit undo'ing. */
  operations[0].sem_flg = SEM_UNDO;
  return semop(semid, operations, 1);
}

/* We must define union semun ourselves. */
union semun
{
  int val;
  struct semid_ds *buf;
  unsigned short int *array;
  struct seminfo *__buf;
};
/* Initialize a binary semaphore with a value of 0. */
int binary_semaphore_initialize(int semid)
{
  union semun argument;
  unsigned short values[1];
  values[0] = 0;
  argument.array = values;
  return semctl(semid, 0, SETALL, argument);
}

/* Obtain a binary semaphore's ID, allocating if necessary. */
int binary_semaphore_allocation(key_t key, int sem_flags)
{
  return semget(key, 1, sem_flags);
}
/* Deallocate a binary semaphore. All users must have finished their use. Returns -1 on failure. */
int binary_semaphore_deallocate(int semid)
{
  union semun ignored_argument;
  return semctl(semid, 1, IPC_RMID, ignored_argument);
}

void child(int semid)
{
  printf("Posting from the child \n");
  binary_semaphore_post(semid);
}

void parent(int semid)
{
  printf("Waiting from the parent\n");
  binary_semaphore_wait(semid);
  printf("The wait from the parent has finished\n");
  int returnDeallocate = binary_semaphore_deallocate(semid);
  printf("Deallocate return code: %d\n", returnDeallocate);
}

int main()
{
  __key_t key;
  int sem_flags = IPC_CREAT | S_IWUSR;
  int semid = binary_semaphore_allocation(key, sem_flags);
  printf("Semaphore Id: %d\n", semid);
  printf("Semaphore key: %d\n", key);

  int returnInitialize = binary_semaphore_initialize(semid);
  printf("Init return: %d\n", returnInitialize);
  if (fork() == 0)
  {
    child(semid);
  }
  else
  {
    parent(semid);
  }

  return 0;
}

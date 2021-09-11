#include <sys/ipc.h>
#include <sys/sem.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <stdio.h>
/* We must define union semun ourselves. */
union semun
{
  int val;
  struct semid_ds *buf;
  unsigned short int *array;
  struct seminfo *__buf;
};
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

int main()
{
  __key_t key;
  int sem_flags = IPC_CREAT | S_IRUSR | S_IWUSR;
  int semid = binary_semaphore_allocation(key, sem_flags);
  printf("Semaphore Id: %d\n",semid );
  printf("Semaphore key: %d\n", key );

  int returnDeallocate = binary_semaphore_deallocate(semid);
  printf("Deallocate return code: %d\n",returnDeallocate);

  return 0;
}

#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

sig_atomic_t child_exit_status;

void clean_up_child_process(int signal_number)
{
	/* Clean up the child process. */
	int status;
	wait(&status);
	/* Store its exit status in a global variable. */
	child_exit_status = status;
}

int main()
{
	/* Handle SIGCHLD by calling clean_up_child_process. */
	struct sigaction sigchld_action;
	memset(&sigchld_action, 0, sizeof(sigchld_action));
	sigchld_action.sa_handler = &clean_up_child_process;
	sigaction(SIGCHLD, &sigchld_action, NULL);
	/* Now do things, including forking a child process. */
	pid_t child_pid = fork();
	if (child_pid > 0)
	{
		/* This is the parent process. */
		sleep(2);
	}
	else
	{
		/* This is the child process. Exit immediately. */
		exit(5);
	}
	printf("Proceso hijo termino con exit = %d\n", WEXITSTATUS(child_exit_status));
	return 0;
}
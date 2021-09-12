#include <pthread.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

/* 	An array of balances in accounts, indexed by account number. */

float* account_balances;


/* Estructura con los datos necesarios para la transaccion */
struct Trans
{
	int from_acct;
	int to_acct;
	float dollars;
};

/* 	Transfer DOLLARS from account FROM_ACCT to account TO_ACCT. Return
	0 if the transaction succeeded, or 1 if the balance FROM_ACCT is
	too small. */

int process_transaction (int from_acct, int to_acct, float dollars)
{

	int old_cancel_state;

	/* 	Check the balance in FROM_ACCT. */
	if (account_balances[from_acct] < dollars)
		return 1;
	/* 	Begin critical section. */
	pthread_setcancelstate (PTHREAD_CANCEL_DISABLE, &old_cancel_state);
	/* 	Move the money. */
	account_balances[to_acct] += dollars;
	account_balances[from_acct] -= dollars;
	/* 	End critical section. */
	pthread_setcancelstate (old_cancel_state, NULL);
	return 0;
}

void* process (void* args)
{
	struct Trans trans = *((struct Trans*) args);
	return process_transaction(trans.from_acct, trans.to_acct, trans.dollars);
}

void print_balances(){
	for(int i = 0; i<3; i++)
		printf("Cuenta %d: %.2f\n", i+1, account_balances[i]);
}

int main()
{
	account_balances = malloc(sizeof(float)*4);
	*account_balances = 200.0;
	*(account_balances + 1)=100.0;
	*(account_balances + 2) = 50.0;

	print_balances();

	struct Trans trans;
	trans.from_acct = 0;
	trans.to_acct = 2;
	trans.dollars = 120.0;

	pthread_t thread;

	pthread_create(&thread,NULL,&process,&trans);

	int res;

	pthread_join(thread, (void*) &res);

	if(!res){
		printf("Se transfirieron %.2f de la cuenta %d a la cuenta %d\n", trans.dollars, trans.from_acct+1, trans.to_acct+1);
		print_balances();
	}else
		printf("No se puede realizar la transferencia\n");

	
	
	return 0;
}
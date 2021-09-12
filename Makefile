listings := listing-1\
		listing-2.1 listing-2.2 listing-2.3 listing-2.4 listing-2.5 listing-2.6 listing-2.7 listing-2.8 listing-2.9\
		listing-3.1 listing-3.2 listing-3.3 listing-3.4 listing-3.5 listing-3.6 listing-3.7\
		listing-4.1 listing-4.2 listing-4.3 listing-4.4 listing-4.5 listing-4.6 listing-4.7 listing-4.8 listing-4.9 listing-4.10 listing-4.11 listing-4.12 listing-4.13 listing-4.14 listing-4.15\
		listing-5.1 listing-5.2 listing-5.3 listing-5.4 listing-5.5 listing-5.6 listing-5.7 listing-5.8 listing-5.9 listing-5.10 listing-5.11 listing-5.12\

all: $(listings)

clean:
	@rm -r bin

#Cap1
srcCap1 := src/capitulo_1
binCap1 := bin/capitulo_1
listing-1: $(srcCap1)/main.c $(srcCap1)/reciprocal.hpp $(srcCap1)/reciprocal.cpp
	mkdir -p $(binCap1)
	gcc $(srcCap1)/main.c $(srcCap1)/reciprocal.hpp $(srcCap1)/reciprocal.cpp -o bin/capitulo_1/reciprocal
listing-1.1: listing-1
listing-1.2: listing-1
listing-1.3: listing-1

#cap 2
srcCap2 = src/capitulo_2
binCap2 = bin/capitulo_2
listing-2.1: $(srcCap2)/2.1/arglist.c
	mkdir -p $(binCap2)/2.1
	gcc $(srcCap2)/2.1/arglist.c  -o $(binCap2)/2.1/arglist
	@echo "Puede ingresar argumentos si desea"
listing-2.2: $(srcCap2)/2.2/getopt_long.c
	mkdir -p $(binCap2)/2.2
	gcc $(srcCap2)/2.2/getopt_long.c -o $(binCap2)/2.2/getopt_long
listing-2.3: $(srcCap2)/2.3/print-env.c
	mkdir -p $(binCap2)/2.3
	gcc $(srcCap2)/2.3/print-env.c -o $(binCap2)/2.3/print-env
listing-2.4: $(srcCap2)/2.4/client.c
	mkdir -p $(binCap2)/2.4
	gcc $(srcCap2)/2.4/client.c -o $(binCap2)/2.4/client
	@echo "Debe crear una variable de entorno llamda SERVER_NAME (EJ: export SERVER_NAME=www.facebook.com)"
listing-2.5: $(srcCap2)/2.5/temp_file.c
	mkdir -p $(binCap2)/2.5
	gcc $(srcCap2)/2.5/temp_file.c -o $(binCap2)/2.5/temp_file
listing-2.6: $(srcCap2)/2.6/readfile.c
	mkdir -p $(binCap2)/2.6
	gcc $(srcCap2)/2.6/readfile.c -o $(binCap2)/2.6/readfile
	@echo "Debe ejecutar readfile desde el directorio del archivo generado para que encuentre el archivo"
listing-2.8: listing-2.7
	mkdir -p $(binCap2)/2.8
	gcc -o $(binCap2)/2.8/app $(srcCap2)/2.8/app.c -L./$(binCap2)/2.7 -ltest
listing-2.7: test.o
	mkdir -p $(binCap2)/2.7
	ar cr $(binCap2)/2.7/libtest.a $(srcCap2)/2.7/test.o 
	rm  -f $(srcCap2)/2.7/test.o
test.o: $(srcCap2)/2.7/test.c
	gcc -c $(srcCap2)/2.7/test.c -o $(srcCap2)/2.7/test.o	
listing-2.9: $(srcCap2)/2.9/tifftest.c
	mkdir -p $(binCap2)/2.9
	gcc -o $(binCap2)/2.9/tifftest $(srcCap2)/2.9/tifftest.c -ltiff
	@echo "Ingrese como argumento ./src/capitulo_2/2.9/imagen.tiff"

#Cap3
srcCap3 = src/capitulo_3
binCap3 = bin/capitulo_3
listing-3.1: $(srcCap3)/3.1/print-pid.c
	mkdir -p $(binCap3)/3.1
	gcc $(srcCap3)/3.1/print-pid.c -o ${binCap3}/3.1/print-pid
listing-3.2: $(srcCap3)/3.2/system.c
	mkdir -p $(binCap3)/3.2
	gcc $(srcCap3)/3.2/system.c -o ${binCap3}/3.2/system
listing-3.3: $(srcCap3)/3.3/fork.c
	mkdir -p $(binCap3)/3.3
	gcc $(srcCap3)/3.3/fork.c -o ${binCap3}/3.3/fork
listing-3.4: $(srcCap3)/3.4/fork-exec.c
	mkdir -p $(binCap3)/3.4
	gcc $(srcCap3)/3.4/fork-exec.c -o ${binCap3}/3.4/fork-exec
listing-3.5: $(srcCap3)/3.5/sigusr1.c
	mkdir -p $(binCap3)/3.5
	gcc $(srcCap3)/3.5/sigusr1.c -o ${binCap3}/3.5/sigusr1
listing-3.6: $(srcCap3)/3.6/zombie.c
	mkdir -p $(binCap3)/3.6
	gcc $(srcCap3)/3.6/zombie.c -o ${binCap3}/3.6/zombie
listing-3.7: $(srcCap3)/3.7/sigchld.c
	mkdir -p $(binCap3)/3.7
	gcc $(srcCap3)/3.7/sigchld.c -o ${binCap3}/3.7/sigchld

#Cap4
srcCap4 = src/capitulo_4
binCap4 = bin/capitulo_4
listing-4.1: $(srcCap4)/4.1/thread-create.c
	mkdir -p $(binCap4)/4.1
	gcc $(srcCap4)/4.1/thread-create.c -o $(binCap4)/4.1/thread-create -lpthread
listing-4.2: $(srcCap4)/4.2/thread-create2.c
	mkdir -p $(binCap4)/4.2
	gcc $(srcCap4)/4.2/thread-create2.c -o $(binCap4)/4.2/thread-create2 -lpthread
listing-4.3: $(srcCap4)/4.3/thread-create2.c
	mkdir -p $(binCap4)/4.3
	gcc $(srcCap4)/4.3/thread-create2.c -o $(binCap4)/4.3/thread-create2 -lpthread
listing-4.4: $(srcCap4)/4.4/primes.c
	mkdir -p $(binCap4)/4.4
	gcc $(srcCap4)/4.4/primes.c -o $(binCap4)/4.4/primes -lpthread
listing-4.5: $(srcCap4)/4.5/detached.c
	mkdir -p $(binCap4)/4.5
	gcc $(srcCap4)/4.5/detached.c -o $(binCap4)/4.5/detached -lpthread
listing-4.6: $(srcCap4)/4.6/critical-section.c
	mkdir -p $(binCap4)/4.6
	gcc $(srcCap4)/4.6/critical-section.c -o $(binCap4)/4.6/critical-section -lpthread
listing-4.7: $(srcCap4)/4.7/tsd.c
	mkdir -p $(binCap4)/4.7
	gcc $(srcCap4)/4.7/tsd.c -o $(binCap4)/4.7/tsd -lpthread
listing-4.8: $(srcCap4)/4.8/cleanup.c
	mkdir -p $(binCap4)/4.8
	gcc $(srcCap4)/4.8/cleanup.c -o $(binCap4)/4.8/cleanup -lpthread
listing-4.9: $(srcCap4)/4.9/cxx-exit.cpp
	mkdir -p $(binCap4)/4.9
	g++ $(srcCap4)/4.9/cxx-exit.cpp -o $(binCap4)/4.9/cxx-exit -lpthread
listing-4.10: $(srcCap4)/4.10/job-queue1.c
	mkdir -p $(binCap4)/4.10
	gcc $(srcCap4)/4.10/job-queue1.c -o $(binCap4)/4.10/job-queue1 -lpthread
listing-4.11: $(srcCap4)/4.11/job-queue2.c
	mkdir -p $(binCap4)/4.11
	gcc $(srcCap4)/4.11/job-queue2.c -o $(binCap4)/4.11/job-queue2 -lpthread
listing-4.12: $(srcCap4)/4.12/job-queue3.c
	mkdir -p $(binCap4)/4.12
	gcc $(srcCap4)/4.12/job-queue3.c -o $(binCap4)/4.12/job-queue3 -lpthread
listing-4.13: $(srcCap4)/4.13/spin-condvar.c
	mkdir -p $(binCap4)/4.13
	gcc $(srcCap4)/4.13/spin-condvar.c -o $(binCap4)/4.13/spin-condvar -lpthread
listing-4.14: $(srcCap4)/4.14/condvar.c
	mkdir -p $(binCap4)/4.14
	gcc $(srcCap4)/4.14/condvar.c -o $(binCap4)/4.14/condvar -lpthread
listing-4.15: $(srcCap4)/4.15/thread-pid.c
	mkdir -p $(binCap4)/4.15
	gcc $(srcCap4)/4.15/thread-pid.c -o $(binCap4)/4.15/thread-pid -lpthread

#Cap5
srcCap5 = src/capitulo_5
binCap5 = bin/capitulo_5
listing-5.1: $(srcCap5)/5.1/shm.c
	mkdir -p $(binCap5)/5.1
	gcc $(srcCap5)/5.1/shm.c  -o ${binCap5}/5.1/shm
listing-5.2: $(srcCap5)/5.2/sem_all_deall.c
	mkdir -p $(binCap5)/5.2
	gcc $(srcCap5)/5.2/sem_all_deall.c  -o ${binCap5}/5.2/sem_all_deall
listing-5.3: $(srcCap5)/5.3/sem_init.c
	mkdir -p $(binCap5)/5.3
	gcc $(srcCap5)/5.3/sem_init.c  -o ${binCap5}/5.3/sem_init
listing-5.4: $(srcCap5)/5.4/sem_pv.c
	mkdir -p $(binCap5)/5.4
	gcc $(srcCap5)/5.4/sem_pv.c  -o ${binCap5}/5.4/sem_pv
listing-5.5: $(srcCap5)/5.5/mmap-write.c
	mkdir -p $(binCap5)/5.5
	gcc $(srcCap5)/5.5/mmap-write.c  -o ${binCap5}/5.5/mmap-write
listing-5.6: $(srcCap5)/5.6/mmap-read.c
	mkdir -p $(binCap5)/5.6
	gcc $(srcCap5)/5.6/mmap-read.c  -o ${binCap5}/5.6/mmap-read
listing-5.7: $(srcCap5)/5.7/pipe.c
	mkdir -p $(binCap5)/5.7
	gcc $(srcCap5)/5.7/pipe.c  -o ${binCap5}/5.7/pipe
listing-5.8: $(srcCap5)/5.8/dup2.c
	mkdir -p $(binCap5)/5.8
	gcc $(srcCap5)/5.8/dup2.c  -o ${binCap5}/5.8/dup2
listing-5.9: $(srcCap5)/5.9/popen.c
	mkdir -p $(binCap5)/5.9
	gcc $(srcCap5)/5.9/popen.c  -o ${binCap5}/5.9/popen
listing-5.10: $(srcCap5)/5.10/socket-server.c
	mkdir -p $(binCap5)/5.10
	gcc $(srcCap5)/5.10/socket-server.c  -o ${binCap5}/5.10/socket-server
listing-5.11: $(srcCap5)/5.11/socket-client.c
	mkdir -p $(binCap5)/5.11
	gcc $(srcCap5)/5.11/socket-client.c  -o ${binCap5}/5.11/socket-client
listing-5.12: $(srcCap5)/5.12/socket-inet.c
	mkdir -p $(binCap5)/5.12
	gcc $(srcCap5)/5.12/socket-inet.c  -o ${binCap5}/5.12/socket-inet

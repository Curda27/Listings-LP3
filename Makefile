listings := listing-1
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

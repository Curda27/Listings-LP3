cap1 = src/capitulo_1
listing1: $(cap1)/main.c $(cap1)/reciprocal.hpp $(cap1)/reciprocal.cpp
	mkdir -p bin/capitulo_1
	gcc $(cap1)/main.c $(cap1)/reciprocal.hpp $(cap1)/reciprocal.cpp -o bin/capitulo_1/reciprocal
clean:
	@rm -r bin

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

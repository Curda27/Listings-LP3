cap1 = src/capitulo_1
listing-1.1: $(cap1)/main.c $(cap1)/reciprocal.hpp $(cap1)/reciprocal.cpp
	mkdir -p bin/capitulo_1
	gcc $(cap1)/main.c $(cap1)/reciprocal.hpp $(cap1)/reciprocal.cpp -o bin/capitulo_1/reciprocal

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
	

clean:
	@rm -r bin
cap1 = src/capitulo_1
listing1: $(cap1)/main.c $(cap1)/reciprocal.hpp $(cap1)/reciprocal.cpp
	mkdir -p bin/capitulo_1
	gcc $(cap1)/main.c $(cap1)/reciprocal.hpp $(cap1)/reciprocal.cpp -o bin/capitulo_1/reciprocal
clean:
	@rm -r bin
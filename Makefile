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
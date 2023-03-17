SDL=$(shell sdl-config --cflags --libs)

default: snake run

run: snake
	./snake

snake: snake.c
	gcc -std=c99 -Wall -Werror $(SDL) snake.c -o snake

web: snake.html

snake.html:
	emcc -O3 -s ASYNCIFY snake.c -o snake.html

clean:
	rm -f snake snake.js snake.wasm snake.html

.PHONY: default run web clean

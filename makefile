sdl-wasm:
	echo "odin build"
	odin build src -target=freestanding_wasm32 -out:odin -build-mode:obj -debug -show-system-calls

	echo "emcc build"
	# emcc -o index.html ../src/main.c odin.wasm.o ../lib/libraylib.a --use-port=sdl2 -DWEB_BUILD -sSTACK_SIZE=$STACK_SIZE -s TOTAL_MEMORY=$HEAP_SIZE -sERROR_ON_UNDEFINED_SYMBOLS=0
	# emcc -o index.html ../src/main.c odin.wasm.o --use-port=sdl2 -DWEB_BUILD -sSTACK_SIZE=$STACK_SIZE -s TOTAL_MEMORY=$HEAP_SIZE -sERROR_ON_UNDEFINED_SYMBOLS=0

	emcc src/main.c \
	odin.wasm.o \
	-s WASM=1 \
	-s USE_SDL=2 \
	-s USE_SDL_IMAGE=2 \
	-s SDL2_IMAGE_FORMATS='["png"]' \
	--preload-file assets \
	-o index.js

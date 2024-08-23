sdl-wasm:
	echo "odin build"
	mkdir -p build
	odin build src -target=freestanding_wasm32 -out:build/odin -build-mode:obj -debug -show-system-calls

	echo "emcc build"
	cp index.html build/

	EMSDK_PYTHON=/usr/bin/python3 emcc src/main.c \
	build/odin.wasm.o \
	-s WASM=1 \
	-s USE_SDL=2 \
	-s USE_SDL_IMAGE=2 \
	-s SDL2_IMAGE_FORMATS='["png"]' \
	--preload-file assets \
	-o build/index.js

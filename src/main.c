#include <emscripten/emscripten.h>

extern void init_sdl();
extern void step();
extern void clean_up();

int main() {
    init_sdl();

    emscripten_set_main_loop(step, 0, 1);

    clean_up();
    return 0;
}

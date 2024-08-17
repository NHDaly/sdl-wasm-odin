#include <emscripten/emscripten.h>

extern void init_game();
extern void step();
extern void clean_up();

int main() {
    init_game();

    emscripten_set_main_loop(step, 0, 1);

    clean_up();
    return 0;
}

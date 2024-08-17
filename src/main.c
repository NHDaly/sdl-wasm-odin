#include <emscripten/emscripten.h>

extern void _main();
extern void step();
extern void clean_up();

int main() {
    _main();

    emscripten_set_main_loop(step, 0, 1);

    clean_up();
    return 0;
}

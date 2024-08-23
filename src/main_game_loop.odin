package main

import "base:runtime"
import "core:mem"

// when TARGET == .freestanding_wasm32 {

import sdl2 "sdl2"
// import sdl2 "vendor:sdl2"
// main :: proc () {
//     init_sdl()

//     for {
//         step()
// 		sdl2.Delay(16)
//     }

//     clean_up()
// }

ctx: runtime.Context

tempAllocatorData: [mem.Megabyte * 4]byte
tempAllocatorArena: mem.Arena

mainMemoryData: [mem.Megabyte * 16]byte
mainMemoryArena: mem.Arena

@(export, link_name="init_sdl")
init_sdl :: proc "c" () {
    ctx = runtime.default_context()
    context = ctx

    // Initialize the allocators used in this application.
    mem.arena_init(&mainMemoryArena, mainMemoryData[:])
    mem.arena_init(&tempAllocatorArena, tempAllocatorData[:])

    ctx.allocator      = mem.arena_allocator(&mainMemoryArena)
    ctx.temp_allocator = mem.arena_allocator(&tempAllocatorArena)

    context = ctx

    // Test the allocator works
    x := new(i64)
    assert(x != nil)

    // Initialize the game
    initialize_sdl()
}

@(export, link_name="step")
step :: proc "contextless" () {
    context = ctx
    // free_all(context.temp_allocator)
    run_game_frame()
}

@(export, link_name="clean_up")
clean_up :: proc "contextless" () {
    context = ctx
    // free_all(context.temp_allocator)
    clean_up_the_game()
}

clean_up_the_game :: proc() {
	sdl2.Quit()
}

gWindow : ^sdl2.Window
gRenderer : ^sdl2.Renderer

initialize_sdl :: proc() {

	assert(sdl2.Init(sdl2.INIT_VIDEO) == 0, sdl2.GetErrorString())

	window := sdl2.CreateWindow(
		"Odin Game",
		sdl2.WINDOWPOS_CENTERED,
		sdl2.WINDOWPOS_CENTERED,
		640,
		480,
		sdl2.WINDOW_SHOWN,
	)
	assert(window != nil, sdl2.GetErrorString())
	gWindow = window
    // Must not do VSync because we run the tick loop on the same thread as rendering.
    gRenderer = sdl2.CreateRenderer(window, -1, sdl2.RENDERER_SOFTWARE) // software=0

    init_game()
}

run_game_frame :: proc() {
    // On each frame, clear the temp_allocator.
    // free_all(context.temp_allocator)

	renderer := gRenderer

    event: sdl2.Event
    for sdl2.PollEvent(&event) {
        #partial switch event.type {
        case .QUIT:
            // TODO
            assert(false)
            return
        }
        handle_event(event)
    }

    update_game()

    render_game(renderer)

    sdl2.RenderPresent(renderer)
}


package main

import "base:runtime"
import "core:fmt"
import "core:math/rand"
import "core:math/linalg"

import sdl2 "sdl2"
// import sdl2 "vendor:sdl2"

PLAYER_SPEED := 100.0 // pixels per second


Game :: struct {
	dt:       f64,
}

game: ^Game;

x,y : f32 = 10,10

init_game :: proc() {
    game = new(Game)

    game.dt = f64(FRAME_MS) / f64(1000)   // seconds
}

handle_event :: proc(event: sdl2.Event) {
    #partial switch event.type {
    case .KEYDOWN:
    }
}

update_game :: proc() {
	keyboard: []u8 = sdl2.GetKeyboardStateAsSlice()
    speed := f32(PLAYER_SPEED * game.dt);
    if b8(keyboard[sdl2.SCANCODE_UP   ]) | b8(keyboard[sdl2.SCANCODE_W]) { y -= speed }
    if b8(keyboard[sdl2.SCANCODE_DOWN ]) | b8(keyboard[sdl2.SCANCODE_S]) { y += speed }
    if b8(keyboard[sdl2.SCANCODE_LEFT ]) | b8(keyboard[sdl2.SCANCODE_A]) { x -= speed }
    if b8(keyboard[sdl2.SCANCODE_RIGHT]) | b8(keyboard[sdl2.SCANCODE_D]) { x += speed }
}

render_game :: proc(renderer: ^sdl2.Renderer) {

    sdl2.SetRenderDrawColor(renderer, 0, 0, 0, 0xff)
    sdl2.RenderClear(renderer)

    sdl2.SetRenderDrawColor(renderer, 0xff, 0xff, 0xff, 0xff)
    rect := sdl2.Rect{i32(x), i32(y), 100, 100}
    sdl2.RenderDrawRect(renderer, &rect)
}

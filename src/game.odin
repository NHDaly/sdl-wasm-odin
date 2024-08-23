
package main

import "base:runtime"
import "core:fmt"
import "core:math/rand"
import "core:math/linalg"

import sdl2 "sdl2"
// import sdl2 "vendor:sdl2"


Game :: struct {
	time:     f64,
	dt:       f64,
}


init_game :: proc() {
    game := new(Game)
    game.time = 10.0
    game.dt = 10.0
}

handle_event :: proc(event: sdl2.Event) {
    #partial switch event.type {
    case .KEYDOWN:
    }
}

update_game :: proc() {

}

render_game :: proc(renderer: ^sdl2.Renderer) {

    sdl2.SetRenderDrawColor(renderer, 0, 0, 0, 0xff)
    sdl2.RenderClear(renderer)

    sdl2.SetRenderDrawColor(renderer, 0xff, 0xff, 0xff, 0xff)
    rect := sdl2.Rect{10, 10, 100, 100}
    sdl2.RenderDrawRect(renderer, &rect)
}

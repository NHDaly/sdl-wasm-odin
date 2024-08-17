
package main

import "base:runtime"
import "core:fmt"
import "core:mem"
import "core:math/rand"
import "core:math/linalg"

import sdl2 "sdl2"

x,y : i32 = 10,10

init_game :: proc() {

}

handle_event :: proc(event: sdl2.Event) {
    #partial switch event.type {
    case .KEYDOWN:
    }
}

update_game :: proc() {
	keyboard: []u8 = sdl2.GetKeyboardStateAsSlice()
    if b8(keyboard[sdl2.SCANCODE_UP   ]) | b8(keyboard[sdl2.SCANCODE_W]) { y -= 1 }
    if b8(keyboard[sdl2.SCANCODE_DOWN ]) | b8(keyboard[sdl2.SCANCODE_S]) { y += 1 }
    if b8(keyboard[sdl2.SCANCODE_LEFT ]) | b8(keyboard[sdl2.SCANCODE_A]) { x -= 1 }
    if b8(keyboard[sdl2.SCANCODE_RIGHT]) | b8(keyboard[sdl2.SCANCODE_D]) { x += 1 }
}

render_game :: proc(renderer: ^sdl2.Renderer) {

    sdl2.SetRenderDrawColor(renderer, 0, 0, 0, 0xff)
    sdl2.RenderClear(renderer)

    sdl2.SetRenderDrawColor(renderer, 0xff, 0xff, 0xff, 0xff)
    rect := sdl2.Rect{x, y, 100, 100}
    sdl2.RenderDrawRect(renderer, &rect)
}

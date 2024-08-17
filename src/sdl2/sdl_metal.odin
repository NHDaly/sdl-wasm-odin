package sdl2


import c "vendor_c"

when ODIN_OS == .Windows {
//	foreign import lib "sdl2"
} else {
//	foreign import lib "sdl2"
}

MetalView :: distinct rawptr

@(default_calling_convention="c", link_prefix="SDL_")
foreign {
	Metal_CreateView      :: proc(window: ^Window) -> MetalView ---
	Metal_DestroyView     :: proc(view: MetalView) ---
	Metal_GetLayer        :: proc(view: MetalView) -> rawptr ---
	Metal_GetDrawableSize :: proc(window: ^Window, w, h: ^c.int) ---
}

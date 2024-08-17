# sdl-wasm-odin [![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

A simple example of compiling Odin/SDL to WebAssembly and binding it to an HTML5 canvas.

Live demo available here: https://nhdaly.github.io/sdl-wasm-odin/

## Installation:

1. Install Emscripten:<br/>
https://emscripten.org/docs/getting_started/downloads.html

2. Clone the repository:<br/>
`git clone https://github.com/NHDaly/sdl-wasm-odin`<br/>
`cd sdl-wasm`

3. Run `make`, which does `odin build src` for wasm, then builds a wasm binary via `emcc`.

4. Chrome doesn't support file XHR requests so you need to open index.html from a web server. You can use Emscripten for that too:
`emrun index.html`

5. Edit src/game.odin to make your own game!
<br/>

<img width="640" alt="screen" src="https://user-images.githubusercontent.com/3165988/57870831-c38f0d80-77bc-11e9-9b37-19b64d8f22a7.png">

## Todos:

- [x] Add keyboard input controls to move the square around
- [ ] Figure out why things crash with an Odin allocation. See: https://github.com/odin-lang/Odin/discussions/4097

## MIT license:

```
Copyright (c) 2024 Nathan Daly

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

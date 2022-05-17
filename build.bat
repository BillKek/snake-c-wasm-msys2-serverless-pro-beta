
SET PATH=C:/msys64;C:\msys64\clang64\bin;C:/msys64/clang64;C:/msys64/clang64/include;C:/msys64/clang64/lib;%PATH%

clang -Os -fno-builtin -Wall -Wextra -Wswitch-enum --target=wasm32 --no-standard-libraries -Wl,--export=game_init -Wl,--export=game_render -Wl,--export=game_update -Wl,--export=game_info -Wl,--export=game_keydown -Wl,--no-entry -Wl,--allow-undefined  -o game.wasm game.c -LC:/msys64/clang64/lib

wasm2js.exe game.wasm > game.js
copy /b wasm_main_part1.js+game.js+wasm_main_part2.js wasm_main.js

"C:\Program Files\Mozilla Firefox\firefox.exe" %~dp0index.html


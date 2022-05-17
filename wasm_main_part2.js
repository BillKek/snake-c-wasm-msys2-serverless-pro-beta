

WebAssembly.instantiate(wasm_codearray, {
    env: {
        platform_fill_rect,
        platform_stroke_rect,
        platform_fill_text,
        platform_panic,
        platform_log
    }
}).then((w) => {
    wasm = w;

    wasm.instance.exports.game_init(app.width, app.height);

    document.addEventListener('keydown', (e) => {
        wasm.instance.exports.game_keydown(e.key.charCodeAt());
    });

    const buffer = wasm.instance.exports.memory.buffer;

    window.requestAnimationFrame(loop);
});

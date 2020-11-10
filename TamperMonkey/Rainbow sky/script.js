// ==UserScript==
// @name         RGB Sky
// @description  RGB Krunker Sky
// @author       hitthemoney
// @match        *://krunker.io/*
// @grant        none
// ==/UserScript==

let startCol = "red"
let kr;

// Prevents sky dome from generating and calls the init function
Object.defineProperty(Object.prototype, "skyCol", { enumerable: false, get () { init(); return startCol; }})

// Hooks renderer
Object.defineProperty(Object.prototype, "renderer", {
    enumerable: false,
    get() {
        kr = this;
        return this._renderer;
    },
    set(v) {
      this._renderer = v
    }
})

// Main Function
var init = (() => {
    let hasRan = false;
    let hue = 0;
    let color = startCol;
    return () => {
        if (!!kr.renderer && !hasRan) {
            color = new (kr.renderer.getClearColor()).constructor(color);
            hasRan = true;
            setInterval(() => {
                let bc = color.getHSL({})
                color.setHSL( hue, bc.s, bc.l );
                kr.renderer.setClearColor(color);
                hue += 0.01;
            }, 50)
        }
    }
})();

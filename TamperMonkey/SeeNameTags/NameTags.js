// ==UserScript==
// @name         Krunker NameTags
// @namespace    https://github.com/ZaResX/KrunkerZares/
// @version      2.4.7
// @description  Why am I able to see names through walls
// @author       ZaRes X
// @match        *://krunker.io/*
// @run-at       document-start
// @grant        none
// ==/UserScript==

(function() {
    'use strict';
    let initialize = function(data) {
        let regex = /if\(!\w+\['(\w+)']\)continue/; //Hook
        let result = regex.exec(data);
        if (result) {
            const inView = result[1];
            const push = Array.prototype.push;
            Array.prototype.push = function(...args) {
                push.apply(this, args);
                if (args[0] instanceof Object && args[0].isPlayer) { //isPlayer is the value. If this get patched change isPlayer to new value to make it work
                    Object.defineProperty(args[0], inView, {value: true, configurable: false});
                }
            }
        }
    }
    const decode = window.TextDecoder.prototype.decode; 
    window.TextDecoder.prototype.decode = function(...args) {
        let data = decode.apply(this, args);
        if (data.length > 1050000) {
            initialize(data);
        }
        return data;
    }
})();
// https://github.com/hrt/KrunkerBypass/blob/master/ArrayHook/esp.js

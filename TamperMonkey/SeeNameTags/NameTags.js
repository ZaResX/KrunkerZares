// ==UserScript==
// @name         Krunker NameTags
// @namespace    https://skidlamer.github.io/
// @version      0.2
// @description  self leak
// @author       SkidLamer, fixed by chomler
// @match        *://krunker.io/*
// @run-at       document-start
// @grant        none
// ==/UserScript==

(function() {
    'use strict';
    let inView
    const initialize = function(data) {
        let result = /if\(!\w+\['(\w+)']\)continue/.exec(data);
        if (result) {
            inView = result[1];
        }
    }
    const decode = window.TextDecoder.prototype.decode;
    const decodeHook = function(...args) {
        let data = decode.apply(this, args);
        if (data.length > 1050000) {
            initialize(data);
        }
        return data;
    }
    const push = Array.prototype.push;
    const pushHook = function(...args) {
        push.apply(this, args);
        if (inView) {
            if (args[0] instanceof Object && args[0].isPlayer) {
                Object.defineProperty(args[0], inView, {value: true, configurable: false});
            }
        }
    }
    window.Object.defineProperty = new Proxy(Object.defineProperty, {
        apply(target, thisArg, argArray) {
            argArray[2].configurable = true;
            if (argArray[2].get && argArray[2].get.name.startsWith("get_")) {
                if (argArray[1] === "decode")
                    argArray[2].get =_=> decodeHook
                else if (argArray[1] === "cpush")
                    argArray[2].get =_=> pushHook
            }
            return target.apply(thisArg, argArray)
        }
    })
})();
//https://discord.com/channels/692606346645733396/701441000400224266/740498576567828492

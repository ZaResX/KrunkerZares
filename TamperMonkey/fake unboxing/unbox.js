// ==UserScript==
// @name         Krunker Fake Unboxing script
// @namespace    http://tampermonkey.net/
// @version      2.7.2+
// @author       chomler
// @description  PLZ DONT STEAL IT IT TOOK TIME TO WRITE
// @match        *://krunker.io/*
// @require      https://raw.githubusercontent.com/ygoe/msgpack.js/master/msgpack.min.js
// @run-at       document-start
// @grant        none
// ==/UserScript==

// WARNING
// This script is only visual, it doesn't actually give you the items you spin but you can prank your friends that you got unobtainable items using it
// It also nullifies the spin so you don't need to care about KR
// DISABLE THIS SCRIPT AFTER YOU ARE DONE, OR ELSE YOU WON'T BE ABLE TO SPIN


// CHANGE THIS TO CHANGE THE ITEM YOU'LL GET FROM THE SPIN (YOU CAN GET ITEM ID'S FROM MY SKIN HACK - they are the count of the skins (for exemple 1405 for the unobtainable sniper))
const fakeUnboxingItemId = 1405;
// CHANGE THIS TO CHOOSE WHERE THE SPIN WILL LAND (For heroic spin: 0-48 - rare; 48-83 - epic; 83-97 - legendary; 97-99.5 - relic; 99.5-100 - contraband; 100 - unobtainable)
const fakeUnboxingCircleRotation = 100;
// CHANGE THIS TO CHANGE HOW MUCH KR THE SPIN WILL CONSUME (THIS IS ONLY VISUAL AND WONT ACTUALLY CHANGE YOUR KR)
const krStep = 500;


(function () {
    const FakeServerMessage = (conn, msg) => conn.onmessage(new MessageEvent("b", {data:new Uint8Array([...msgpack.serialize(msg),0,0])}))
    window.WebSocket = new Proxy(window.WebSocket, {
        construct(target, args) {
            const ws = new target(...args);
            Object.defineProperty(ws, "send", {configurable: true, value: new Proxy(ws.send, {
                apply(target, that, args) {
                    let msg = window.msgpack.deserialize(args[0])
                    if (msg[0] === "spin") {
                        msg = ["po"]
                        FakeServerMessage(ws, ["spin", null, fakeUnboxingCircleRotation, fakeUnboxingItemId, document.getElementById("spinKR").innerText.replace(/,/, "").replace(" KR", "")-krStep, null])
                    }
                    args[0] = new Uint8Array([...msgpack.serialize(msg), ...args[0].slice(args[0].length - 2)])
                    target.apply(that, args);
                }
            })})
            return ws;
        }
    });
})();

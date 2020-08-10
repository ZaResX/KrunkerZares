// ==UserScript==
// @name         Community Skid
// @namespace    http://skidlamer.github.io/
// @version      3.1
// @description  Gaming Gurus!
// @author       SkidLamer
// @iconURL      https://cdn.discordapp.com/icons/692606346645733396/2c8c01e76973634afcaec17d22ba5e80.webp?size=128
// @require      https://rawgit.com/kawanet/msgpack-lite/master/dist/msgpack.min.js
// @match        *://krunker.io/*
// @run-at       document-start
// @grant        none
// ==/UserScript==
/* eslint-disable no-caller */


/*
  * Features:
  * Unlocked Player NameTags
  * Player Chams
  * Player WireFrame
  * Auto Slide (Hold SpaceKey)
  * Auto Reload
*/

(function() {
    let skid = [...Array(16)].map(() => Math.random().toString(36)[2]).join('');
    let isProxy = Symbol("isProxy");
    let frameCount = 0;
    let isType = (item, type) => {
        return typeof item === type;
    }
    let isDefined = (object) => {
        return !isType(object, "undefined")
    }
    let canStore = (typeof(Storage) !== "undefined");
    let saveVal = function(name, val) {
        if (canStore) localStorage.setItem(name, val);
    }
    let deleteVal = function(name) {
        if (canStore) localStorage.removeItem(name);
    }
    let getSavedVal = function(name) {
        if (canStore) return localStorage.getItem(name);
        return null;
    }
    Object.defineProperty(CanvasRenderingContext2D.prototype, skid, {
        value: CanvasRenderingContext2D.prototype.save,
    });
    AudioParam.prototype.setTargetAtTime = function(...args) {
        return 0;
        //return setTargetAtTime.apply(this, arguments)
    }
    let intitialize = (script) => {
        let log = (...args) => console.log("[SKID] ".concat(...args));
        let vars = new Map()
        .set("isYou", {regex:/if\(\w+\['(\w+)']\|\|!\w+\['(\w+)']\)continue;if\(!\w+\['(\w+)']\)continue;/,pos:1})
        .set("inView", {regex:/if\(!\w+\['(\w+)']\)continue/,pos:1})
        .set("objInstances", {regex: /\w+\['genObj3D']\(0x0,0x0,0x0\);if\(\w+\['(\w+)']=\w+\['genObj3D']/,pos:1})
        .set("ammos", {regex:/\['noReloads']\|\|!\w\['\w+']&&\w\['(\w+)']/,pos:1})
        .set("weaponIndex", {regex:/\['noReloads']\|\|!\w\['\w+']&&\w\['\w+']\[\w\['(\w+)']]/,pos:1})

        for (const [name, object] of vars.entries()) {
            let result = object.regex.exec(script);
            if ( result ) {
                object.val = result[object.pos];
                log("found: ", name, " at ", result.index, " value: ", object.val);
            } else {
                object.val = null;
                alert("Failed to find ", name);
            }
        }

        if (vars.get("inView").val) {
            Object.freeze = new Proxy(Object.freeze, {
                apply: function(target, that, args) {
                    let Caller = arguments.callee.caller;
                    if (Caller && Caller.arguments.length == 5 && Caller.arguments[0].ACESFilmicToneMapping) {
                        ((three, utils, colors, config, overlay) => {
                            if (!config.hasOwnProperty(skid)) {
                                config[skid] = new Function();
                                config[skid].downKeys = new Set();
                                config[skid].keyDown = (key) => config[skid].downKeys && config[skid].downKeys.has(key);
                                config[skid].features = [];
                                config[skid].feature = function(name, keybind, status) {
                                    this.name = name;
                                    this.keybind = keybind;
                                    this.status = status;
                                }
                                config[skid].getFeature = function(name) {
                                    let feature = null;
                                    config[skid].features.forEach((item)=> {
                                        if (item.name === name) feature = item;
                                    });
                                    return feature;
                                }
                                // Add Features
                                config[skid].features.push(new config[skid].feature("NameTags", "Digit2", parseInt(getSavedVal("utilities_NameTags"))||false));
                                config[skid].features.push(new config[skid].feature("Chams", "Digit3", parseInt(getSavedVal("utilities_Chams"))||false));
                                config[skid].features.push(new config[skid].feature("WireFrame", "Digit4", parseInt(getSavedVal("utilities_WireFrame"))||false));
                                config[skid].features.push(new config[skid].feature("AutoKeySlide", "Digit5", parseInt(getSavedVal("utilities_AutoKeySlide"))||false));
                                config[skid].features.push(new config[skid].feature("AutoReload", "Digit6", parseInt(getSavedVal("utilities_AutoReload"))||false));

                                config[skid].GUI = document.createElement('div');
                                config[skid].GUI.style = `visibility: visible;float:right;width:100%;background-color: rgba(0,0,0,0.25);border:4px solid #000000;padding:10px;border-radius:5%;text-align:center;margin-top:5%;`;
                                config[skid].guiReload = function() {
                                    config[skid].GUI.innerHTML = "";
                                    if (config[skid].GUI.style.visibility === "visible") {
                                        config[skid].GUI.innerHTML += "<p><h2 style='color:white; text-shadow: 4px 4px #000000;'> <img class='a' src='https://i.imgur.com/DqbNq4z.png' width='42' height='42'> &nbsp Gaming Guru's &nbsp <img class='a' src='https://i.imgur.com/DqbNq4z.png' width='42' height='42'> </h2><hr style='color:white'/></p>"
                                        config[skid].features.forEach((item) => {
                                            config[skid].GUI.innerHTML += `<p><span style='float:left;margin-left:10%;text-shadow: 1px 1px 0px #000000;color:rgb(216,53,255)'>[ ${item.keybind.startsWith("Digit")?item.keybind.substring(5, item.keybind.length):item.keybind} ]</span><span style='margin-left:-10%;text-shadow: 1px 1px 0px #000000;color:${item.status ? "#9eeb46" : "#eb5646"};'>${item.name}</span></p>`;
                                        });
                                        config[skid].GUI.innerHTML += "<br>";
                                    }
                                }

                                window.addEventListener("keyup", event => {
                                    if (config[skid].downKeys && config[skid].downKeys.has(event.code)) config[skid].downKeys.delete(event.code)
                                });

                                window.addEventListener('keydown', (event) => {
                                    if ('INPUT' == document.activeElement.tagName || !window.endUI && window.endUI.style.display) return;
                                    switch (event.code) {
                                        case 'F1':
                                            event.preventDefault();
                                            config[skid].GUI.style.visibility = config[skid].GUI.style.visibility == "visible" ? "hidden" : "visible";
                                            window.SOUND.play('tick_0', 0.1);
                                            break;
                                        default:
                                            if (config[skid].downKeys && !config[skid].downKeys.has(event.code)) {
                                                config[skid].downKeys.add(event.code);
                                            }
                                            config[skid].features.forEach((item) => {
                                                if (item.keybind === event.code) {
                                                    item.status ^= 1;
                                                    saveVal("utilities_" + item.name, item.status);
                                                }
                                            });
                                            break;
                                    }
                                });
                            }
                            if (!overlay.render[isProxy]) {
                                overlay.render = new Proxy(overlay.render, {
                                    apply: function(target, that, [scale, game, controls, renderer, me, delta]) {
                                        target.apply(that, [scale, game, controls, renderer, me, delta]);
                                        frameCount++; if (frameCount >= 100000) frameCount = 0;
                                        if (frameCount % 50 == 0) {
                                            let topRight = document.getElementById("topRight");
                                            if(!topRight) return;
                                            if(!topRight.contains(config[skid].GUI)) {
                                                topRight.appendChild(config[skid].GUI);
                                            } else {
                                                config[skid].guiReload();
                                            }
                                        }
                                        const ctx = overlay.canvas.getContext('2d');
                                        ctx[skid]();
                                        ctx.scale(scale, scale);
                                        (_ => {
                                            if (me && me.active) {
                                                for (let i = 0, sz = game.players.list.length; i < sz; i++) {
                                                    const player = game.players.list[i]
                                                    let obj = me[vars.get("objInstances").val];
                                                    if (player && !player[vars.get("isYou").val]) {
                                                        let obj = player[vars.get("objInstances").val];
                                                        if (isDefined(obj) && obj) {
                                                            obj.visible = true;
                                                        }
                                                        if (config[skid].getFeature("NameTags").status||0) Object.defineProperty(player, vars.get("inView").val, {value: true, configurable: true})
                                                    }
                                                }
                                                let obj = me[vars.get("objInstances").val];
                                                let chams = config[skid].getFeature("Chams").status||0;
                                                let wire = config[skid].getFeature("WireFrame").status||0;
                                                if (isDefined(obj) && obj) {
                                                    obj.traverse((child) => {
                                                        if (child && child.type == "Mesh") {
                                                            child.material.depthTest = chams ? false : true;
                                                            child.material.opacity = chams ? 0.85 : 1.0;
                                                            child.material.transparent = chams ? true : false;
                                                            child.material.fog = chams ? false : true;
                                                            if (child.material.emissive && frameCount % 50 == 0) {
                                                                child.material.emissive.r = chams ? 0.55 : 0;
                                                                child.material.emissive.g = chams ? 0.55 : 0;
                                                                child.material.emissive.b = chams ? 0.55 : 0;
                                                            }
                                                            child.material.wireframe = wire ? true : false;
                                                        }
                                                    })
                                                }
                                                let slidey = config[skid].getFeature("AutoKeySlide").status||0;
                                                if (slidey) {
                                                    if (config[skid].keyDown("Space")) {
                                                        controls.binds.jumpKey.val ^= 1;
                                                        controls.binds.crouchKey.val = (me.yVel < -0.04 && me.canSlide) ? 1 : 0;
                                                    }
                                                }
                                                let reload = config[skid].getFeature("AutoReload").status||0;
                                                if (reload) {
                                                    let ammoLeft = me[vars.get("ammos").val][me[vars.get("weaponIndex").val]];
                                                    if (ammoLeft == 0) {
                                                        game.players.reload(me);
                                                    }
                                                }
                                            }
                                        })();
                                        ctx.restore();
                                    },
                                    get: function(target, key) {
                                        const value = Reflect.get(target, key)
                                        return key === isProxy ? true : value;
                                    },
                                })
                            }
                        })(...Caller.arguments);
                    }
                    return target.apply(that, args);
                }
            });
        }
    }

    window.fetch = new Proxy(fetch, {
        apply: function(target, that, [url, options]) {
            return (async () => {
                let res = await target.apply(that, [url, options]);
                if (url.endsWith("vries")) {
                    const xor = 0x69;
                    let array = await res.clone().arrayBuffer()
                    array = await Array.from(new Uint8Array(array));
                    array = await array.map((code) => String.fromCharCode(code ^ xor));
                    let string = array.join('')
                    intitialize(string);
                }
                return res;
            })()
        }
    })

})();

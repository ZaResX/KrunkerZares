// ==UserScript==
// @name                KRUNKER ZARES
// @namespace           [Z][R][X]
// @author              ZaRes X [ZRX]
// @description         Take over krunker
// @version             2.4.7
// @supportURL          http://youtube.com/zaresx
// @match               *://krunker.io/*
// @grant               none
// ==/UserScript==
// Custom hub
//Tells you if hack is working.
alert("INJECTED ZaRes X Krunker Cheat")
//################################################
// Change the comments written below nibba with this "[Change**]"
//################################################
function randomName() {
    let characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
    var randomized = '';
    for (var i=0;i<16;i++) {
        randomized += characters[Math.floor(Math.random() * Math.floor(characters.length - 1))];
    }
    return randomized;
}

function hack(name, keybind, status) {
  this.name = name;
  this.keybind = keybind;
  this.status = status;
}

let hacks = randomName();

let getHack = randomName();
unsafeWindow[getHack] = function(name) {
    var returned;
    unsafeWindow[hacks].forEach(function(hack){
        if(hack.name === name) returned = hack;
    });
    return returned;
}

unsafeWindow[hacks] = [];
unsafeWindow[hacks].push(new hack("Aimbot", "1", true));
unsafeWindow[hacks].push(new hack("ESP", "2", true));
unsafeWindow[hacks].push(new hack("BHop", "3", true));
unsafeWindow[hacks].push(new hack("AutoReload", "4", true));
unsafeWindow[hacks].push(new hack("Pierce", "5", true));
unsafeWindow[hacks].push(new hack("3rd Person", "6", false));
unsafeWindow[hacks].push(new hack("GUI", "7", true));

window.addEventListener('keydown', (key) => {
    unsafeWindow[hacks].forEach(function(hack) {
        if(hack.keybind === String.fromCharCode(key.keyCode)) {
            hack.status = !hack.status;
        }
    });
});

var GUI = document.createElement('div');
GUI.style = "float:right;width:100%;background-color: rgba(0,0,0,0.25);border-radius:5%;text-align:center;margin-top:5%;";

function guiReload() {
    GUI.innerHTML = "";
    if(unsafeWindow[getHack]("GUI").status) {
        GUI.innerHTML += "<br><h2 style='color:#EDF500;'>KRUNKER ZARES</h2><hr>";
        unsafeWindow[hacks].forEach(function(hack) {
            GUI.innerHTML += `<h3><span style='float:left;margin-left:10%;color:#FFBD48'>[${hack.keybind}]</span><span style='margin-left:-10%;color:${hack.status ? "#98EA2F" : "#FF4040"};'>${hack.name}</span></h3>`;
        });
        GUI.innerHTML += "<br>";
    }
}

setInterval(function(){
    let topRight = document.getElementById("topRight");
    if(!topRight) return;

    if(!topRight.contains(GUI)) {
        topRight.appendChild(GUI);
    } else {
        guiReload();
    }
}, 0);

/* Basic Globals */
let inputs = randomName();
let control = randomName();
let myself = randomName();
let players = randomName();
let world = randomName();

/* Aimbot Globals */
let canShoot = randomName();
let scopedOut = randomName();
let quickscoper = randomName();
let lookAt = randomName();
let camLookAt = randomName();
let distance = randomName();

function patch(script) {

    script = script.replace(/(\!)/,
      `
        var ${inputs};
        var ${control};
        var ${myself};
        var ${players};
        var ${world};
        var ${canShoot} = true;
        var ${scopedOut} = false;
        function ${quickscoper}(target) {
            if (${myself}.didShoot) {  //found [Change**] "didShoot"
                ${canShoot} = false;
                setTimeout(() => {  //found [Change**] "setTimeout"
                    ${canShoot} = true;
                }, ${myself}.weapon.rate / 1.85);
            }
            if (${control}.mouseDownL === 1) {  //found [Change**] "mouseDownL"
                ${control}.mouseDownL = 0;  //found [Change**] "^same us upper one"
                ${control}.mouseDownR = 0;  //found [Change**]
                ${scopedOut} = true;
            }
            if (${myself}.aimVal === 1) {  //found [Change**] "aimVal"
                ${scopedOut} = false;
            }
            if (${scopedOut} || !${canShoot} || ${myself}.recoilForce > 0.01) {  //found [no need to Change as it still exist in v2.4.7**] "recoilForce"
                return false;
            }
            ${lookAt}(target);
            if (${control}.mouseDownR === 0) {  //found [Change**] "mouseDownR"
                ${control}.mouseDownR = 1;  ////found [Change**] "^same us upper one"
            }
            else if (${myself}.aimVal < 0.2) {
                ${control}.mouseDownL = 1 - ${control}.mouseDownL;  //found [Change**] "mouseDownL"
            }
            return true;
        }
        function ${lookAt}(target) {
            ${control}.${camLookAt}(target.x2, target.y2 + target.height - 1.5 - 2.5 * target.crouchVal - ${myself}.recoilAnimY * 0.3 * 25, target.z2);  //found [Change**] "recoilAnimY"
        }
        function ${distance}(p1, p2) {
            const dx = p1.x - p2.x;
            const dy = p1.y - p2.y;
            const dz = p1.z - p2.z;
            return Math.sqrt(dx * dx + dy * dy + dz * dz);
        }
      $1`
    );
    script = script.replace(/(this\[\'procInputs\'\]=function\((\w+),(\w+),(\w+),(\w+)\)\{)/, //hook
      `$1
        ${inputs} = $2;
        /* Aimbot */
        if(${getHack}("Aimbot").status) {
          if (!${myself} || ${players}.length < 1) {
              return;
          }
          const possibleTargets = ${players}.filter(player => {
              return player.active && player.${script.match(/\w+\['(\w+Seen)'\]/)[1]} && !player.isYou && (!player.team || player.team !== ${myself}.team); //replace Seen with new value :: v2.4.7 "isPlayer" [Change**] "w+Seen"
          }).sort((p1, p2) => ${distance}(${myself}, p1) - ${distance}(${myself}, p2));
          let isLockedOn = false;
          if (possibleTargets.length > 0) {
              const target = possibleTargets[0];
              isLockedOn = ${quickscoper}(target);
          } else {
              ${control}.yDr = ${control}.pitchObject.rotation.x;  //found [Change**] "pitchObject"
              ${control}.xDr = ${control}.object.rotation.y;
          }
          if(!isLockedOn) {
            ${control}.${camLookAt}(null);
            ${control}.target = null;
            ${control}.mouseDownL = 0;  //found [Change**] "mouseDownL"
            ${control}.mouseDownR = 0;  //found [Change**] "mouseDownR"
          }
        }
        /* BHop */
        if(${control}['keys'][${control}['moveKeys'][0]] && ${getHack}("BHop").status) {
          ${control}['keys'][${control}['jumpKey']] = !${control}['keys'][${control}['jumpKey']];
        }
        /* AutoReload */
        if(${myself} && ${myself}.ammos[${myself}.weaponIndex] === 0 && ${getHack}("AutoReload").status) {  //ammos v weaponIndex [Change**]
          ${inputs}[9] = 1;
        }
      `
    );
    script = script.replace(/(this\[\'update\'\]\=function\(\w+\,\w+\,(\w+)\)\{)/,
      `$1
        ${players} = this.players.list;
        ${myself} = $2;
      `
    );
    script = script.replace(/(this\[\'setCamPosOff\'\]\=)/,`${control}=this,$1`);
    script = script.replace(/{if\(this\['target']\){([^}]+)}},this\['([a-zA-Z0-9_]+)']=/,  `
      {
        if (this.target) {
            this.yDr = Math.max(-Math.PI / 2, Math.min(Math.PI / 2, this.target.xD)) % Math.PI2;
            this.xDr = this.target.yD % Math.PI2;
        }
      }, this.${camLookAt} =
    `);
    script = script.replace(/(\w+)\[\'\w+\'\](\(\w+\[\'x\'\]\,\w+\[\'y\'\]\+\w+\[\'height\'\]\/1.5\,\w+\[\'z\'\])/, `$1['${camLookAt}']$2`);
    script = script.replace(/!(\w+)\[\'transparent\'\]/g, `$& && (!${getHack}("Pierce").status || (!$1.penetrable || !${myself}.weapon.pierce))`);
    script = script.replace(/if\(!\w+\['\w+Seen'\]\)continue;/, `if(!${getHack}("ESP").status)continue;`);
    script = script.replace(/(this\[\'fpsCamera\'\]=)/, `${world}=this;$1`);
    script = script.replace(/(\w+)\[\'config\'\]\[\'thirdPerson\'\]/g, `${getHack}("3rd Person").status`);

    return script;
}

(function(){
    var hideHook = function(fn, oFn) { fn.toString = oFn.toString.bind(oFn); }

    const handler = {
      construct(target, args) {
        if (args[1].length > 840000) {
            args[1] = patch(args[1]);
        }
        return new target(...args);
      }
    };

    var original_Function = unsafeWindow.Function;
    unsafeWindow.Function = new Proxy(Function, handler);
    hideHook(unsafeWindow.Function, original_Function);
})()

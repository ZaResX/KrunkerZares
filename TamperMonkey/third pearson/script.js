// ==UserScript==
// @name         krunker third pearson
// @namespace    https://github.com/ZaResX/KrunkerZares/blob/master/TamperMonkey/third%20pearson/script.js
// @version      0.1
// @description  krunker third pearson
// @author       ZaRes X
// @match        *://krunker.io/*
// @grant        none
// ==/UserScript==

(function() {
    'use strict';
    Object.defineProperty(
    Object.prototype,
    "thirdPerson",
    { enumerable: false,
     get() {
         return true
     },
});
})(); 
//use https://github.com/ZaResX/KrunkerZares/blob/master/explore/game.js/version/2.9.8.js to learn how to make. Basic 3rd person.

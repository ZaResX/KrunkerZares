// ==UserScript==
// @name         CSS for krunker
// @namespace    CSS
// @version      0.1
// @description  CSS
// @author       Vexed
// @match        *://krunker.io/*
// @grant        none
// @run-at       document-end
// ==/UserScript==

let topsheet = document.getElementsByTagName("link")[4];
let sheet = document.createElement("link");
sheet.setAttribute("href", "https://dl.dropbox.com/s/jcora5b6p9tzthy/Krunker_CSS.css?dl=0");
sheet.setAttribute("rel", "stylesheet");
topsheet.after(sheet);

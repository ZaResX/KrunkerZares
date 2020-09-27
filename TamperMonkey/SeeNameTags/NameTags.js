// ==UserScript==
// @name         Krunker NameTags
// @author       ɹaɹoldxa ʇauɹaʇu!#2036
// @description  More krunker mods here : https://discord.gg/B9CrQ3a
// @grant        GM.xmlHttpRequest
// @match        *://krunker.io/*
// @run-at       document-start
// ==/UserScript==
(async(f) => {
  f = await GM.xmlHttpRequest({
    url : "https://krunker.io/social.html",
    responseType : "json"
  });
  b = await GM.xmlHttpRequest({
    url : `https://krunker.io/pkg/krunker.${/\w.exports="(\w+)"/.exec(f.responseText)[1]}.vries`,
    responseType : "arrayBuffer"
  });
  c = Array.from(new Uint8Array(b.response));
  d = 33 ^ c[0];
  e = c.map((c) => {
    return String.fromCharCode(c ^ d);
  }).join("");
  Object.defineProperty(Object.prototype, /if\(!\w+\['(\w+)']\)continue/.exec(e)[1], {
    get() {
      return 0 == this._ || this._;
    },
    set(next) {
      this._ = next;
    }
  });
})();

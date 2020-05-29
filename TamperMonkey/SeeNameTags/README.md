__________________________________
># NameTags "See enemies thru walls"
__________________________________
>**NameTags** usage
1. Open `NameTags.js` or *[Click Here](https://raw.githubusercontent.com/ZaResX/KrunkerZares/master/TamperMonkey/SeeNameTags/NameTags.js)*
2. Install `tampermonkey` to your browser
3. Make a new script
4. Paste the script and save it
5. Open *https://krunker.io/*
>Your able to see your enemies now
__________________________________
>**How to fix** `NameTags.js` if it get's patched?
>- `NameTags.js` which works for `v2.4.5` will be archived [Here](https://github.com/ZaResX/KrunkerZares/releases/download/2.4.5.0/NameTags.js). Anyways if you want to learn how to fix it go here and explore the game code for `game.js` `v2.4.5`[Here](https://github.com/ZaResX/KrunkerZares/blob/master/explore/game.js/version/2.4.5.js). 
__________________________________
>- **So let's get to basics.**
- `First of all I don't have much knowledge on this and I can make something wrong but if I do I'll try to learn and to fix it as fast as I can.`
1. Open `game.js` for `v2.4.5` [Here](https://github.com/ZaResX/KrunkerZares/blob/master/explore/game.js/version/2.4.5.js) and `NameTags.js` for `v2.4.5` [Here](https://github.com/ZaResX/KrunkerZares/releases/download/2.4.5.0/NameTags.js).
2. Find the code in `NameTags.js` and find this coming things
```js 
if (args[0] instanceof Object && args[0].isPlayer)
```
```js
let regex = /if\(!\w+\['(\w+)']\)continue/; //this is the hook. You can look to change it if it's broken
```
>So `isPlayer` is the function we want.
3. Open `game.js` and search for `isPlayer` value. And we will find
```js
this['isPlayer'] = !0x0, //line 129648
```
```js
aX['elm']['children'][0x4]['style']['display'] = aU['spectTarget'] && aU['spectTarget']['isPlayer'] && aU['spectTarget']['sid'] == aX['player']['sid'] ? 'inline-block' : //line 137559
```
```js
aU['spectTarget']['isPlayer'] && aT['players'] && aT['players']['list'] && 0x0 > aT['players']['list']['indexOf'](aU['spectTarget'])) //line 138279
```
```js
aU['spectTarget']['isPlayer'] && (!cu['crouch'] && (cu['crouch'] = 0x0), //line 138300
```
>So we found it 4 times.
4. And the hook in `NameTags.js` `let regex = /if\(!\w+\['(\w+)']\)continue/;` we need to find it.


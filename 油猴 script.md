# 油猴 Script

## Fucking CSDN blog

```javascript
// ==UserScript==
// @name         Fucking csdn blog
// @namespace    https://cn.bing.com
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        *://*.bing.com/*
// @match        *://*.baidu.com/*
// @icon         https://www.google.com/s2/favicons?sz=64&domain=bing.com
// @grant        none
// ==/UserScript==


(function () {
	"use strict";
    const targetService = ~function () {
        const ServiceMap = {
            www.baidu.com: 'baidu',
            cn.bing.com: 'bing',
        }
        const host = localtion.host

        return ServiceMap[host];
    }();
    const targetDomMap = {
        baidu: '',
        bing: '#b_results li',
    }
    window.onload = function () {
        const contentList = document.querySelectorAll(targetDomMap[targetService]);

        console.log(contentList[1], 77)
    }
})();
```

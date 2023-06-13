这样写可以 在导出的时候用

```js
module.exports = reducer;
module.exports.reducer = reducer;
const { reducer } = require("module");

// 或者

const reducer = require("module");
```

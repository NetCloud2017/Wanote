# Events 事件触发器

```js
const EventEmitter = require("events");
class MyEmitter extends EventEmitter {}

const myEmitter = new MyEmitter();

myEmitter.on("events", () => {});

myEmitter.emit("events");

myEmitter.once("events");
```

定制自己的 plugin

核心 hook

compiler

compilation

```js
// footerPlugin
const { ConcatSource } = require("webpack-sources");
class FooterPlugin {
	constructor(option) {
		this.option = option;
	}
	apply(complier) {
		complier.hooks.compilation.tap("FooterPlugin", (compilation) => {
			compilation.hooks.processAssers.tap("FooterPlugin", () => {
				for (const chunk of compilation.chunks) {
					for (const file of chunk.files) {
						const comment = `/* ${this.options.banner}*/`;
						compilation.updateAsset(
							file,
							(ald) => new ConcatSource(old, "\n", comment)
						);
					}
				}
			});
		});
	}
}
```

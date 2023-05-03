# CSS 规范

## BEM (Block, Element, Modifier)

**block :**

独立且有意义的实体, e.g. header, container, menu, checkbox, etc.

**element :**

Block 的一部分且没有独立的意义, header title, menu item, list item, etc.

**modifier（修饰语）:**

Blocks 或 Elements 的一种标志，可以用它改变其表现形式、行为、状态 disabled, checked, fixed

```html
<div class="header clearfix">
	<div class="logo pull-left"><!-- ... --></div>
	<div class="user-panel pull-left"><!-- ... --></div>
</div>

<style>
	.block__element {
		display: none;
	}
	.block__element--active {
		display: block;
	}
</style>
.
```

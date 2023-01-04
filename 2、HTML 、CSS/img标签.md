### img 的 srcset 属性的作⽤

响应式页面中经常用到根据屏幕密度设置不同的图片。这时就用到了 img 标签的 srcset 属性。srcset 属性用于设置不同屏幕密度下，img 会自动加载不同的图片。用法如下：

```js
<img src="image-128.png" srcset="image-256.png 2x" />
```

使用上面的代码，就能实现在屏幕密度为 1x 的情况下加载 image-128.png, 屏幕密度为 2x 时加载 image-256.png。
按照上面的实现，不同的屏幕密度都要设置图片地址，目前的屏幕密度有 1x,2x,3x,4x 四种，如果每一个图片都设置 4 张图片，加载就会很慢。所以就有了新的 srcset 标准。代码如下：

```html
<img
	src="image-128.png"
	srcset="image-128.png 128w, image-256.png 256w, image-512.png 512w"
	sizes="(max-width: 360px) 340px, 128px"
/>
```

其中 srcset 指定图片的地址和对应的图片质量。sizes 用来设置图片的尺寸零界点。对于 srcset 中的 w 单位，可以理解成图片质量。如果可视区域小于这个质量的值，就可以使用。浏览器会自动选择一个最小的可用图片。
sizes 语法如下：

```js
sizes = "[media query] [length], [media query] [length] ... ";
```

sizes 就是指默认显示 128px, 如果视区宽度大于 360px, 则显示 340px。

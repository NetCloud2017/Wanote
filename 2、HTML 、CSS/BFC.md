BFC 块级格式化上下文 与其并列的 IFC (内联原素的块级上下文)

专门用来解决边距重叠 BFC 的原理 ， 即 BFC 的渲染规则 --- 1、 在 bfc 的这个块级元素的垂直边距会发生重叠 2、 bfc 的区域不会与浮动元素的盒模型重叠 ，这样就可用来清除浮动； 3、 bfc 是一个独立的容器，外部的元素不会影响到里面的元素，里面的也不会影响到外面的 4、 计算 bfc 的高度的时候，浮动元素也参与计算
那些会触发 bfc 呢？ float 不为 none overflow: hidden 或 auto postion 的值不为 static 或 relative display 属性 为 table-cell 或 table

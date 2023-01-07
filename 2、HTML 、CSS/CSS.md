### 选择器

**选择器优先级**

- 按位置分：

内联样式 > 内部样式 > 外部样式 > 浏览器用户自定义样式 > 浏览器默认样式。

- 按选择器分：

!important 声明 => #id 选择器 => .class 类选择器 => 标签选择器 => \* 通配符

**选择器列表**
带有某个类的属性选择器： .class1.class2
下一个兄弟选择器: h1+p
上一个兄弟选择器： h1 ~ p
子选择器: ul>li
后代选择器: li div

属性选择器

- [target]: 选择带有 target 属性的所有元素。
- [target=_blank]: 选择带有 target="\_blank" 属性的所有元素。
- [title~=flower]: 选择 title 属性包含单词 "flower" 的所有元素。
- [lang|=en]: 选择 lang 属性值以 "en" 开头的所有元素。
- a[href^="https"]: 选择其 src 属性值以 "https" 开头的每个 \<a> 元素。
- a[href$=".pdf"]: 选择其 src 属性以 ".pdf" 结尾的所有 \<a> 元素。
- a[href*="w3schools"]: 选择其 href 属性值中包含 "abc" 子串的每个 \<a> 元素。

**伪类选择器**

- :root 选择文档的根元素。
- ::selection 选择用户已选取的元素部分。
- #news:target 选择当前活动的 #news 元素。
- :fullscreen 选择处于全屏模式的元素。
- p:lang(it) 选择 lang 属性等于 "it"（意大利）的每个 \<p> 元素。
- :not(p) 选择非 \<p> 元素的每个元素。

- a:visited 选择所有已访问的链接。
- a:link 选择所有未访问过的链接。
- a:active 选择活动链接。
- a:hover 选择鼠标指针位于其上的链接。

表单元素相关

- input:checked 选择每个被选中的 \<input> 元素。
- input:default 选择默认的 \<input> 元素。
- input:disabled 选择每个被禁用的 \<input> 元素。
- input:valid 选择带有有效值的所有 input 元素。
- input:focus 选择获得焦点的 input 元素。
- input:enabled 选择每个启用的 \<input> 元素。
- input:optional 选择不带 "required" 属性的 input 元素。
- input:out-of-range 选择值超出指定范围的 input 元素。
- input:read-only 选择已规定 "readonly" 属性的 input 元素。
- input:read-write 选择未规定 "readonly" 属性的 input 元素。
- input:required 选择已规定 "required" 属性的 input 元素。
- input:in-range 选择其值在指定范围内的 input 元素。
- input:indeterminate 选择处于不确定状态的 input 元素。
- input:invalid 选择具有无效值的所有 input 元素。
- input::placeholder 选择已规定 "placeholder" 属性的 input 元素。

文本相关

- p:empty 选择没有子元素的每个 \<p> 元素（包括文本节点）。
- p::first-letter 选择每个 \<p> 元素的首字母。
- p::first-line 选择每个 \<p> 元素的首行。
- p:first-of-type 选择属于其父元素的首个 \<p> 元素的每个 \<p> 元素。

位置查找相关

- p:first-child 选择属于父元素的第一个子元素的每个 \<p> 元素。
- p:nth-child(2) 选择属于其父元素的第二个子元素的每个 \<p> 元素。
- p:last-child 选择属于其父元素最后一个子元素每个 \<p> 元素。
- p:only-child 选择属于其父元素的唯一子元素的每个 \<p> 元素。
- p:nth-last-child(2) 同上，从最后一个子元素开始计数。

- p:nth-of-type(2) 选择属于其父元素第二个 \<p> 元素的每个 \<p> 元素。
- p:only-of-type 选择属于其父元素唯一的 \<p> 元素的每个 \<p> 元素。
- p:last-of-type 选择属于其父元素的最后 \<p> 元素的每个 \<p> 元素。
- p:nth-last-of-type(2) 同上，但是从最后一个子元素开\始计数。

**伪元素选择器**

p::after 在每个 <p> 的内容之后插入内容。
p::before 在每个 <p> 的内容之前插入内容。

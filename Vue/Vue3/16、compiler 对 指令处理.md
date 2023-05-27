# compile 对指令的处理

对 AST 而言就是增加了 props 这个属性

对 javascript AST 而言就是增加了 branches 这个属性。

指令的处理逻辑都是在 parseTag 这个函数开始的。 因为指令就是写在标签里的。处理方法是 advanceSpaces

parseAttribute 里判断是不是指令。

> createStructuralDirectiveTransform 函数在 compile-core/src/transform/vif.ts 里

许多指令都是通过 createStructuralDirectiveTransform 这个函数来处理大多数指令的， 这个函数的第二个参数是一个函数，这个函数里 返回的是 processIf 的执行结果。

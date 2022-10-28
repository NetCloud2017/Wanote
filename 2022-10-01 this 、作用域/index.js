// 手写bind 函数
Function.prototype.abind = function (context, ...rest) {
  const fn = this;
  return function (...agrs) {
    return fn.apply(context, [...rest, ...agrs]);
  };
};

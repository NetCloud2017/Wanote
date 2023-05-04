# 判断和为 s

输入一个升序数组 array 和一个数字 S，在数组中查找两个数，使得他们的和正好是 S，如果有多对数字的和等于 S，返回任意一组即可，如果无法找出这样的数字，返回一个空数组即可。

双指针方法：

```javascript
function FindNumbersWithSum(array, sum) {
	// write code here
	let left = 0,
		right = array.length - 1,
		num;
	while (left < right) {
		num = array[left] + array[right];
		if (num === sum) {
			return [array[left], array[right]];
		}
		if (num > sum) {
			right--;
		} else {
			left++;
		}
	}
	return [];
}
```

function Permutation(str) {
	// write code here
	let list = [],
		strList = str.split("");
	const generatorList = (keys) => {
		let newList = [];
		keys.forEach((key) => {
			let lastStr = str
				.split(new RegExp(`[${key.split("").join("|")}]`))
				.join("")
				.split("");
			lastStr.map((_str) => {
				newList.push(key + _str);
			});
		});
		if (newList.every((i) => i.length === str.length)) {
			list.concat(newList);
		} else {
			generatorList(newList);
		}
	};
	strList.forEach((key) => {
		generatorList([key]);
	});
	console.log(list, "list");
}
Permutation("ab");

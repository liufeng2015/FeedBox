/**
 * 去掉字符串左边的空格
 * 
 * @param inStr
 * @return
 */
function leftTrim(inStr) {
	return inStr.replace(/^\s+/, "");
}
/**
 * 去掉字符串右边的空格
 * 
 * @param inStr
 * @return
 */
function rightTrim(inStr) {
	return inStr.replace(/\s+$/, "");
}
/**
 * 去掉字符串前后的空格
 * 
 * @param inStr
 * @return
 */
function trim(inStr) {
	return rightTrim(leftTrim(inStr));
}

/**
 * 写字母转为大写字母
 * 
 * @param Str
 * @return
 */
function ConvertToUpperCase(Str) {
	if (Str != "") {
		return Str.toUpperCase();
	}
	return Str;
}

/**
 * 大写字母转为小写字母
 * 
 * @param Str
 * @return
 */
function ConvertToLowerCase(Str) {
	if (Str != "") {
		return Str.toLowerCase();
	}
	return Str;
}
/**
 * 将所有name的checkbox勾选
 * 
 * @param name
 * @return
 */
function checkAll(name) {
	var arry = document.getElementsByName(name);
	for ( var i = 0; i < arry.length; i++) {
		var obj = arry[i];
		if (obj.checked == false) {
			obj.checked = true;
		} else {
			continue;
		}
	}

}
/**
 * 将所有name的已选checkbox取消勾选
 * 
 * @param name
 * @return
 */
function reverseCheckAll(name) {
	var arry = document.getElementsByName(name);
	for ( var i = 0; i < arry.length; i++) {
		var obj = arry[i];
		if (obj.checked == true) {
			obj.checked = false;
		} else {
			continue;
		}
	}
}
/**
 * 获取下拉列表选择项的值
 * 
 * @param obj
 *            下拉框对象select
 * @return
 */
function getSelectedOptValue(obj) {
	var opts = obj.options;
	var len = opts.length;
	for ( var i = 0; i < len; i++) {
		if (opts[i].selected) {
			return opts[i].value;
		}
	}
	return "";
}
/**
 * 替换全部
 */
String.prototype.replaceAll = function(s1,s2) { 
    return this.replace(new RegExp(s1,"gm"),s2); 
}

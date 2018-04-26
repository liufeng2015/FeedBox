/**
*用途：检查输入字符串是否为空或者全部都是空格 
*s：字符串 
*返回： 如果为空返回true,否则返回false
*/ 
function isNull(str) { 
	if (str == "") return true; 
	var regu = "^[ ]+$"; 
	var re = new RegExp(regu); 
	return re.test(str); 
}
/**
 * 用途：检查输入字符串是否为NULL或者为空或者全部都是空格 
 * @param str
 * @returns
 */
function isEmpty(str){
	if(str == null)return true;
	else return isNull(str);
}
/**
 * 用途：检查输入字符串是否只由汉字、字母、数字组成 输入：
 * @param s
 * @return 如果通过验证返回true,否则返回false
 */
function isChinaOrNumbOrLetter(s) {//判断是否是汉字、字母、数字组成 
	var regu = "^[0-9a-zA-Z\u4e00-\u9fa5]+$"; 
	var re = new RegExp(regu); 
	if (re.test(s)) { 
		return true; 
	} else { 
		return false; 
	} 
} 

/**
 * 用途：判断是否是日期 
 * @param str 日期；匹配的格式: 2011-5-16
 * @return 如果通过验证返回true,否则返回false 
 */ 
function isDate(str){
	if (isNull(str)) 
		return false; 
	 var r = str.match(/^(\d{4})(-|\/)(\d{1,2})(-|\/)(\d{1,2})$/); 
	 if(r==null)
	    return false; 
	 var d= new Date(r[1], r[3]-1, r[5]); 
	 return (d.getFullYear()==r[1] && (d.getMonth()+1)==r[3] && d.getDate()==r[5]); 
}

/**
 * 用途：检查输入对象的值是否符合整数格式 
 * @param str
 * @return 如果通过验证返回true,否则返回false 
 */
function isInteger(str) { 
	var regu = /^[-]{0,1}[0-9]{1,}$/; 
	return regu.test(str); 
} 

/**
 * 用途：检查输入对象的值是否符合E-Mail格式 
 * @param str
 * @return 如果通过验证返回true,否则返回false 
 */
function isEmail(str) { 
	var myReg = /^[-_A-Za-z0-9]+@([_A-Za-z0-9]+\.)+[A-Za-z0-9]{2,3}$/; 
	if (myReg.test(str)) 
		return true; 
	return false; 
} 

/**
 * 用途：检查输入字符串是否符合国内固话或者传真格式 
 * @param s
 * @return 如果通过验证返回true,否则返回false 
 */
function isPhone(s){
  var reg=/^((0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/; 
  if(!reg.test(s))
     return  false;   
  return  true;   
} 
/**
 * 用途：检查输入字符串是否是数字 
 * @param str
 * @return 如果通过验证返回true,否则返回false
 */
function isNumber(str)  
{         
    var reg = /^\d+$/;
    if (reg.test(str))
       return true;  
    else   
       return false;  
}

/**
 * 用途：检查输入对象的值是否符合端口号格式 
 * @param str
 * @return 如果通过验证返回true,否则返回false 
 */
function isPort(str) { 
	return (isNumber(str) && str < 65536); 
} 

/**
 * 用途：检查输入字符串是否符合金额格式 
 * 格式定义为带小数的正数，小数点后最多三位 
 * @param s
 * @return 如果通过验证返回true,否则返回false 
 */
function isMoney(s) { 
	var regu = "^[0-9]+[\.][0-9]{0,3}$"; 
	var re = new RegExp(regu); 
	if (re.test(s)) { 
		return true; 
	} else { 
		return false; 
	} 
} 

/**
 * 用途：检查输入字符串是否符合身份证格式 
 * @param strIDno
 * @return 如果通过验证返回true,否则返回false 
 */

function isIDCard(strIDno)  
{   
    var aCity={11:"北京",
    		12:"天津",
    		13:"河北",
    		14:"山西",
    		15:"内蒙古",
    		21:"辽宁",
    		22:"吉林",
    		23:"黑龙江",
    		31:"上海",
    		32:"江苏",
    		33:"浙江",
    		34:"安徽",
    		35:"福建",
    		36:"江西",
    		37:"山东",
    		41:"河南",
    		42:"湖北",
    		43:"湖南",
    		44:"广东",
    		45:"广西",
    		46:"海南",
    		50:"重庆",
    		51:"四川",
    		52:"贵州",
    		53:"云南",
    		54:"西藏",
    		61:"陕西",
    		62:"甘肃",
    		63:"青海",
    		64:"宁夏",
    		65:"新疆",
    		71:"台湾",
    		81:"香港",
    		82:"澳门",
    		91:"国外"};  
   
    var iSum = 0;  

    var idCardLength = strIDno.length;    
    if(!/^\d{17}(\d|x)$/i.test(strIDno)&&!/^\d{15}$/i.test(strIDno))   
    {
        alert("非法身份证号");  
        return false;  
    }  
   
    //在后面的运算中x相当于数字10,所以转换成a  
    strIDno = strIDno.replace(/x$/i,"a");  
  
    if(aCity[parseInt(strIDno.substr(0,2))]==null)  
    {  
        alert("非法地区");  
        return false;  
    }  
      
    if (idCardLength==18)  
    {  
        sBirthday=strIDno.substr(6,4)+"-"+Number(strIDno.substr(10,2))+"-"+Number(strIDno.substr(12,2));  
        var d = new Date(sBirthday.replace(/-/g,"/"))  
        if(sBirthday!=(d.getFullYear()+"-"+ (d.getMonth()+1) + "-" + d.getDate()))  
        {         
            alert("非法生日");  
            return false;  
        }  
  
        for(var i = 17;i>=0;i --)  
            iSum += (Math.pow(2,i) % 11) * parseInt(strIDno.charAt(17 - i),11);  
  
        if(iSum%11!=1)  
        {  
            alert("非法身份证号");  
            return false;  
        }  
    }  
    else if (idCardLength==15)  
    {  
        sBirthday = "19" + strIDno.substr(6,2) + "-" + Number(strIDno.substr(8,2)) + "-" + Number(strIDno.substr(10,2));  
        var d1 = new Date(sBirthday.replace(/-/g,"/"));  
        var dd = d1.getFullYear().toString() + "-" + (d1.getMonth()+1) + "-" + d1.getDate();     
        if(sBirthday != dd)  
        {  
            alert("非法生日");  
            return false;  
        }  
    }  
    return true;
}

/**
 * 用途：检查输入字符串是否符合时间格式 
 * @param time
 * @return 如果通过验证返回true,否则返回false 
 */
function isTime(time){ 
	 var regex = /^[0-2]{1}[0-9]{1}:[0-5]{1}[0-9]{1}:[0-5]{1}[0-9]{1}$/; 
	 if(!regex.test(time)){ 
		 return false; 
	 } 
	 var hour = time.substring(0,2); 
	 var minute = time.substring(3,5); 
	 var second = time.substring(6); 
	 if(hour>23 || hour <0){ 
		 return false; 
	 } 
	 if(minute > 60 ||minute < 0){ 
		 return false; 
	 } 
	 if(second > 60 ||second < 0){ 
		 return false; 
	 } 
	 	return true; 
}
 
/**
 * 用途：检查输入手机号码是否正确 
 * @param s
 * @return 如果通过验证返回true,否则返回false 
 */
function isMobile(s) { 
	var regu = /^[1][0-9][0-9]{9}$/; 
	var re = new RegExp(regu); 
	if (re.test(s)) { 
		return true; 
	} else { 
		return false; 
	} 
} 

/**
 * 用途：检查输入字符串是否符合邮政编码格式
 * @param str
 * @return 如果通过验证返回true,否则返回false 
 */
function isZipcode(str)  
{  
    var reg = /^\d+$/;
    if (!reg.test(str))
       return false; 
    if(str.length!=6)  
    {  
        alert("邮政编码长度必须是6位");  
        return false;  
    }  
    return true;  
}  


/**
 * 用途：检查输入字符串是否只由汉字组成 
 * @param str
 * @return 如果通过验证返回true,否则返回false 
 */
function isZh(str){ 
	 var reg = /^[\u4e00-\u9fa5]+$/;
	 if (reg.test(str)) return true; 
	 return false;  
} 

/**
 * 用途：校验ip地址的格式 
 * @param strIP
 * @return 返回：如果通过验证返回true,否则返回false； 
 */
function isIP(strIP) { 
	if (isNull(strIP)) return false; 
	var re = /^(\d+)\.(\d+)\.(\d+)\.(\d+)$/g; //匹配IP地址的正则表达式 
	if (re.test(strIP)) { 
	if (RegExp.$1 < 256 && RegExp.$2 < 256 && RegExp.$3 < 256 && RegExp.$4 < 256)
		return true; 
	} 
	return false; 
} 

/**
 * 用途：检查输入字符串是否只由英文字母和数字组成 
 * @param s
 * @return 如果通过验证返回true,否则返回false
 */
function isNumberOrLetter(s) {//判断是否是数字或字母 
	var regu = "^[0-9a-zA-Z]+$"; 
	var re = new RegExp(regu); 
	if (re.test(s)) { 
		return true; 
	} else { 
		return false; 
	} 
} 

/**
 * 用途：字符1是包含字符串2
 * @param str1
 * @param str2
 * @return 如果通过验证返回true,否则返回false 
 */
function isMatch(str1, str2) { 
	var index = str1.indexOf(str2); 
	if (index == -1) return false; 
	return true; 
} 

/**
 * 用途：字符1是否以字符串2结束
 * @param str1
 * @param str2
 * @return 如果通过验证返回true,否则返回false 
 */
function isLastMatch(str1, str2) { 
	var index = str1.lastIndexOf(str2); 
	if (str1.length == index + str2.length) return true; 
	return false; 
}

/**
 * 用途：字符1是否以字符串2开始 
 * @param str1
 * @param str2
 * @return 如果通过验证返回true,否则返回false 
 */
function isFirstMatch(str1, str2) { 
	var index = str1.indexOf(str2); 
	if (index == 0) return true; 
	return false; 
} 


//4.检查数字类型的长度
//numberStr:为给定的字符串，len:长度
function maxNumLen(numberStr,len) {		
	var rc=true;
	var reg;
	if(numberStr !="") {	
		switch(len) {
			case '1' : reg=/^\d{0,1}$/; break;
			case '2' : reg=/^\d{0,2}$/; break;
			case '3' : reg=/^\d{0,3}$/; break;
			case '4' : reg=/^\d{0,4}$/; break;
			case '5' : reg=/^\d{0,5}$/; break;
			case '6' : reg=/^\d{0,6}$/; break;
			case '7' : reg=/^\d{0,7}$/; break;
			case '8' : reg=/^\d{0,8}$/; break;
			case '9' : reg=/^\d{0,9}$/; break;
			case '10' : reg=/^\d{0,10}$/; break;
			case '11' : reg=/^\d{0,11}$/; break;
			case '12' : reg=/^\d{0,12}$/; break;
			case '13' : reg=/^\d{0,13}$/; break;
			case '14' : reg=/^\d{0,14}$/; break;
			case '15' : reg=/^\d{0,15}$/; break;
			case '16' : reg=/^\d{0,16}$/; break;
			case '17' : reg=/^\d{0,17}$/; break;
			case '18' : reg=/^\d{0,18}$/; break;
			case '19' : reg=/^\d{0,19}$/; break;
	}
		var age = numberStr;					
		if(!reg.test(age)){
			alert("必须小于"+len+" 位的数字！"); 
			rc=false;
		}
	}	 
	return rc;
}
//6.检查是否为浮点型数字
function isFloatNumber(Str) {	 
	 var rc = true;    
    if(Str!="") {
		 reg=/^\d{0,8}$|\.\d{1,2}$/;	 
		 var amount = Str;
	    r = amount.match(reg);
	    if(r == null) { 
	    	alert("必须是数字类型！");	    	
	    	rc=false;
	    }	   
    }
    return rc;
} 
/**
*用途：检查开始日期是否小于等于结束日期
*输入:s：字符串 开始日期 格式：2001-5-4
*     e：字符串 结束日期 格式：2002-5-4
*返回: 
*    如果通过开始日期小于等于结束日期返回true,否则返回false 
*/ 

function compareDate(s,e)
{
	 var arr=s.split("-");
	 var starttime=new Date(arr[0],arr[1],arr[2]);
	 var starttimes=starttime.getTime();
	 
	 var arrs=e.split("-");
	 var endtime=new Date(arrs[0],arrs[1],arrs[2]);
	 var endtimes=endtime.getTime();
	 
	 if(starttimes>=endtimes)
	 {
	  alert('开始时间大于结束时间，请检查');
	  return false;
	 }
	 else
	  return true;
}
/**
 * 验证obj对象值的长度是否超过maxLen
 * @param obj
 * @param maxLen
 * @return
 */
function checkLength(obj,maxLen){
    var val=obj.value;
    if(val.length>maxLen){
 	   alert("长度不能超过"+maxLen+"!"); 
 	   obj.value=val.substring(0,maxLen);
 	   return;
    }
 }

/**
 * 数字验证
 * @param elementValue
 * @returns {Boolean}
 */
function isDigital(elementValue){
	var rep = /\D/;
	return !(elementValue != '' && rep.test(elementValue));
}

/**
 * 用途：检查输入字符串是否只由英文字母和数字下划线组成
 * @param s
 * @return 如果通过验证返回true,否则返回false
 */
function isNumberOrLetterOrUnderline(s) {//判断是否是数字或字母 
	var regu = "^[0-9a-zA-Z_]+$"; 
	var re = new RegExp(regu); 
	if (re.test(s)) { 
		return true; 
	} else { 
		return false; 
	} 
} 

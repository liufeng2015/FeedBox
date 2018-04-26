<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:set var="dataMap" value='<%=com.fh.util.DataConstants.dataMap%>' />
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">

<meta charset="utf-8" />
<title></title>
<meta name="description" content="overview & stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<base href="<%=basePath%>">

<meta charset="utf-8" />
<title></title>
<meta name="description" content="overview & stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="static/css/bootstrap.min.css" rel="stylesheet" />
<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link rel="stylesheet" href="static/css/font-awesome.min.css" />
<link rel="stylesheet" href="static/css/ace.min.css" />
<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
<link rel="stylesheet" href="static/css/ace-skins.min.css" />
<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="static/js/bootbox.min.js"></script>
<!-- 确认窗口 -->
<script type="text/javascript"
	src="static/js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript"
	src="static/js/jquery.ui.touch-punch.min.js"></script>
<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
<script type="text/javascript" src="static/js/fuelux.spinner.js"></script>
<script type="text/javascript"
	src="static/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript"
	src="static/js/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="static/js/date.js"></script>
<script type="text/javascript" src="static/js/daterangepicker.min.js"></script>
<script type="text/javascript"
	src="static/js/bootstrap-colorpicker.min.js"></script>
<script type="text/javascript" src="static/js/jquery.knob.min.js"></script>
<script type="text/javascript" src="static/js/jquery.autosize-min.js"></script>
<script type="text/javascript"
	src="static/js/jquery.inputlimiter.1.3.1.min.js"></script>
<script type="text/javascript" src="static/js/jquery.maskedinput.min.js"></script>


<script type="text/javascript" src="static/js/LodopFuncs.js"></script>

<style type="text/css">
.s1 {
	background-color: yellow;
}

</style>

</head>

<script type="text/javascript">
		$(top.hangge());
		var LODOP; //声明为全局变量 
		function onload(){
			CreateOneFormPage();

			LODOP.PREVIEW();
			
			//LODOP.PRINT();
	
			//setTimeout("window.close()",1000);
			
		}
		function CreateOneFormPage(){
			LODOP=getLodop();  
			LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_表单一");
			LODOP.ADD_PRINT_HTM(0,0,"100%","100%",document.getElementById("zhongxin").innerHTML);
			LODOP.SET_PRINT_PAGESIZE(2,document.getElementById('zhongxin').value,document.getElementById('zhongxin').value,"CreateCustomPage");
			
			
			//LODOP.ADD_PRINT_HTM(0,0,"100%","100%",document.documentElement.innerHTML);
		};	 
		
	</script>
<body onload="onload()">
<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0>  
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed> 
</object> 

<div id='page1'>
	<div id="zhongxin">
	<img border="0" src="http://172.10.1.111/FeedBox/static/images/dz.jpg"  
style="z-index: -1; position: absolute; left:100px; top:10px;" />   

<img border="0" src="http://172.10.1.111/FeedBox/static/images/dzlogo.jpg"  
style="z-index: -1; position: absolute; right:100px; top:10px;" />   
		<table width="80%"  border="0" align="center" cellpadding="0" cellspacing="0" >
			
			<tr >
				<td align="center" height="120" colspan="2" ><h1><font color="black" ><b>成品装箱卡<b></font></h1></td>
			</tr>
			<tr>
				<td align="right" colspan="2"><font color="black" size="4" ><b>打印时间：${pd.printTime}</b></font></td>
			</tr>
		</table>
		<table width="80%" border="2" align="center" cellspacing="1"  >
			<tr height="10px" >
				<td width="15%"  align="center"><font color="black" size="4" ><b>型号</font></td>
				<td width="17%" align="center" bgcolor="#8CE2D0"><font color="black" size="4" ><b>${fn:substring(pd.Model, 0, fn:indexOf(pd.Model, " "))}</b></font></td>
				<td width="18%" align="center" bgcolor="#C6F4FF"><font color="black" size="4" ><b>${fn:substring(pd.Model, fn:indexOf(pd.Model, " "),fn:length(pd.Model) )}</b></font></td>
				<td width="15%" align="center"><font color="black" size="4" ><b>箱号</font></d></td>
				<td width="35%" align="center"><font color="black" size="4" ><b>${pd.No}</font></d></td>
			</tr>
			<tr>
				<td width="15%" align="center" ><font color="black" size="4" ><b>生产线</d></font></td>
				
				<td width="35%" align="center" colspan="2"><font color="black" size="4" ><b>${pd.AddressName}</d></font></td>
				<td width="15%" align="center"><font color="black" size="4" ><b>班次</d></font></td>
				<td width="35%" align="center"><font color="black" size="4" ><b>${pd.Sclass}</d></font></td>
			</tr>
			<tr>
				<td width="15%" align="center"><font color="black" size="4" ><b>零件号</d></font></td>
				<td width="35%" align="center" colspan="2"><font color="black" size="4" ><b>${pd.PartNumber}</d></font></td>
				<td width="15%" align="center" ><font color="black" size="4" ><b>操作工</d></font></td>
				<td width="35%" align="center">&nbsp;</td>
			</tr>
		</table>
		<br>
		<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" >
		
			<tr>
				<td width="50%"  >
					<table border="2" width="100%"  >
					<c:forEach items="${listData}" var="var" varStatus="vs">
						<c:if test="${vs.index<12 }">
							<tr>
								<td width="5%"  align="center">${vs.index + 1 }</td>
								<td width="35%" align="center" >${var.QRCodeShow}</td>
							</tr>
						</c:if>
					</c:forEach>
					<c:if test="${listData.size()<12 }">
						<c:forEach  var="p" begin="1" end="${12-listData.size() }" varStatus="vs">
							<tr>
								<td width="5%"  align="center">${vs.index + listData.size() }</td>
								<td width="35%" align="center" >&nbsp;</td>
							</tr>
						</c:forEach>
					</c:if>
					
					</table>
				</td>
				<td width="50%" style="padding-left: 0" >
					<table border="2" width="100%"  >
					<c:forEach items="${listData}" var="var" varStatus="vs">
						<c:if test="${vs.index>11 and vs.index<25}">
							<tr>
								<td width="5%"  align="center">${vs.index + 1 }</td>
								<td width="35%" align="center" >${var.QRCodeShow}</td>
							</tr>
						</c:if>
					</c:forEach>
					<c:if test="${listData.size()<24 }">
						<c:forEach  var="p" begin="1" end="${24-listData.size()}" varStatus="vs">
							<c:if test="${vs.index<13 }">
								<tr>
									<td width="5%"  align="center">${vs.index+12}</td>
									<td width="35%" align="center" >&nbsp;</td>
								</tr>
							</c:if>		
						</c:forEach>
					</c:if>
					
					</table>
				</td>
			</tr>
		</table>
	<br>
		<table width="80%" align="center" cellspacing="0" border="0" >
			<tr>
				<td width="60%" rowspan="2" height="10px" >
				 	<c:if  test="${fn:indexOf(pd.AddressName,'AGW')<0}" >
				 	
<img border="0" src="http://172.10.1.111/FeedBox/static/images/evo.jpg"  
style="z-index: -1; position: absolute; left:100px; bottom:150px;" />   
				 	
				 	</c:if>
				 	<c:if  test="${fn:indexOf(pd.AddressName,'AGW')>=0}" >
				 	
<img border="0" src="http://172.10.1.111/FeedBox/static/images/phz.jpg"  
style="z-index: -1; position: absolute; left:100px; bottom: 150px" />   
				 	
				 	</c:if>
				</td>
				<td width="40%" align="center" height="10px" >
					<table width="100%"  border="1" align="center"  >
						
						<tr>
							<td width="30%" align="center" height="100px" colspan="3" rowspan="3" ><font color="black" size="4" ><b>备注</b></font></td>
							<td width="70%" align="center" colspan="3" ></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>


<img border="0" src="http://172.10.1.111/FeedBox/static/images/null.jpg"  
style="z-index: -1; position: absolute; left:0px; bottom: 0px" />  

	</div>
</div>
	<div id="zhongxin2" class="center" style="display: none">
		<br />
		<br />
		<br />
		<br />
		<br />
		<img src="static/images/jiazai.gif" /><br />
		<h4 class="lighter block green">提交中...</h4>
	</div>

	<!-- 引入 -->
	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
	</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>

	<script type="text/javascript">
		$(top.hangge());
	</script>
</body>
</html>
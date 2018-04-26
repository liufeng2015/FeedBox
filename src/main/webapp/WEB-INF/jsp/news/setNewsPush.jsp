<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:set var="dataMap" value='<%=com.fh.util.DataConstants.dataMap%>'/>
<!DOCTYPE html>
<html lang="en">
	<head>
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
		<script type="text/javascript" src="static/js/bootbox.min.js"></script><!-- 确认窗口 -->
		
<script type="text/javascript">
	
	$(top.hangge());
	
	
		$(function() {
			 $.ajaxSetup ({ cache: false }); 
			$("#z1").attr("src","<%=basePath%>/enterprise/enterpriseC.do?N_ID=${pd.N_ID}");
			$("#z2").attr("src","<%=basePath%>/newsPush.do?N_ID=${pd.N_ID}");
			

		})
		
		function setIframeHeight(iframe) {
			if (iframe) {
			var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow;
			if (iframeWin.document.body) {
			iframe.height = iframeWin.document.documentElement.scrollHeight || iframeWin.document.body.scrollHeight;
			}
			}
		};

		window.onload = function () {
			setIframeHeight(document.getElementById('z1'));
			setIframeHeight(document.getElementById('z2'));
		};
		
</script> 
</head>

<body>
<div id="zhongxin">
	<div class="row-fluid">
		<div  class="span5">
			<iframe id="z1" onload="setIframeHeight(this)" width="100%"  frameborder="0"  ></iframe>
		</div>
		
		<div  class="span7">
			<iframe id="z2" onload="setIframeHeight(this)" width="100%"  frameborder="0" ></iframe>
		</div>
	
	</div>
	<div class="form-actions">
				<a class="btn btn-danger" onclick="top.Dialog.close();">关闭</a>
	</div>
</div>

<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
</body>
</html>
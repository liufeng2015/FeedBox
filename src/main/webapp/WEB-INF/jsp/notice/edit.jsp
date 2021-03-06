<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<!-- basic styles -->
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		
		<!--[if IE 7]>
		  <link rel="stylesheet" href="static/css/font-awesome-ie7.min.css" />
		<![endif]-->
		<!-- page specific plugin styles -->
		
		
		
		<link rel="stylesheet" href="static/css/jquery-ui-1.10.2.custom.min.css" />
		<link rel="stylesheet" href="static/css/chosen.css" />
		<link rel="stylesheet" href="static/css/datepicker.css" />
		<link rel="stylesheet" href="static/css/bootstrap-timepicker.css" />
		<link rel="stylesheet" href="static/css/daterangepicker.css" />
		<link rel="stylesheet" href="static/css/colorpicker.css" />
		<!-- ace styles -->
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		<!--[if lt IE 9]>
		  <link rel="stylesheet" href="static/css/ace-ie.min.css" />
			<script type="text/javascript" src="static/js/excanvas.min.js"></script>
		<![endif]-->
		
		<!-- basic scripts -->
		<script src="static/1.9.1/jquery.min.js"></script>
		<script type="text/javascript">
		window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
		</script>
		
		<script src="static/js/bootstrap.min.js"></script>
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
		
		<script type="text/javascript" src="static/js/jquery-ui-1.10.2.custom.min.js"></script>
		<script type="text/javascript" src="static/js/jquery.ui.touch-punch.min.js"></script>
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
		<script type="text/javascript" src="static/js/fuelux.spinner.js"></script>
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script>
		<script type="text/javascript" src="static/js/bootstrap-timepicker.min.js"></script>
		<script type="text/javascript" src="static/js/date.js"></script>
		<script type="text/javascript" src="static/js/daterangepicker.min.js"></script>
		<script type="text/javascript" src="static/js/bootstrap-colorpicker.min.js"></script>
		<script type="text/javascript" src="static/js/jquery.knob.min.js"></script>
		<script type="text/javascript" src="static/js/jquery.autosize-min.js"></script>
		<script type="text/javascript" src="static/js/jquery.inputlimiter.1.3.1.min.js"></script>
		<script type="text/javascript" src="static/js/jquery.maskedinput.min.js"></script>
		
		<script type="text/javascript" src="static/js/bootbox.min.js"></script>
		<!-- ace scripts -->
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
</head>

<script type="text/javascript">

$(function() {
	
	//日期框
	$('.date-picker').datepicker();
	
});
	$(top.hangge());
	//保存
	function save(obj){
		 if($("#title").val()==""){
			
			$("#title").tips({
				side:3,
	            msg:'请输入标题',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#title").focus();
			return false;
		}
		if($("#content").val()==""){
			
			$("#content").tips({
				side:3,
	            msg:'请输入内容',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#content").focus();
			return false;
		}
		
        $("#isInvalid").val(obj);
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show(); 
		
	}
	
	function delFile(id,filenamepath){
		
		 if(confirm("确定要删除文件？")){
			var url = "notice/delFile.do?filenamepath="+filenamepath+"&id="+id+"&guid="+new Date().getTime();
			$.get(url,function(data){
				if(data=="success"){
					alert("删除成功!");
					document.location.reload();
				}
			});
		} 
	}
</script>


<body>
	<form action="<%=basePath%>/notice/save.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
	  <input type="hidden" id="id" name="id" value="${pd.id }">
	  <input type="hidden" id="isInvalid" name="isInvalid">
		<div id="zhongxin">
		<br>
		<div class="form-horizontal">
		
		 <div class="control-group">
			<label class="control-label" for="form-field-1">标题<span style="color: red">*</span></label>
				<div class="controls">
					    <input type="text" name="title" id="title" value="${pd.title }" placeholder="这里输入标题" title="标题"/>
				</div>
			</div>
			
			 <div class="control-group">
			<label class="control-label" for="form-field-1">内容<span style="color: red">*</span></label>
				<div class="controls">
					<textarea id="json-field" name="content" id="content" title="内容" class="autosize-transition span12" style="width:220px; height: 120px;">${pd.content}</textarea>
				</div>
			</div>
			
			<div class="control-group">
			<label class="control-label" for="form-field-1">附件</label>
				<div class="controls">
					<c:if test="${pd == null || pd.filenamepath == '' || pd.filenamepath == null}">
						<input type="file" id="tp" name="tp"/>
					</c:if>
					<c:if test="${pd != null && pd.filenamepath != '' && pd.filenamepath != null }">
						<a class="btn btn-mini  icon-cloud-download" title="下载" href="<%=basePath%>uploadFiles/file/${pd.filenamepath}"></a>
						<input type="button" class="btn btn-mini btn-danger" value="删除" onclick="delFile('${pd.id}','${pd.filenamepath}');" />
					</c:if>
				</div>
			</div>
			
		  <div class="form-actions">
		        <c:if test="${empty type}">
		            <a class="btn btn-primary" onclick="save(1);">保存</a>
		                 &nbsp; &nbsp; &nbsp;
				    <a class="btn btn-success" onclick="save(2);">发布</a>
				</c:if>
				&nbsp; &nbsp; &nbsp;
				<a class="btn btn-danger" onclick="top.Dialog.close();">关闭</a>
			</div>
		
		</div>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
</body>
<script type="text/javascript">
	var msg = '${msg}';
	if(msg == 'no'){
		$("#BIANMA").attr("readonly",true);
	}

</script>
</html>
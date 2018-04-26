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
		
		<!-- page specific plugin styles -->
		
		
		
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		
		
		<link rel="stylesheet" href="static/css/jquery-ui-1.10.2.custom.min.css" />
		<link rel="stylesheet" href="static/css/chosen.css" />
		<link rel="stylesheet" href="static/css/datepicker.css" />
		<link rel="stylesheet" href="static/css/bootstrap-timepicker.css" />
		<link rel="stylesheet" href="static/css/daterangepicker.css" />
		<link rel="stylesheet" href="css/colorpicker.css" />
		<!-- ace styles -->
		<link rel="stylesheet" href="css/ace.min.css" />
		<link rel="stylesheet" href="css/ace-responsive.min.css" />
		<link rel="stylesheet" href="css/ace-skins.min.css" />
		
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
		<script src="1.9.1/jquery.min.js"></script>
		<script type="text/javascript">
		window.jQuery || document.write("<script src='js/jquery-1.9.1.min.js'>\x3C/script>");
		</script>
		
		<script src="static/js/bootstrap.min.js"></script>
		<!-- page specific plugin scripts -->
		
		<!--[if lt IE 9]>
		<script type="text/javascript" src="js/excanvas.min.js"></script>
		<![endif]-->
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
		<!-- ace scripts -->
		
</head>

<script type="text/javascript">
$(top.hangge());
//保存
function save(){
	if($("#NewsContent").val()==""){
		
		$("#NewsContent").tips({
			side:2,
            msg:'请输入消息内容',
            bg:'#AE81FF',
            time:2
        });
		
		$("#Name").focus();
		return false;
	}
	
	
	$("#Form").submit();
	$("#zhongxin").hide();
	$("#zhongxin2").show();
	
}

	
</script>

<body>
	<form  action="news/save.do" name="Form" id="Form" method="post" >
		<input type="hidden" name="N_ID" id="N_ID" value="${pd.N_ID }"/>
		<div id="zhongxin">
		<br>
		<div class="form-horizontal">
		
			
			
			<div class="control-group">
			
					
						<label for="form-field-8">消息内容</label>
						<textarea class="span12"  id="NewsContent" name="NewsContent"  placeholder="这里输入消息内容">${pd.NewsContent}</textarea>
			</div>
			
			
			
		<div class="form-actions">
				<a class="btn btn-primary" onclick="save();">保存</a>
				&nbsp; &nbsp; &nbsp;
				<a class="btn btn-danger" onclick="top.Dialog.close();">取消</a>
				
			</div>
					
		</div>
			
		
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
	</form>
	
	
	
	
</body>
<script type="text/javascript">
	var msg = '${msg}';
	if(msg == 'no'){
		
	}

	$(".chzn-select").chosen(); 
	$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
</script>
</html>
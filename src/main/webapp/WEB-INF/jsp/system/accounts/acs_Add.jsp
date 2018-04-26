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
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
</head>

<script type="text/javascript">
	$(top.hangge());
	//保存
	function save(){
		var flg = true;
		if($("#acsName").val()==""){
			
			$("#acsName").tips({
				side:3,
	            msg:'请输入公众号名称',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#acsName").focus();
			flg = false;
		}else{
			$("#acsName").val(jQuery.trim($('#acsName').val()));
		}
        if($("#App_Id").val()==""){
			
			$("#App_Id").tips({
				side:3,
	            msg:'请输入应用Id',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#App_Id").focus();
			flg = false;
		}else{
			$("#App_Id").val(jQuery.trim($('#App_Id').val()));
		}
		
       if($("#App_secret").val()==""){
			
			$("#App_secret").tips({
				side:3,
	            msg:'请输入密钥',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#App_secret").focus();
			flg = false;
		}else{
			$("#App_secret").val(jQuery.trim($('#App_secret').val()));
		}
       if($("#organizer").val()==""){
			
			$("#organizer").tips({
				side:3,
	            msg:'请输入承办单位',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#organizer").focus();
			flg = false;
		}else{
			$("#organizer").val(jQuery.trim($('#organizer').val()));
		}
       
       if($("#status").val()=="2"){
			
			$("#status").tips({
				side:3,
	            msg:'请选择状态',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#status").focus();
			flg = false;
		}else{
			$("#status").val(jQuery.trim($('#status').val()));
		}
       
       if(flg==true){
    	    $("#Form").submit();
         	$("#zhongxin").hide();
			$("#zhongxin2").show();
       }
        
   }
	
</script>


<body>
	<form  action="accountsController/save.do" name="Form" id="Form" method="post" >
		<div id="zhongxin">
		<br>
		<div class="form-horizontal">
		
		
			<div class="control-group">
			<label class="control-label" for="form-field-1">公众号名称</label>
				<div class="controls">
					<input type="text" id="acsName" name="acsName" placeholder="公众号名称" value="${pd.acsName }" >
				</div>
			</div>
			
			<div class="control-group">
			<label class="control-label" for="form-field-1">应用Id</label>
				<div class="controls">
					<input type="text" id="App_Id" name="App_Id" placeholder="应用Id" value="${pd.App_Id }" >
				</div>
			</div>
			
			<div class="control-group">
			<label class="control-label" for="form-field-1">密钥</label>
				<div class="controls">
					<input type="text" id="App_secret" name="App_secret" placeholder="密钥" value="${pd.App_secret }" >
				</div>
			</div>
			
			<div class="control-group">
			<label class="control-label" for="form-field-1">承办单位</label>
				<div class="controls">
					<input type="text" id="organizer" name="organizer" placeholder="承办单位" value="${pd.organizer }" >
				</div>
			</div>
			
			<div class="control-group">
			<label class="control-label" for="form-field-1">状态</label>
				<div class="controls">
					<select id="status" name="status">
					   <option value="2">请选择</option> 
					   <option value="0">启用</option>
					   <option value="1">禁用</option>
					</select>
				</div>
			</div>
			
			<div class="form-actions">
				<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
				&nbsp; &nbsp; &nbsp;
				<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				
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

</script>
</html>
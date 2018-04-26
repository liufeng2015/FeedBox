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
	
	//新增
	function add(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="新增";
		 diag.URL = '<%=basePath%>news/toAdd.do';
		 diag.Width = 1000;
		 diag.Height = 600;
		 diag.CancelEvent = function(){ //关闭事件
			 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				var num = '${page.currentPage}';
			 	if(num == '0'){
			 		top.jzts();
			 		location.href = location.href;
			 	}else{
			 		nextPage(${page.currentPage});
			 	}
			}
			 diag.close();
		 };
		 diag.show();
	}
	
	
	//新增
	function toNewsPush(N_ID){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="新增";
		 diag.URL = '<%=basePath%>newsPush/toNewsPush.do?N_ID='+N_ID;
		 diag.Width = 1000;
		 diag.Height = 600;
		 diag.CancelEvent = function(){ //关闭事件
			 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				var num = '${page.currentPage}';
			 	if(num == '0'){
			 		top.jzts();
			 		location.href = location.href;
			 	}else{
			 		nextPage(${page.currentPage});
			 	}
			}
			 diag.close();
		 };
		 diag.show();
	}
	
	
	//修改
	function edit(N_ID){
		 top.jzts();
	   	 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="编辑";
		 diag.URL = '<%=basePath%>news/toEdit.do?N_ID='+N_ID;
		 diag.Width = 1000;
		 diag.Height = 600;
		 diag.CancelEvent = function(){ //关闭事件
			 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				 nextPage(${page.currentPage});
			}
			 diag.close();
		 };
		 diag.show();
	}
	
	

	
	//删除
	function del(N_ID){
		var flag = false;
		if(confirm("确定要删除该数据吗?")){
			flag = true;
		}
		if(flag){
			top.jzts();
			var url = "<%=basePath%>news/del.do?N_ID="+N_ID+"&guid="+new Date().getTime();
			$.get(url,function(data){
				if("success" == data.result){
					top.jzts();
					nextPage(${page.currentPage});
				}else{
					top.hangge();
					alert("删除失败，请先删除其下级数据!"); 
				}
			});
		}
	}
	
	
	function push(N_ID){
		var flag = false;
		if(confirm("确定要推送该条信息吗?")){
			flag = true;
		}
		if(flag){
			top.jzts();
			var url = "<%=basePath%>news/push.do?N_ID="+N_ID+"&guid="+new Date().getTime();
			$.get(url,function(data){
				if("success" == data.result){
					top.jzts();
					nextPage(${page.currentPage});
				}else{
					top.hangge();
					alert("推送失败!"); 
				}
			});
		}
	}
	
	function newsPush(N_ID){
	
			 $.ajaxSetup ({ cache: false }); 
			$("#z1").attr("src","<%=basePath%>/newsPush.do?N_ID="+N_ID);
	}
	
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
		};
		
</script> 
</head>

<body>
<div id="page-content" class="clearfix">
<div class="row-fluid">
	
	<!-- 检索  -->
	<form action="<%=basePath%>/news.do" method="post" name="userForm" id="userForm">
	
	<table>
		<tr>
			<td><font color="#808080">检索：</font></td>
			<td><input type="text" name="FuzzySearch" value="${pd.FuzzySearch }" placeholder="这里输入检索内容" style="width:130px;"/></td>
			
			
			
			<td style="vertical-align:top;">&nbsp;&nbsp;&nbsp;<button class="btn btn-mini btn-light" onclick="search();"><i id="nav-search-icon" class="icon-search"></i></button></td>
			<td style="vertical-align:top;">&nbsp;&nbsp;&nbsp;<button class="btn btn-mini btn-light" onclick="reset();"> <i id="nav-search-icon" class="icon-refresh"></i></button></td>
		
		</tr>
	</table>
	<!-- 检索  -->

	<table id="table_report" class="table table-striped table-bordered table-hover">
		<thead>
		<tr>
			<th class="center">序号</th>
			<th class='center'>消息内容</th>
			<th class='center'>推送时间</th>
			<th class='center'>操作员</th>
			<th class='center'>操作</th>
		</tr>
		</thead>
		<c:choose>
			<c:when test="${not empty varList}">
				<c:forEach items="${varList}" var="var" varStatus="vs">
				<tr>
				<td class="center">${vs.index + 1 }</td>
				<td class="center"><a onclick="newsPush('${var.N_ID}')" style="cursor:pointer;" >${var.NewsContent}</a></td>
				<td class="center"><fmt:formatDate value="${var.PushTime}" pattern="yyyy-MM-dd" /></td>
				<td class='center'>${var.PushUser }</td>
				<td style="width: 155px;">
					<c:if test="${var.PushTime == null }">
						<a class='btn btn-mini btn-info' title="编辑" onclick="edit('${var.N_ID }')" ><i class='icon-edit'></i></a>
					
						<a class='btn btn-mini btn-danger' title="删除"  onclick="del('${var.N_ID }')"><i class='icon-trash'></i></a>
						
						<a class='btn btn-mini btn-pink' title="名单设置"  onclick="toNewsPush('${var.N_ID }')"><i class='icon-eye-open'></i></a>
					
						<a class='btn btn-mini btn-info' title="推送" onclick="push('${var.N_ID }')" ><i class='icon-envelope'></i></a>
					</c:if>
				</td>
				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
				<td colspan="100" class="center">没有相关数据</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	
		
		<div class="page-header position-relative">
		<table style="width:100%;">
			<tr>
				<td style="vertical-align:top;width:50px;"><a class="btn btn-small btn-success" onclick="add();">新增</a></td>
				
				<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
			</tr>
		</table>
		</div>
	
	
	</form>
</div>
</div>
<div class="row-fluid">
		<div  class="span12">
			<iframe id="z1" onload="setIframeHeight(this)" width="100%"  frameborder="0"  ></iframe>
		</div>
		
		
	
</div>
</body>
</html>
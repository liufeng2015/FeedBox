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
</script> 
</head>

<body>
<div id="page-content" class="clearfix">
<div class="row-fluid">	
	<!-- 检索  -->
	<form action="<%=basePath%>/logInfo.do" method="post" name="userForm" id="userForm">
	<table>
		<tr>
			<td><font color="#808080">日志内容：</font></td>
			<td><input type="text" name="FuzzySearch" value="${pd.FuzzySearch }" placeholder="" style="width:130px;"/></td>
			<td style="vertical-align:top;">&nbsp;&nbsp;&nbsp;<button class="btn btn-mini btn-light" onclick="search();"><i id="nav-search-icon" class="icon-search"></i></button></td>
		</tr>
	</table>
	<!-- 检索  -->

	<table id="table_report" class="table table-striped table-bordered table-hover">
		<thead>
		<tr>
			<th class="center">序号</th>
			<th class="center">类型</th>
			<th class="center">状态</th>
			<th class="center">地址</th>
			<th class='center'>日志信息</th>
			<th class='center'>日志产生时间</th>
			<th class='center'>操作人</th>
		</tr>
		</thead>
		<c:choose>
			<c:when test="${not empty varList}">
				<c:forEach items="${varList}" var="var" varStatus="vs">
				<tr>
					<td class="center">${vs.index + 1 }</td>
					<td class='center'>${var.TYPE}</td>
					<td class='center'>${var.STATE}</td>
					<td class='center'>${var.ADDRESS}</td>
					<td class='center'>${var.INFO}</td>
					<td class="center">${var.CreateTime}</td>
					<td class="center">${var.CreateUser}</td>					
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
				<td style="vertical-align:top;width:50px;"><a class="btn btn-small btn-success" onclick="javascript:history.go(-1);">返回</a></td>
				<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
			</tr>
		</table>
		</div>	
	</form>
</div>
</div>

</body>
</html>
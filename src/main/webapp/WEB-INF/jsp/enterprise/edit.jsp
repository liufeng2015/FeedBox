<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="dataMap" value='<%=com.fh.util.DataConstants.dataMap%>'/>
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
		


<script type="text/javascript">


		
function save(){
	
	
	$("#Form").submit();
	$("#zhongxin").hide();
	$("#zhongxin2").show();
	
}
		
</script>

</head>

<body>
<div id="page-content" class="clearfix">
<div class="row-fluid">
	<div id="zhongxin">
	<form action="enterprise/save.do" method="post" name="Form" id="Form">
	<input type="hidden" name="E_ID" id="E_ID" value="${pd.E_ID }"/>
	<div align="center">
		<br/>
       <table id="table_report" class="table table-bordered">
                    <tr>
					  <td colspan="18">
					      <h2 align="center">企业基本情况登记表</h2>
					  </td>
					</tr>
					<tr>
						<td class="center" rowspan="2" colspan="1">企业名称</td>
						<td class="center" rowspan="2" colspan="3"><input type="text" class="span12" id="Name" name="Name" placeholder="这里输入姓名" value="${pd.Name}"></td>
						<td class="center" colspan="1">法人代表</td>
						<td class="center" colspan="1"><input type="text" id="LegalRepresentative" name="LegalRepresentative" placeholder="这里输入法人代表" value="${pd.LegalRepresentative}"></td>
						<td class="center" >籍贯</td>
						<td class="center" colspan="1"><input type="text" id="Origin" name="Origin" placeholder="这里输入籍贯" value="${pd.Origin}"></td>
						<td class="center" colspan="1" rowspan="2">联系电话</td>
						<td class="center">固定电话</td>
						<td class="center" colspan="2"><input type="text" class="span12" id="Telephone" name="Telephone" placeholder="这里输入固定电话" value="${pd.Telephone}"></td>
					</tr>
					<tr> 
					   <td class="center" colspan="1">常用地址</td>
					   <td class="center" colspan="3"><input type="text" class="span12" id="CommonAddress" name="CommonAddress" placeholder="这里输入常用地址" value="${pd.CommonAddress}"></td>
					   <td class="center">移动手机</td>
					   <td class="center" colspan="2"><input type="text" class="span12" id="Phone" name="Phone" placeholder="这里输入移动手机" value="${pd.Phone}"></td>
					</tr>
					<tr>
					  <td class="center" colspan="1">注册地址</td>
					  <td class="center" colspan="3"><input type="text" class="span12" id="RegisteredAddress" name="RegisteredAddress" placeholder="这里输入注册地址" value="${pd.RegisteredAddress}"></td>
					  <td class="center" colspan="1">成立时间</td>
					  <td class="center" colspan="1">
					  		<input class="span10 date-picker"  name="EstablishmentTime" id="EstablishmentTime" value="${pd.EstablishmentTime}" type="text" placeholder="这里输入成立时间" date-format="yyyy-mm-dd" />
							<span class="add-on"><i class="icon-calendar"></i></span>
					  </td>
					  <td class="center" colspan="1">统一信用代码</td>
					  <td class="center" colspan="2"><input type="text" class="span12" id="UniformCreditCode" name="UniformCreditCode" placeholder="这里输入统一信用代码" value="${pd.UniformCreditCode}"></td>
					  <td class="center">企业邮箱</td>
					  <td class="center" colspan="2"><input type="text" class="span12" id="Email" name="Email" placeholder="这里输入企业邮箱" value="${pd.Email}"></td>
					</tr>
					<tr>
					  <td class="center" colspan="1">注册资本（万元）</td>
					  <td class="center" colspan="3"><input type="text" class="span12" id="RegisteredCapital" name="RegisteredCapital" placeholder="这里输入注册资本（万元）" value="${pd.RegisteredCapital}"></td>
					  <td class="center" colspan="1">企业性质</td>
					  <td class="center" colspan="3">
					     <select id="Nature" name="Nature" style="width: 100%;" name="QYXZ" id="QYXZ">
	                        <option value="">请选择</option>
	                        <c:forEach items="${dataMap['Nature']}" var="var" varStatus="vs">
							  
							  	<c:choose>
									<c:when test="${pd.Nature eq var.key}">
										<option value='${var.key}' selected="selected" >${var.value}</option>
									</c:when>
									<c:otherwise>
										<option value="${var.key }">${var.value }</option>
									</c:otherwise>
								</c:choose>
							  </c:forEach>
	                        
	                        
			             </select>
					  </td>
					  <td class="center" colspan="2">是否异地经营</td>
					    <td class="center" colspan="2">
					     <select style="width: 100%;" name="IsAbnormalOperation" id="IsAbnormalOperation">
	                        <option value="">请选择</option>
	                    	<c:forEach items="${dataMap['IsAbnormalOperation']}" var="var" varStatus="vs">
							  
							  	<c:choose>
									<c:when test="${pd.IsAbnormalOperation eq var.key}">
										<option value='${var.key}' selected="selected" >${var.value}</option>
									</c:when>
									<c:otherwise>
										<option value="${var.key }">${var.value }</option>
									</c:otherwise>
								</c:choose>
							  </c:forEach>
	                     
			             </select>
					  </td>
					</tr>
					<tr>
					  <td class="center" colspan="1">企业经营地址</td>
					  <td class="center" colspan="3"><input type="text" class="span12" id="BusinessAddress" name="BusinessAddress" placeholder="这里输入企业经营地址" value="${pd.BusinessAddress}"></td>
					  <td class="center" colspan="1">主营业务</td>
					  <td class="center" colspan="3"><input type="text" class="span12" id="MainBusiness" name="MainBusiness" placeholder="这里输入主营业务" value="${pd.MainBusiness}"></td>
					  <td class="center" colspan="2">所属行业</td>
					  <td class="center" colspan="2"><input type="text" class="span12" id="Industry" name="Industry" placeholder="这里输入所属行业" value="${pd.Industry}"></td>
					</tr>
					<tr>
					  <td class="center" colspan="1">企业总投资（万元）</td>
					  <td class="center" colspan="3"><input type="text" class="span12" id="TotalInvestment" name="TotalInvestment" placeholder="这里输入企业总投资（万元）" value="${pd.TotalInvestment}"></td>
					  <td class="center" colspan="3">上年度年生产状况（单位：万元）</td>
					  <td colspan="5">
					            产值      <input type="text" class="span5" id="OutputValue" name="OutputValue" placeholder="这里输入产值（万元）" value="${pd.OutputValue}">
					            税收     <input type="text" class="span5" id="TaxRevenue" name="TaxRevenue" placeholder="这里输入税收（万元）" value="${pd.TaxRevenue}">
					  </td>
					</tr>
					<tr>
					  <td class="center" colspan="1">上市情况</td>
					  <td class="center" colspan="11">
					    <select style="width: 100%;" name="ListingSituation" id="ListingSituation">
	                        <option value="">请选择</option>
	                     		<c:forEach items="${dataMap['ListingSituation']}" var="var" varStatus="vs">
							  
							  	<c:choose>
									<c:when test="${pd.ListingSituation eq var.key}">
										<option value='${var.key}' selected="selected" >${var.value}</option>
									</c:when>
									<c:otherwise>
										<option value="${var.key }">${var.value }</option>
									</c:otherwise>
								</c:choose>
							  </c:forEach>
			             </select>
					  </td>
					</tr>
					<tr>
					  <td class="center" colspan="1">企业占地面积(㎡)</td>
					  <td class="center"><input type="text" class="span12" id="AreaCovered" name="AreaCovered" placeholder="这里输入企业占地面积(㎡)" value="${pd.AreaCovered}"></td>
					  <td class="center">已建设面积</td>
					  <td class="center"><input type="text" class="span12" id="BuiltArea" name="BuiltArea" placeholder="这里输入已建设面积(㎡)" value="${pd.BuiltArea}"></td>
					  <td class="center">未建设面积</td>
					  <td class="center">&nbsp;<input type="text" class="span12" id="UnBuiltArea" name="UnBuiltArea" placeholder="这里输入未建设面积(㎡)" value="${pd.UnBuiltArea}"></td>
					  <td class="center" colspan="1">厂房建筑面积(㎡)</td>
					  <td class="center" colspan="1">&nbsp;<input type="text" class="span12" id="WorkshopArea" name="WorkshopArea" placeholder="这里输入厂房建筑面积(㎡)" value="${pd.WorkshopArea}"></td>
					  <td class="center" colspan="1">厂房已使用面积(㎡)</td>
					  <td class="center" >&nbsp;<input type="text" class="span12" id="FactoryArea" name="FactoryArea" placeholder="这里输入厂房已使用面积(㎡)" value="${pd.FactoryArea}"></td>
					  <td class="center">空余面积(㎡)</td>
					  <td class="center">&nbsp;<input type="text" class="span12" id="SpareArea" name="SpareArea" placeholder="这里输入空余面积(㎡)" value="${pd.SpareArea}"></td>
					</tr>
					<tr>
					  <td class="center" colspan="1">厂房剩余面积(㎡)（注明剩余面积所在楼层）</td>
					  <td class="center">&nbsp;<input type="text" class="span12" id="ResidualArea" name="ResidualArea" placeholder="这里输入厂房剩余面积" value="${pd.ResidualArea}"></td>
					  <td class="center">用电量（KW)</td>
					  <td class="center">&nbsp;<input type="text" class="span12" id="ElectricityConsumption" name="ElectricityConsumption" placeholder="这里输入用电量（KW)" value="${pd.ElectricityConsumption}"></td>
					  <td class="center">厂房结构</td>
					  <td class="center" colspan="2">
					    <select style="width: 100%;" name="PowerhouseStructure" id="PowerhouseStructure">
	                        <option value="">请选择</option>
	                    
		                 
		                 	<c:forEach items="${dataMap['PowerhouseStructure']}" var="var" varStatus="vs">
							  
							  	<c:choose>
									<c:when test="${pd.PowerhouseStructure eq var.key}">
										<option value='${var.key}' selected="selected" >${var.value}</option>
									</c:when>
									<c:otherwise>
										<option value="${var.key }">${var.value }</option>
									</c:otherwise>
								</c:choose>
							  </c:forEach>
			             </select>
			             
			             
					  </td>
					  <td class="center" colspan="1">厂房来源</td>
					  <td class="center" colspan="1">
					    <select style="width: 100%;" name="PowerhouseSource" id="PowerhouseSource">
	                        <option value="">请选择</option>
	                        <c:forEach items="${dataMap['PowerhouseSource']}" var="var" varStatus="vs">
							  
							  	<c:choose>
									<c:when test="${pd.PowerhouseSource eq var.key}">
										<option value='${var.key}' selected="selected" >${var.value}</option>
									</c:when>
									<c:otherwise>
										<option value="${var.key }">${var.value }</option>
									</c:otherwise>
								</c:choose>
							  </c:forEach>
	                     
			             </select>
					  </td>
					  <td class="center">是否有意出让</td>
					  <td class="center" colspan="2">
					    <select style="width: 100%;" name="IsSell" id="IsSell">
	                        <option value="">请选择</option>
	                     
		                  	<c:forEach items="${dataMap['IsSell']}" var="var" varStatus="vs">
							  
							  	<c:choose>
									<c:when test="${pd.IsSell eq var.key}">
										<option value='${var.key}' selected="selected" >${var.value}</option>
									</c:when>
									<c:otherwise>
										<option value="${var.key }">${var.value }</option>
									</c:otherwise>
								</c:choose>
							  </c:forEach>
			             </select>
					  </td>
					</tr>
					<tr>
					  <td class="center" rowspan="2" colspan="1">厂房权属企业（人）</td>
					  <td class="center" rowspan="2" colspan="3">&nbsp;<input type="text" class="span12" id="Obligation" name="Obligation" placeholder="这里输入厂房权属企业（人）" value="${pd.Obligation}"></td>
					  <td class="center" rowspan="2" colspan="2">联系人及联系电话</td>
					  <td class="center" rowspan="2" colspan="2">&nbsp;<input type="text" class="span12" id="Contacts" name="Contacts" placeholder="这里输入联系人及联系电话" value="${pd.Contacts}"></td>
					  <td class="center" rowspan="2" colspan="1">土地性质</td>
					  <td class="center" colspan="3">
					    <select style="width: 100%;" name="NatureLand" id="NatureLand">
	                        <option value="">请选择</option>
	                     
		                 	<c:forEach items="${dataMap['NatureLand']}" var="var" varStatus="vs">
							  
							  	<c:choose>
									<c:when test="${pd.NatureLand eq var.key}">
										<option value='${var.key}' selected="selected" >${var.value}</option>
									</c:when>
									<c:otherwise>
										<option value="${var.key }">${var.value }</option>
									</c:otherwise>
								</c:choose>
							  </c:forEach>
			             </select>
					  </td>
					</tr>
					<tr>
					  <td class="center" colspan="2">容积率</td>
					  
					  <td class="center">&nbsp;<input type="text" class="span12" id="VolumeRatio" name="VolumeRatio" placeholder="这里输入容积率" value="${pd.VolumeRatio}"></td>
					</tr>
					<tr>
					  <td class="center" colspan="1">企业总人数</td>
					  <td class="center" colspan="3"> &nbsp;<input type="text" class="span12" id="TotalNumber" name="TotalNumber" placeholder="这里输入企业总人数" value="${pd.TotalNumber}"></td>
					  <td class="center" colspan="2">本地职工数</td>
					  <td class="center" colspan="2">&nbsp;<input type="text" class="span12" id="LocalNumber" name="LocalNumber" placeholder="这里输入本地职工数" value="${pd.LocalNumber}"></td>
					  <td class="center" colspan="1">外来职工数</td>
					  <td class="center" colspan="3"> &nbsp;<input type="text" class="span12" id="ExternalNumber" name="ExternalNumber" placeholder="这里输入外来职工数" value="${pd.ExternalNumber}"></td>
					</tr>
					<tr>
					  <td class="center" colspan="1">是否组建工会</td>
					  <td class="center" colspan="3">
					     <select style="width: 100%;" name="IsLabourUnion" id="IsLabourUnion">
	                        <option value="">请选择</option>
	                    
		                 	<c:forEach items="${dataMap['IsLabourUnion']}" var="var" varStatus="vs">
							  
							  	<c:choose>
									<c:when test="${pd.IsLabourUnion eq var.key}">
										<option value='${var.key}' selected="selected" >${var.value}</option>
									</c:when>
									<c:otherwise>
										<option value="${var.key }">${var.value }</option>
									</c:otherwise>
								</c:choose>
							  </c:forEach>
			             </select>
					  </td>
					  <td class="center" colspan="2">是否组建党支部</td>
					  <td class="center" colspan="2">
					     <select style="width: 100%;" name="IsPartyBranch" id="IsPartyBranch">
	                        <option value="">请选择</option>
	                     
		                 	<c:forEach items="${dataMap['IsPartyBranch']}" var="var" varStatus="vs">
							  
							  	<c:choose>
									<c:when test="${pd.IsPartyBranch eq var.key}">
										<option value='${var.key}' selected="selected" >${var.value}</option>
									</c:when>
									<c:otherwise>
										<option value="${var.key }">${var.value }</option>
									</c:otherwise>
								</c:choose>
							  </c:forEach>
			             </select>
					  </td>
					  <td class="center" colspan="1">党员人数</td>
					  <td class="center" colspan="3">&nbsp;<input type="text" class="span12" id="PartyMembership" name="PartyMembership" placeholder="这里输入党员人数" value="${pd.PartyMembership}"></td>
					</tr>
					<tr>
					  <td class="center" colspan="1">是否有特种设备</td>
					  <td class="center" colspan="3">
					     <select style="width: 100%;" name="IsSpecialEquipment" id="IsSpecialEquipment">
	                        <option value="">请选择</option>
	                     
		                 	<c:forEach items="${dataMap['IsSpecialEquipment']}" var="var" varStatus="vs">
							  
							  	<c:choose>
									<c:when test="${pd.IsSpecialEquipment eq var.key}">
										<option value='${var.key}' selected="selected" >${var.value}</option>
									</c:when>
									<c:otherwise>
										<option value="${var.key }">${var.value }</option>
									</c:otherwise>
								</c:choose>
							  </c:forEach>
			             </select>
					  </td>
					  <td class="center" colspan="2">特种设备种类及数量</td>
					  <td class="center" colspan="6"> &nbsp;<input type="text" class="span12" id="SpecialEquipmentNumber" name="SpecialEquipmentNumber" placeholder="这里输入特种设备种类及数量" value="${pd.SpecialEquipmentNumber}"></td>
					</tr>
					<tr>
					  <td class="center" colspan="1">安全生产许可证名称</td>
					  <td class="center" colspan="3">&nbsp;<input type="text" class="span12" id="SafeProductionLicense" name="SafeProductionLicense" placeholder="这里输入安全生产许可证名称" value="${pd.SafeProductionLicense}"></td>
					  <td class="center" colspan="2">安全生产许可证编码</td>
					  <td class="center" colspan="2">&nbsp;<input type="text" class="span12" id="SafeProductionNumber" name="SafeProductionNumber" placeholder="这里输入安全生产许可证编码" value="${pd.SafeProductionNumber}"></td>
					  <td class="center" colspan="1">证书有效期</td>
					  <td class="center" colspan="3">
					  <input class="span10 date-picker"  name="CertificateValidity" id="CertificateValidity" value="${pd.CertificateValidity}" type="text" placeholder="这里输入证书有效期" date-format="yyyy-mm-dd" />
							<span class="add-on"><i class="icon-calendar"></i></span>
					 </td>
					</tr>
					<tr>
					  <td class="center" colspan="1">事务管理人员</td>
					  <td class="center" colspan="3">&nbsp;<input type="text" class="span12" id="TransactionManagement" name="TransactionManagement" placeholder="这里输入事务管理人员" value="${pd.TransactionManagement}"></td>
					  <td class="center" colspan="2">联系电话</td>
					  <td class="center" colspan="2">&nbsp;<input type="text" class="span12" id="TransactionManagementPhone" name="TransactionManagementPhone" placeholder="这里输入联系电话" value="${pd.TransactionManagementPhone}"></td>
					  <td class="center" colspan="1">微信和QQ号</td>
					  <td class="center" colspan="3">&nbsp;<input type="text" class="span12" id="TransactionManagementQQ" name="TransactionManagementQQ" placeholder="这里输入微信和QQ号" value="${pd.TransactionManagementQQ}"></td>
					</tr>
					<tr>
					  <td class="center" colspan="1">安全管理人员</td>
					  <td class="center" colspan="3"> &nbsp;<input type="text" class="span12" id="SecurityManagement" name="SecurityManagement" placeholder="这里输入安全管理人员" value="${pd.SecurityManagement}"></td>
					  <td class="center" colspan="2">联系电话</td>
					  <td class="center" colspan="2">&nbsp;<input type="text" class="span12" id="SecurityManagementPhone" name="SecurityManagementPhone" placeholder="这里输入联系电话" value="${pd.SecurityManagementPhone}"></td>
					  <td class="center" colspan="1">微信和QQ号</td>
					  <td class="center" colspan="3">&nbsp;<input type="text" class="span12" id="SecurityManagementQQ" name="SecurityManagementQQ" placeholder="这里输入微信和QQ号" value="${pd.SecurityManagementQQ}"></td>
					</tr>
					<tr>
					  <td class="center" colspan="1">安全管理人员培训情况</td>
					  <td class="center" colspan="3">
					     <select style="width: 100%;" name="SecurityManagementTrain" id="SecurityManagementTrain">
	                        <option value="">请选择</option>
	                     
		                 	<c:forEach items="${dataMap['SecurityManagementTrain']}" var="var" varStatus="vs">
							  
							  	<c:choose>
									<c:when test="${pd.SecurityManagementTrain eq var.key}">
										<option value='${var.key}' selected="selected" >${var.value}</option>
									</c:when>
									<c:otherwise>
										<option value="${var.key }">${var.value }</option>
									</c:otherwise>
								</c:choose>
							  </c:forEach>
			             </select>
					  </td>
					  <td class="center">证件有效期</td>
					  <td class="center">
					  		<input class="span10 date-picker"  name="SecurityManagementValidity" id="SecurityManagementValidity" value="${pd.SecurityManagementValidity}" type="text" placeholder="这里输入证件有效期" date-format="yyyy-mm-dd" />
							<span class="add-on"><i class="icon-calendar"></i></span>
					  </td>
					  <td class="center" colspan="1">企业是否通过环评</td>
					  <td class="center" colspan="1">
					     <select style="width: 100%;" name="IsEia" id="IsEia">
	                        <option value="">请选择</option>
	                    
		                 	<c:forEach items="${dataMap['IsEia']}" var="var" varStatus="vs">
							  
							  	<c:choose>
									<c:when test="${pd.IsEia eq var.key}">
										<option value='${var.key}' selected="selected" >${var.value}</option>
									</c:when>
									<c:otherwise>
										<option value="${var.key }">${var.value }</option>
									</c:otherwise>
								</c:choose>
							  </c:forEach>
			             </select>
					  </td>
					  <td class="center" colspan="1">环保批文号</td>
					  <td class="center" colspan="3">&nbsp;<input type="text" class="span12" id="EnvironmentalApprovals" name="EnvironmentalApprovals" placeholder="这里输入环保批文号" value="${pd.EnvironmentalApprovals}"></td>
					</tr>
					<tr>
					  <td class="center" colspan="1">企业特殊工种种类</td>
					  <td class="center" colspan="3">&nbsp;<input type="text" class="span12" id="SpecialWork" name="SpecialWork" placeholder="这里输入企业特殊工种种类" value="${pd.SpecialWork}"></td>
					  <td class="center" colspan="2">特殊工种人数</td>
					  <td class="center" colspan="6">&nbsp;<input type="text" class="span12" id="SpecialWorkNumber" name="SpecialWorkNumber" placeholder="这里输入特殊工种人数" value="${pd.SpecialWorkNumber}"></td>
					</tr> 
					<tr>
					  <td class="center" colspan="4">企业是否所属危化企业或重点防火企业</td>
					  <td class="center" colspan="2">
					     <select style="width: 100%;" name="IsHazardousEnterprise" id="IsHazardousEnterprise">
	                        <option value="">请选择</option>
	                     
		                 	<c:forEach items="${dataMap['IsHazardousEnterprise']}" var="var" varStatus="vs">
							  
							  	<c:choose>
									<c:when test="${pd.IsHazardousEnterprise eq var.key}">
										<option value='${var.key}' selected="selected" >${var.value}</option>
									</c:when>
									<c:otherwise>
										<option value="${var.key }">${var.value }</option>
									</c:otherwise>
								</c:choose>
							  </c:forEach>
			             </select>
					  </td>
					  <td class="center" colspan="2">企业标准化是否创建</td>
					  <td class="center" colspan="4">
					     <select style="width: 100%;" name="IsStandardize" id="IsStandardize">
	                        <option value="">请选择</option>
	                    
		                 	<c:forEach items="${dataMap['IsStandardize']}" var="var" varStatus="vs">
							  
							  	<c:choose>
									<c:when test="${pd.IsStandardize eq var.key}">
										<option value='${var.key}' selected="selected" >${var.value}</option>
									</c:when>
									<c:otherwise>
										<option value="${var.key }">${var.value }</option>
									</c:otherwise>
								</c:choose>
							  </c:forEach>
			             </select>
					  </td>
					</tr>
					<tr>
					  <td class="center" colspan="1">使用能源方式</td>
					  <td class="center" colspan="7">
					     <select style="width: 100%;" name="EnergyMode " id="EnergyMode">
	                        <option value="">请选择</option>
	                    
		                 	<c:forEach items="${dataMap['EnergyMode']}" var="var" varStatus="vs">
							  
							  	<c:choose>
									<c:when test="${pd.EnergyMode eq var.key}">
										<option value='${var.key}' selected="selected" >${var.value}</option>
									</c:when>
									<c:otherwise>
										<option value="${var.key }">${var.value }</option>
									</c:otherwise>
								</c:choose>
							  </c:forEach>
			             </select>
					  </td>
					  <td class="center" colspan="1">排水方式</td>
					  <td class="center" colspan="3">
					     <select style="width: 100%;" name="DrainageMethod " id="DrainageMethod">
	                        <option value="">请选择</option>
	                    
		                 <c:forEach items="${dataMap['DrainageMethod']}" var="var" varStatus="vs">
							  
							  	<c:choose>
									<c:when test="${pd.DrainageMethod eq var.key}">
										<option value='${var.key}' selected="selected" >${var.value}</option>
									</c:when>
									<c:otherwise>
										<option value="${var.key }">${var.value }</option>
									</c:otherwise>
								</c:choose>
							  </c:forEach>
			             </select>
					  </td>
					</tr>    
				</table>
				
				<div class="form-actions">
				<a class="btn btn-primary" onclick="save();">保存</a>
				&nbsp; &nbsp; &nbsp;
				<a class="btn btn-danger" onclick="top.Dialog.close();">取消</a>
				
			</div>
	</div>
	
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
	</form>
	</div>
</div>

</div>

		<script type="text/javascript">
		$(top.hangge());
		$(function() {

			$('#EstablishmentTime').datepicker();
			$('#CertificateValidity').datepicker();
			$('#SecurityManagementValidity').datepicker();
			
		});
		</script>
</body>
</html>
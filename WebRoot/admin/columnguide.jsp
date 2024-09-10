﻿<%@page import="java.text.MessageFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>首页栏目向导</title>
    <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
  
<script type="text/javascript"
	src="${pageContext.request.contextPath}/webui/jquery/jquery-1.9.0.js"></script>
<link
	href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js"
	type="text/javascript"></script>
<link
	href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.theme.default.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}/webui/treetable/js/jquery.treetable.js"
	type="text/javascript"></script>
<script type="text/javascript">
		
			$(function() {
			   
			    $(".btn-add").click(function(){
		                return confirm("你确定要加入该栏目");
			    });
			});
       </script>
</head>
<body >
			<div class="search-title">
				<h2>首页栏目选择向导</h2>
				<div class="description">
					
				</div>
			</div>
			<div class="clear"></div>
			<table  width="100%" border="0" cellspacing="0"
				cellpadding="0" class="ui-record-table">
				
				<tbody>
					<c:if test="${listspcategory== null || fn:length(listspcategory) == 0}">
						<tr>
							<td >没有商品类别信息</td>
						</tr>
					</c:if>
					      <%	
					      IndexcolumnsService icSrv=BeansUtil.getBean("indexcolumnsService", IndexcolumnsService.class);
									if(request.getAttribute("listspcategory")!=null)
								      {
									  List<Spcategory> listspcategory=( List<Spcategory>)request.getAttribute("listspcategory");
								     for(Spcategory  temspcategory  :   listspcategory)
								      {
							%>
						<tr >
							<td >
							    <%=temspcategory.getName() %>
								
										
							  
							  <%
							     boolean isexist=icSrv.isExist(MessageFormat.format("where colid={0} and xtype=''商品''",temspcategory.getId()));  
							     if(!isexist){
							    	
							  %>
							      
							       <a  class="btn-add orange-href"  href="indexcolumnsmanager.do?actiontype=save&spcid=<%=temspcategory.getId() %>">
							         <img src="images/add.gif">加入栏目
								   </a>
							  <%}else{%>
							              <span class="orange-href">已加入</span>
							  <%} %>
							         
							
							
		                     </td>
						</tr>
					    <%}}%>
				</tbody>
			</table>
</body>
</html>

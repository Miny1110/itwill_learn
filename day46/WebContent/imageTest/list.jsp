<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri='http://java.sun.com/jsp/jstl/core' %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이미지 게시판</title>

<link rel="stylesheet" type="text/css" href="<%=cp%>/imageTest/data/style.css">

</head>
<body>

<br/><br/>

<table width="700" cellpadding="0" cellspacing="3" bgcolor="#e4e4e4" style="margin: auto;">
<tr height="40">
	<td bgcolor="#ffffff" style="padding-left: 10px;">
	<b>이미지 게시판</b>
	</td>
</tr>
</table>

<br/><br/>

<table width="700" cellpadding="0" cellspacing="0" style="margin: auto;">
<tr>
	<td align="left">Total ${dataCount } articles, ${totalPage } pages / Now page is ${currentPage }</td>
	<td align="right">
		<input type="button" value="게시물 등록" onclick="location='<%=cp%>/image/write.do';" class="btn2">
	</td>
</tr>

<tr height="2"><td colspan="3" bgcolor="#cccccc"></td></tr>
</table>


<table width="700" cellpadding="0" cellspacing="0" style="margin: auto;">

<c:forEach var="dto" items="${lists }" varStatus="status">
	<c:if test="${status.count % 3 == 1}">
		<tr>
	</c:if>
		<td align="center">
		<img src="${imagePath }/${dto.saveFileName}" width="180" height="180"><br/>
		${dto.num }번 ${dto.subject } <a href="${deletePath }?num=${dto.num}">삭제</a>
		</td>
	<c:if test="${status.count % 3 == 0 }">
		</tr>
	</c:if>
</c:forEach>
</table>

<br/><br/>

<table width="700" cellpadding="0" cellspacing="0" style="margin: auto;">
<tr>
	<td align="center">${pageIndexList }</td>
</tr>
</table>









</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- 
<script type="text/javascript">
웹이 아니라 스마트폰으로 주소에 접근할 경우 다른 링크로 연결되게 한다.
	
	/* var userAgent = navigator.userAgent;
	alert(userAgent);
	핸드폰 정보를 보여주는 코드. 주석처리 해도 된다 */
	
	var smartPhones = [
		'iphone','android','ipod','windows ce','blackberry','nokia','webos',
		'opera mini','sonyericsson','opera mobi'
	];
	
	for(var i in smartPhones){
		
		if(navigator.userAgent.toLowerCase().match(new RegExp(smartPhones[i]))){
			alert('어머 이건 스마트 폰이네...');
			document.location = 'http://m.naver.com';
		}
	}	
	
</script>
 -->
 
</head>
<body>

<h1>메인 페이지</h1>

1. <a href="<%=cp%>/score/list.jsp">성적처리(JSP)</a><br/>
2. <a href="<%=cp%>/board/list.jsp">게시판(JSP)</a><br/>
3. <a href="<%=cp%>/naverDB/naverDataList.jsp">네이버</a><br/>
4. <a href="<%=cp%>/guest/guest.jsp">방명록(JSP)</a><br/>
5. <a href="<%=cp%>/bbs/list.do">게시판(Servlet)</a><br/>
6. <a href="<%=cp%>/sung/list.do">성적처리(Servlet)</a><br/>

</body>
</html>
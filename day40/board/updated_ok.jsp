<%@page import="com.board.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<jsp:useBean id="dto" class="com.board.BoardDTO" scope="page"/>
<jsp:setProperty property="*" name="dto"/>

<%
	String pageNum = request.getParameter("pageNum");
	//dto에 들어가지는 않는다. 별도로 처리한다.

	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	dao.updatedData(dto);
	
	response.sendRedirect("list.jsp?pageNum=" + pageNum);

%>

<!-- 필요한게 있으면 가지고 들어와야 한다. -->
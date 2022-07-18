<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	Calendar cal = Calendar.getInstance();
	
	//오늘날짜
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH)+1;
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);
			
	//클라이언트가 넘긴 데이터
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");

	//달력에 표시할 년,월
	int year = nowYear;
	int month = nowMonth;
	
	if(strYear!=null){
		year = Integer.parseInt(strYear);
	}
	
	if(strMonth!=null){
		month = Integer.parseInt(strMonth);
	}
	
	int preYear = year, preMonth = month-1;
	if(preMonth<1){
		preYear = year-1;
		preMonth = 12;
	}
	
	int nextYear = year, nextMonth = month+1;
	if(nextMonth>12){
		nextYear = year+1;
		nextMonth = 1;
	}
	
	//표시할 달력
	cal.set(year,month-1,1);
	int startDay = 1;
	int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	
	//year년 month월 1일의 요일수
	int week = cal.get(Calendar.DAY_OF_WEEK);
			
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>만년달력</title>

<style type="text/css">

body {
	font-size: 10pt;
}

td {
	font-size: 10pt;
}

a {
	text-decoration: none;
	color: blue;
}

</style>

<script type="text/javascript">

	function yearSet() {
		
		var f = document.myForm;
		
		var startYear = <%=year%> - 5;
		
		for(var i=0;i<11;i++){
			f.userYear[i] = new Option(startYear + i, startYear + i);
		}
		f.userYear[5].selected = true;
		
		for(var i=0;i<12;i++){
			f.userMonth[i] = new Option(i+1);
		}
		
	}
	
	function yearUpdate(){
		
		var startYear2 = 0;

		for(var i=0;i<11;i++){
			if(f.userYear[i].selected==true){
				startYear2=f.userYear[i];
				return;
			}
		}
		for(var i=0;i<11;i++){
			f.userYear[i] = new Option(startYear2 + i, startYear2 + i);
		}
		
	}
		

</script>

</head>
<body onload="yearSet();">

<br/><br/>
<form action="" name="myForm">
<table align="center" width="210" cellpadding="2" cellspacing="1">
<tr>
	<td align="right">
	<select name="userYear" onchange="yearUpdate();"></select>
	년
	</td>

	<td align="left">
	<select name="userMonth"></select>
	월
	</td>
</tr>
</table>

<table align="center" width="210" cellpadding="0" cellspacing="1" bgcolor="#cccccc">
<tr>
	<td bgcolor="#e6e4e6" align="center"><font color="red">일</font></td>
	<td bgcolor="#e6e4e6" align="center">월</td>
	<td bgcolor="#e6e4e6" align="center">화</td>
	<td bgcolor="#e6e4e6" align="center">수</td>
	<td bgcolor="#e6e4e6" align="center">목</td>
	<td bgcolor="#e6e4e6" align="center">금</td>
	<td bgcolor="#e6e4e6" align="center"><font color="blue">토</font></td>
</tr>

<%
	int newLine = 0;
	
	out.print("<tr height='20'>");

	for(int i=1;i<week;i++){
		out.print("<td bgcolor='#ffffff'>&nbsp;</td>");
		newLine++;
	}
	
	for(int i=startDay;i<=endDay;i++){
		String fontColor = (newLine==0)?"red":(newLine==6)?"blue":"black";
		String bgColor = (nowYear==year)&&(nowMonth==month)&&(nowDay==i)?"#e6e4e6":"#ffffff";
		
		out.print("<td align='center' bgcolor='" + bgColor + "'><font color='" + fontColor + "'>" + i + "</font></td>");
		//<td align='center' bgColor='#e6e4e6'><font color='black'>18</font></td>
		
		newLine++;
		
		if(newLine==7&&i!=endDay){
			out.print("</tr><tr height='20'>");
			newLine = 0;
		}
		
	}
	
	while(newLine>0&&newLine<7){
		out.print("<td bgcolor='#ffffff'>&nbsp;</td>");
		newLine++;
	}
	
	out.print("</tr>");
%>

</table>
</form>
</body>
</html>
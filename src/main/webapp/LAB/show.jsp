<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>    

<%@ include file = "../db_conn/db_conn_oracle.jsp" %>

<%
String sql = null;
Statement stmt = null;

ResultSet rs = null;

sql = "select * from mem";

stmt = conn.createStatement();

try {
	rs = stmt.executeQuery(sql);

} catch (Exception e) {
	out.println("DB 접속에 문제가 발생하였습니다.");
	e.printStackTrace();
}


%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> DB 전송 값을 출력 </h2>
	
	<%
		if(rs.next()); {
		do {
		
	%>
			<table border="1" width = 600>
			<tr><td colspan = "2"> <%= rs.getString("subject") %></td></tr>
			<tr><td>글쓴이: </td><td><%= rs.getString("name") %></td></tr>
			<tr><td>이메일: </td><td><%= rs.getString("email") %></td></tr>
			<tr><td>글내용: </td><td><%= rs.getString("content") %></td></tr>
			</table>
			<br>	
	
	<%
	

			} while (rs.next());
		}
	
	
	%>

</body>
</html>
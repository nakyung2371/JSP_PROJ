<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- java.sql.*: Connection, Statement, PreparedStatement, RecodeSet 객체 -->    
<%@ page import = "java.sql.*" %>

<!-- conn: oracle xe -->
<%@ include file = "../db_conn/db_conn_mysql.jsp" %>

<% 
//변수를 초기화
String sql = null;
Statement stmt = null;

ResultSet rs = null;		//DataBase의 테이블의 레코드를 담은 객체, 
							//select 쿼리를 하면 select한 결과를 ResultSet 객체에 담아야 함
//쿼리 작성
sql = "select * from guestboard";

//Statement 객체 생성
stmt = conn.createStatement();		//stmt는 Oracle의 XE DB를 연결한 상태에서 

//stmt 객체에 sql 쿼리를 넣어서 실행

try {
	//stmt 객체에 sql 쿼리를 넣어서 실행:
	rs = stmt.executeQuery(sql);	//sql: select 문인 경우, select한 결과 레코드셋을 담은 객체: rs
		//rs는 select한 결과 레코드셋을 담고 있다.
		//rs.next(); 다음 레코드가 존재하면 true
	
} catch (Exception e) {
	out.println("DB 접속에 문제가 생겼습니다. ");
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
	<center>
	<h2> DB의 값을 읽어와서 출력하는 페이지 </h2>
	
	<%
		if (rs.next()) {		//rs의 레코드가 존재할 때 작동됨, 커서가 다음 레코드로 위치함
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
	</center>
</body>
</html>
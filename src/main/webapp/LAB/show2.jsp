<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>

<%@ include file = "../db_conn/db_conn_oracle.jsp" %>

<%
	String sql = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	sql = "select * from mem";
	
	pstmt = conn.prepareStatement(sql);
	
	try {
		rs = pstmt.executeQuery();
		
	} catch (Exception e) {
		out.println("DB에서 select 중 오류가 발생하였습니다.");
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

	<h2> PreparedStatement 쿼리 실행 후 rs에 담아서 출력 </h2>
	<table width = "600px" border = "1"> 
	<tr> <th> 이름 </th> <th> 나이 </th> <th> 몸무게 </th> <th> 주소 </th> <th> 핸드폰 번호 </th> </tr>
	
	<%
		if (rs.next()) {
			do {
	%>
		<tr>
		<td> <%= rs.getString("name") %> </td>
		<td> <%= rs.getString("age") %> </td>
		<td> <%= rs.getString("weight") %> </td>
		<td> <%= rs.getString("addr") %> </td>
		<td> <%= rs.getString("phone") %> </td>
		</tr>
	<%
			} while (rs.next());
	
		} else {
			out.println("DB에 값이 존재하지 않습니다.");
			
		}
	%>
	</table>
	
</body>
</html>
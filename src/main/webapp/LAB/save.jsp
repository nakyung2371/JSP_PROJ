<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.sql.*, java.util.*" %>    

<% request.setCharacterEncoding("UTF-8"); %>

<%
	String na = request.getParameter("name");
	String ad = request.getParameter("age");
	String we = request.getParameter("weight");
	String ar = request.getParameter("addr");
	String ph = request.getParameter("phone");  
%>

<%@ include file = "../db_conn/db_conn_oracle.jsp" %>

<%
	String sql = null;
	Statement stmt = null;
	
	sql = "insert into mem (name, age, weight, addr, phone)";
	sql = sql + "values('" + na + "', '" + ad +"', '" + we + "', '" + ar +"', '" + ph + "')";
	
	out.println(sql);
	
	stmt = conn.createStatement();
	
	try {
		stmt.execute(sql);
		
	} catch (Exception e) {
		
		e.printStackTrace();
		out.println("DB 저장에 실패하였습니다.");
	}
			

%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h2> 넘어오는 값 출력 </h2>
	이름 <%= na %> <br>
	나이 <%= ad %> <br>
	몸무게 <%= we %> <br>
	주소 <%= ar %> <br>
	핸드폰 번호 <%= ph %> <br>
	
	<h1> Statement </h1>
</body>
</html>
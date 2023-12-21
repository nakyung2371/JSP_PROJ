<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>  
<%@ include file = "./conn_oracle.jsp" %>

<%
	// for 문을 사용해서 freeboard 테이블에 값 1000 개 insert 
	String sql = null; 
	PreparedStatement pstmt = null; 		
						
	sql = "insert into freeboard (id, name, password, email, "; 
	sql += "subject,content, inputdate, masterid,readcount,replaynum,step ) " ;		
	sql += "values ( ?,?,?,?,?,?,?,?," ;
	sql +=  "0 , 0 , 0)";
	
	
	// pstmt 객체 생성 
	pstmt = conn.prepareStatement(sql); 
	
	try {
		for (int i = 0 ; i < 1000 ; i++ ) {
			// pstmt 객체의 sql 쿼리의 ? 에 변수 값 할당. 
			pstmt.setInt(1, i); 	// 1 , id 필드의 값 
			pstmt.setString(2, "홍길동 - " + i) ; 
			pstmt.setString(3, "1234") ; 
			pstmt.setString(4, "aaa@aaa.com - " + i ) ; 
			pstmt.setString(5, "제목 - " + i); 
			pstmt.setString(6, "내용 - " + i); 
			pstmt.setString(7, "23-12-21"); 
			pstmt.setInt(8, i); 
			
			pstmt.executeUpdate(); 		
			
		}
		
		out.println ("DB에 1000번 값이 잘 저장되었습니다"); 
		
	} catch (Exception e) {
		out.println ("DB 저장에 실패 했습니다. "); 
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

</body>
</html>
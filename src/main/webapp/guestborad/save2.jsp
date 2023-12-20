<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- JSP에서 java.sql 패키지의 하위 모든 클래스를 import
		java.util 패키지의 하위 모든 클래스를 import
 -->    
<%@ page import = "java.sql.*, java.util.*" %>

<!-- 클라이언트에서 넘어오는 한글이 깨지지 않게 처리 -->
<% request.setCharacterEncoding("UTF-8"); %>

<!-- 클라이언트에서 넘어오는 값을 받아서 출력: request 객체 -->
<%
	//http://localhost:8181/JSP_PROJ/guestborad/save.jsp?name=gildong&email=aaa%40aaa.com&subject=aa&contents=bb
	//파라미터(Parameter): ?변수명=값&변수명=값&변수명=값
	//파라미터로 넘어오는 값은 모두 String
	
	String na = request.getParameter("name"); 
	String em = request.getParameter("email");
	String sub = request.getParameter("subject");
	String cont = request.getParameter("contents");

%>
<!-- DB Connection 객체를 불러들임 -->
<%@ include file = "../db_conn/db_conn_oracle.jsp" %>

<!-- PreparedStatement 객체를 사용해서 DB에 저장함 -->
<%
	//client에서 받은 값을 DB에 저장함
	String sql = null;			//sql <- SQL 쿼리를 저장하는 변수
	PreparedStatement pstmt = null;		//stmt <- SQL 쿼리를 담아서 DB에 적용
	
	sql = "insert into guestboard (name, email, subject, content)";
	sql = sql + " values (?,?,?,?)";
	
	//out.println(sql);
	
	//prepareStatement 객체를 활성화: Connection 객체로 prepareStatement 객체를 생성함. ()
	pstmt = conn.prepareStatement(sql);
	
	//pstmt: ?에 변수의 값을 할당 후 실행
	pstmt.setString(1, na);
	pstmt.setString(2, em);
	pstmt.setString(3, sub);
	pstmt.setString(4, cont);
	
	//stmt를 사용해서 DB에 값을 insert
	try {
		//DB에 값을 넣을 때 오류가 발생되더라도 전체 프로그램이 중지되지 않도록 설정
		pstmt.executeUpdate();		//DataBase에 저장 완료
		
		
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

	<p><p><p>
	<!-- 변수에 담긴 값을 출력 -->
	<h2> 넘어오는 변수 값 출력 </h2>
	<%= na %> <br>
	<%= em %> <br>
	<%= sub %> <br>
	<%= cont %> <br>
	
	<h1> PreparedStatement </h1>
</body>
</html>
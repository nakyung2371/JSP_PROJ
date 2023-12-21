<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*, java.util.*" %>   
<%@ include file = "../db_conn/db_conn_oracle.jsp" %>

<%
	ArrayList name = new ArrayList();
	ArrayList age = new ArrayList();
	ArrayList weight = new ArrayList();
	ArrayList addr = new ArrayList();
	ArrayList phone = new ArrayList();
	
	String sql = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	sql = "select * from mem";
	pstmt = conn.prepareStatement(sql);
	
	try {
		rs = pstmt.executeQuery();
		
	} catch (Exception e) {
		out.println("DB에 값을 읽어오는 동안 오류가 발생하였습니다.");
		e.printStackTrace();
	}

	if (rs.next()) {
		do {
			
			name.add(rs.getString("name"));
			age.add(rs.getString("age"));
			weight.add(rs.getString("weight"));
			addr.add(rs.getString("addr"));
			phone.add(rs.getString("phone"));
					
		} while (rs.next());
	}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2> RS에 저장된 값을 ArrayList에 저장 후 출력 </h2>
	<table width = "600px" border = "1"> 
	<tr> <th> 이름 </th> <th> 나이 </th> <th> 몸무게 </th> <th> 주소 </th> <th> 휴대폰 번호 </th> </tr>
	
	<%
		for (int i = 0 ; i < name.size(); i++) {
	%>
 		<tr>
		<td> <%= name.get(i) %> </td>
		<td> <%= age.get(i) %> </td>
		<td> <%= weight.get(i) %> </td>
		<td> <%= addr.get(i) %> </td>
		<td> <%= phone.get(i) %> </td>
		</tr>
 	
 	<%
		}
	%>
	</table>
</body>
</html>
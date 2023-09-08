<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 6번 //삭제 역할  -->
<%
String code = request.getParameter("code");

if(code == null)
	throw new Exception("누락된 데이터가 있습니다.");
Connection conn = null; Statement stmt = null;
try{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test0905","root","qhdks12!@");
	if(conn== null)
		throw new Exception("데이터베이스에 연결할 수 없습니다.");
	stmt = conn.createStatement();
	String command = String.format("delete from goodsinfo where code = '%s' ;", code);
	
	int rowNum = stmt.executeUpdate(command);
	
	if(rowNum < 1)
		throw new Exception("데이터를 DB에 입력할 수 없습니다.");
} finally {
	try {
		stmt.close();
	} catch (Exception ignored) {
		
	} try {
		conn.close();
	} catch (Exception ignored){
		
	} }

response.sendRedirect("output_1.jsp");

%>



</body>
</html>
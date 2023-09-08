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
<!--5번 -->
<!-- 1 -> 2 -> 4 -> 5 순으로 연결
5번을 2번으로 연결  근데 code가 없으니 
aaaa.jsp?code=a 이런 식으로 주소창에 입력해서  code 값을 지정해주기; 
-->
 
<%
String code = request.getParameter("code");
String title = request.getParameter("title");
String writer = request.getParameter("writer");
String price = request.getParameter("price");

if(code == null || title == null || writer == null || price == null)
	throw new Exception("누락된 데이터가 있습니다.");
Connection conn = null; Statement stmt = null;
try{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test0905","root","qhdks12!@");
	if(conn== null)
		throw new Exception("데이터베이스에 연결할 수 없습니다.");
	stmt = conn.createStatement();
	String command = String.format("update goodsinfo set " + 
	"title := '%s', writer := '%s',"+
	"price := %s where code = '%s';", 
	title, writer, price, code);
	
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
/* response.sendRedirect(""); */
response.sendRedirect("db_ex2.jsp?code="+code);

%>

</body>
</html>
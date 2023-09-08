<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>table2</title>
</head>
<body>
<!-- 2번 -->
<%
String code = request.getParameter("code");
Connection conn =null;
Statement stmt = null;
try{
	 Class.forName("com.mysql.jdbc.Driver");
	 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test0905","root", "qhdks12!@");
	 if(conn == null)
		 throw new Exception("데이터베이스에 연결할 수 없습니다.<BR>");
	 stmt = conn.createStatement();
	 ResultSet rs = stmt.executeQuery("select *from goodsinfo where code = " + code + ";");
	 
	 /* code를 위해 다른 페이지를 만들어서 연결해줘야 됨  */
	 if(rs.next()) {
		 String title = rs.getString("title");
		 String writer = rs.getString("writer");
		 int price = rs.getInt("price");
		 request.setAttribute("CODE", code);
		 request.setAttribute("TITLE", title);
		 request.setAttribute("WRITER", writer);
		 request.setAttribute("PRICE", new Integer(price));
	 }
	 
} finally {
	try {
		stmt.close();
	} catch (Exception ignored) {
	} }
/* RequestDispatcher dispatcher = request. getRequestDispatcher("GoodsInfoViewer.jsp"); */
/* RequestDispatcher dispatcher = request. getRequestDispatcher("db_ex3.jsp"); */ 
RequestDispatcher dispatcher = request. getRequestDispatcher("db_ex4_2.jsp");

dispatcher.forward(request, response);
%>

</body>
</html>
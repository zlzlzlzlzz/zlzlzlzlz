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


<%


Connection conn =null;
Statement stmt = null;
try{
	 Class.forName("com.mysql.jdbc.Driver");
	 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test0905","root", "qhdks12!@");
	 if(conn == null)
		 throw new Exception("데이터베이스에 연결할 수 없습니다.<BR>");
	 stmt = conn.createStatement();
	 ResultSet rs = stmt.executeQuery("select *from goodsinfo;");
	 
	 /* code를 위해 다른 페이지를 만들어서 연결해줘야 됨  */
	 if(rs.next()) {
		 
		 String code = rs.getString("code");
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





%>



</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 4번  -->
<form action=Updater.jsp method=post>
 코드: <input type = text name = code size= 5 value = '${CODE}' readonly=true><br> 
<!-- 코드: <input type = text name = code size= 5 value = 'code' readonly=true><br> -->

제목: <input type = text name = title size = 50 value = '${TITLE}'> <br>
저자: <input type = text name = writer size = 20 value = '${WRITER}'> <br>
가격: <input type = text name = price size = 8 value = '${PRICE}'>원 <br>

<input type=submit value='수정'>

</form>

</body>
</html>
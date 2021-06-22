<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>请选择要购买的书籍：</h2>
	<!-- 变量名称为book -->
	<Form action="ShoppingCarServlet"method ="POST">
		<p> <input type="checkbox" name="book" value="书籍1"/>书籍1</p>
		<p> <input type="checkbox" name="book" value="书籍2"/>书籍2</p>
		<p> <input type="checkbox" name="book" value="书籍3"/>书籍3</p>
		<p> <input type="submit" value="提交"/></p>
	</Form>
</body>
</html>

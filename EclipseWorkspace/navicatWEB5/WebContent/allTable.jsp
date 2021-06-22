<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="model.Table"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>当前数据库中的表</title>
</head>
<body>
<font size=5>
<%
String user=(String)request.getAttribute("user");
String pwd=(String)request.getAttribute("pwd");
String port=(String)request.getAttribute("port");
String database=(String)request.getAttribute("database");
Table table=(Table)request.getAttribute("Table");
String[] title=table.getTitle();
String[][] data=table.getData();
%>
<table border="1" >
<tr>


<%for(int i=0;i<data.length;i++){%>
  <tr>
  <th scope="col">
	<%for(int j=0;j<data[i].length;j++){%>
		<td><%=data[i][j]%></td>
	<%}%>
  </th>
  <th scope="col">
<form action="TableOpen"method="post"> 
<input type="hidden" name="user" value=<%=user%>>   
<input type="hidden" name="pwd" value=<%=pwd%>> 
<input type="hidden" name="port" value=<%=port%>> 
<input type="hidden" name="database" value=<%=database%>>   
<input type="hidden" name="tableName" value=<%=data[i][0]%>>     
<input type="submit" value="打开该表" style="font-size:20px;width:150px;height:40px"></br> 
</form>
  </th>
  <th scope="col">
<form action="TableDrop"method="post"> 
<input type="hidden" name="user" value=<%=user%>>   
<input type="hidden" name="pwd" value=<%=pwd%>> 
<input type="hidden" name="port" value=<%=port%>> 
<input type="hidden" name="database" value=<%=database%>>   
<input type="hidden" name="tableName" value=<%=data[i][0]%>>     
<input type="submit" value="删除该表" style="font-size:20px;width:100px;height:40px"></br> 
</form>
  </th>
  </tr>
  
<%}%><br/> 
</table>

<form action="TableInit"method="post">            
<input type="hidden" name="user" value=<%=user%>>   
<input type="hidden" name="pwd" value=<%=pwd%>> 
<input type="hidden" name="port" value=<%=port%>> 
<input type="hidden" name="database" value=<%=database%>>  
请输入表名：<input type="text" name="tableName"value="" style="font-size:30px;width:100px;height:35px"/> 
<input type="submit" value="创建该表" style="font-size:20px;width:200px;height:40px"></br> 
</form>


<form action="welcome.jsp"method="post">  
<input type="submit" value="返回" style="font-size:20px;width:200px;height:40px"></br>
</form> 
</font>
</body>
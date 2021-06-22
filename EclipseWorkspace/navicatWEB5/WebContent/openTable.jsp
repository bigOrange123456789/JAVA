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
String tableName=(String)request.getAttribute("tableName");
Table table1=(Table)request.getAttribute("describeTable");
Table table2=(Table)request.getAttribute("dataTable");//当表为空时的情况需要被考虑
String[] title1=table1.getTitle();
String[][] data1=table1.getData();
String[] title2=table2.getTitle();
String[][] data2=table2.getData();
%>
<font color="#FF0000">（1）表&nbsp<%=tableName%>&nbsp中的数据</font> 

<%if(data2.length==0)out.println("表中当前没有元素（行数为0）</br></br>");//当表中没有数据时这里为零//这里被执行了%> 
<%for(int i=0;i<data2.length;i++){%> 
<table><!--为了让form两个表单不换行这里插入了一个一行两列的表格-->
  <tr>
    <th scope="col">
<form action="RowUpdata"method="post">
<input type="hidden" name="user" value=<%=user%>>   
<input type="hidden" name="pwd" value=<%=pwd%>> 
<input type="hidden" name="port" value=<%=port%>> 
<input type="hidden" name="database" value=<%=database%>>
<input type="hidden" name="tableName" value=<%=tableName%>> 
<input type="hidden" name="data_index" value=<%=i%>> 
<%
//如何收集这里的set
String[][] describeTable_getData=data1;	
String[][] data=data2;
String condition="";//UPDATE table1 set fristName='jj'，lastName='tt' where Id=1
for(int j=0;j<describeTable_getData.length;j++) {
	if(j!=0) condition=condition+"&&";
	if(describeTable_getData[j][1].charAt(0)=='c')condition=condition+describeTable_getData[j][0]+"='"+data[i][j]+"'";
	else condition=condition+describeTable_getData[j][0]+"="+data[i][j];
}
%> 
<input type="hidden" name="condition" value=<%=condition%>> 
	<%for(int j=0;j<data2[i].length;j++){%>
			<%String s=("n__"+j);%>
			<input type="text" name=<%=s%> <%if(!data2[i][j].equals("")){%>value=<%=data2[i][j]%><%}%> style="font-size:30px;width:100px;height:35px"/>
	<%}//如何收集一行数据set%>
	<input type="submit" value="更新该行" style="font-size:20px;width:150px;height:40px">
</form>
    </th>
    
    <th scope="col">
<form action="RowDelete"method="post">
<input type="hidden" name="user" value=<%=user%>>   
<input type="hidden" name="pwd" value=<%=pwd%>> 
<input type="hidden" name="port" value=<%=port%>> 
<input type="hidden" name="database" value=<%=database%>> 
<input type="hidden" name="tableName" value=<%=tableName%>> 
<input type="hidden" name="data_index" value=<%=i%>> 
<input type="submit" value="删除该行" style="font-size:20px;width:100px;height:40px">
	</form>
    </th>
  </tr>
</table> 

</br>
<%}%>
<font color="#FF0000">（2）对表&nbsp<%=tableName%>&nbsp进行操作</font> 
<form action="RowInsert"method="post">
<input type="hidden" name="user" value=<%=user%>>   
<input type="hidden" name="pwd" value=<%=pwd%>> 
<input type="hidden" name="port" value=<%=port%>> 
<input type="hidden" name="database" value=<%=database%>> 
<input type="hidden" name="tableName" value=<%=tableName%>> 
<%for(int j=0;j<title2.length;j++){%>
            <%String s=("n_x_"+j);%>
			<input type="text" name=<%=s%> value="" style="font-size:30px;width:100px;height:35px"/>
	<%}%>
<input type="submit" value="插入该行" style="font-size:20px;width:200px;height:40px"></br> 
</form>

<form action="ColumnAdd"method="post"> 
<input type="hidden" name="user" value=<%=user%>>   
<input type="hidden" name="pwd" value=<%=pwd%>> 
<input type="hidden" name="port" value=<%=port%>> 
<input type="hidden" name="database" value=<%=database%>>  
<input type="hidden" name="tableName" value=<%=tableName%>>     
列名：<input type="text" name="columnName"value="" style="font-size:30px;width:100px;height:35px"/> 
列类型：<input type="text" name="columnType"value="" style="font-size:30px;width:100px;height:35px"/> 
<input type="submit" value="创建该列" style="font-size:20px;width:200px;height:40px"></br> 
</form>

<font color="#FF0000">（3）表&nbsp<%=tableName%>&nbsp的描述信息（对列的描述）</font> 
<% 
title1[0]="列名";
title1[1]="列类型";
%>
<table border="1" >
<tr>
<%for(int i=0;i<title1.length;i++){%>
       <th><%=title1[i]%></th>
<%}%>
	   <th><%="操作按键"%></th>
<%for(int i=0;i<data1.length;i++){%> 
	<tr><%for(int j=0;j<data1[i].length;j++){%>
		<td><%=data1[i][j]%></td>
	<%}%>
	    <td>
<form action="ColumnDrop"method="post">            
<input type="hidden" name="user" value=<%=user%>>   
<input type="hidden" name="pwd" value=<%=pwd%>> 
<input type="hidden" name="port" value=<%=port%>> 
<input type="hidden" name="database" value=<%=database%>>  
<input type="hidden" name="tableName" value=<%=tableName%>>
<input type="hidden" name="columnName" value=<%=data1[i][0]%>>
<input type="submit" value="删除该列" style="font-size:20px;width:200px;height:40px"></br> 
</form>	    
	    </td>
	</tr> 
<%}%><br/> 
</table>
<font color="#FF0000">（4）返回上一级</font> 
<form action="Welcome"method="post">            
<input type="hidden" name="user" value=<%=user%>>   
<input type="hidden" name="pwd" value=<%=pwd%>> 
<input type="hidden" name="port" value=<%=port%>> 
<input type="hidden" name="database" value=<%=database%>>  
<input type="submit" value="返回" style="font-size:20px;width:200px;height:40px"></br> 
</form>
</font>
</body>
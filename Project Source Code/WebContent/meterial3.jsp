<%@ include file="shead.jsp" %>
<div style="position:absolute; top:200px; left:500px">
<%@page import="java.sql.*,java.lang.*,dbconnection.*"%>
<% 

String sub=null,met=null,url=null;
try{
	
	Connection con=DBConnection.dBCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from meterial");%>
	<table border=2><tr><th>Subject</th><th>Meterial</th><th>Read</th></tr>
	<% while(rs.next())
	{  url="Meterials\\"+rs.getString(3);%> 
		<tr><td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td><td><a href="<%=url%>">View</a></td></tr>
	<% }%>
	</table>
<%}catch(Exception e){System.out.println(e);}
%>
</div>
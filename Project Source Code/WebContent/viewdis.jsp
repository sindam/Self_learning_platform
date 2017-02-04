<%@ include file="shead.jsp" %>
<div style="position:absolute; top:250px; left:600px">
<%@page import="java.sql.*,java.lang.*,dbconnection.*"%>
<%ResultSet rs2=null; %>
<% 
try{
	String url=null,dname=null;
	
	Connection con=DBConnection.dBCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from discuss");
	while(rs.next())
	{   url="viewdis1.jsp?did="+rs.getInt(1)+"&sid="+rs.getString(2)+"&dname="+rs.getString(3);
		dname=rs.getString(3);
		con=DBConnection.dBCon();
		st=con.createStatement();%>
		<h3>Posted By: <%=rs.getString(2)%></h3>
	<h2><%=rs.getString(3)%></h2>
		<%rs2=st.executeQuery("select * from comment where did='"+rs.getInt(1)+"'");
		while(rs2.next())
		{%>
			<h3><%=rs2.getString(5)%>  &nbsp&nbsp&nbsp Commented by: <%=rs2.getString(6)%></h3>
		<%}
		%>
	
	<a href="<%=url%>">Comment</a><br><br>
<%	}
}catch(Exception e){System.out.println(e);}
%>
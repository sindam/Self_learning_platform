<%@ include file="shead.jsp" %>
<div style="position:absolute; top:200px; left:600px">
<%@page import="java.sql.*,java.lang.*,dbconnection.*"%>
<% 
String sid=(String)session.getAttribute("sid");
String pass=(String)session.getAttribute("pass");
String uname=null,pname=null,pic=null;
try{
	
	Connection con=DBConnection.dBCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select uname,pname from student where sid='"+sid+"' and pass='"+pass+"'");
	while(rs.next())
	{
		uname=rs.getString(1);
		pname=rs.getString(2);
	}
	pic="Gallery\\"+pname;
}catch(Exception e){System.out.println(e);}
%>
<img src="<%=pic%>" alt="No Image" width=200 height="300"><br>
<h3>WELCOME <%=uname%></h3><br><br>

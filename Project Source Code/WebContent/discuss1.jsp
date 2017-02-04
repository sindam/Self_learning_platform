<%@page import="java.sql.*,java.lang.*,dbconnection.*"%>
<% 
String dname=request.getParameter("dname");
String sid=(String)session.getAttribute("sid");

try{
	
	Connection con=DBConnection.dBCon();
	Statement st=con.createStatement();
	st.executeUpdate("insert into discuss(sid,dname) values('"+sid+"','"+dname+"')");
	response.sendRedirect("studenthome.jsp?message=Discussion Added Successfully");
}catch(Exception e){System.out.println(e);}%>
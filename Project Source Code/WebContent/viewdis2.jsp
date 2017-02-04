<%@page import="java.sql.*,java.lang.*,dbconnection.*"%>
<% 
int did=Integer.parseInt(request.getParameter("did"));
String sid=request.getParameter("sid");
String dname=request.getParameter("dname");
String com=request.getParameter("com");
String sid2=(String)session.getAttribute("sid");
try{
	
	Connection con=DBConnection.dBCon();
	Statement st=con.createStatement();
	st.executeUpdate("insert into comment(did,sid,dname,com,cby) values('"+did+"','"+sid+"','"+dname+"','"+com+"','"+sid2+"')");
	response.sendRedirect("viewdis.jsp?message=Comment Added Successfully");
}catch(Exception e){System.out.println(e);}%>

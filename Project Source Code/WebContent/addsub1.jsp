<%@page import="java.sql.*,java.lang.*,dbconnection.*"%>
<% 
int a=0;
String sub=request.getParameter("sub");
String iname=(String)session.getAttribute("iname");
try{
	
	Connection con=DBConnection.dBCon();
	Statement st=con.createStatement();
	a=st.executeUpdate("insert into sub values('"+iname+"','"+sub+"')");
	if(a!=0)
	{
		response.sendRedirect("addsub.jsp?message=Subject Added Successfully");
	}else
	{
		response.sendRedirect("addsub.jsp?message=Fail");
	}
}catch(Exception e){System.out.println(e);}
%>
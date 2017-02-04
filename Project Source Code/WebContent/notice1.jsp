<%@page import="java.sql.*,java.lang.*,dbconnection.*"%>
<% 
int a=0;
String sub=request.getParameter("sub");
String note=request.getParameter("note");
String datee=request.getParameter("datee");
String iname=(String)session.getAttribute("iname");
try{
	
	Connection con=DBConnection.dBCon();
	Statement st=con.createStatement();
	a=st.executeUpdate("insert into notice values('"+iname+"','"+sub+"','"+note+"','"+datee+"')");
	if(a!=0)
	{
		response.sendRedirect("notice.jsp?message= Added Successfully");
	}else
	{
		response.sendRedirect("notice.jsp?message=Fail");
	}
}catch(Exception e){System.out.println(e);}
%>
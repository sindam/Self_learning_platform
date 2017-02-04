<%@page import="java.sql.*,java.lang.*,dbconnection.*"%>
<% 
String uname=request.getParameter("uname");
String pass=request.getParameter("pass");
try{
	
	Connection con=DBConnection.dBCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from instructor where uname='"+uname+"' and pass='"+pass+"'");
	if(rs.next())
	{    
		session.setAttribute("iname", uname);
		session.setAttribute("pass", pass);
		response.sendRedirect("instructorhome.jsp");
	}else
	{
		response.sendRedirect("ilogin.jsp?message=Invalid Login Details");
	}
}catch(Exception e){System.out.println(e);}
%>
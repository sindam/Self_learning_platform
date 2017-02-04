<%@page import="java.sql.*,java.lang.*,dbconnection.*"%>
<% 
String sid=request.getParameter("sid");
String pass=request.getParameter("pass");
try{
	
	Connection con=DBConnection.dBCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from student where sid='"+sid+"' and pass='"+pass+"'");
	System.out.println("select * from student where sid='"+sid+"' and pass='"+pass+"'");
	if(rs.next())
	{    
		session.setAttribute("sid", sid);
		session.setAttribute("sname", rs.getString(1));
		session.setAttribute("pass", pass);
		session.setAttribute("fname", rs.getString(6));
		response.sendRedirect("studenthome.jsp");
	}else
	{
		response.sendRedirect("slogin.jsp?message=Invalid Login Details");
	}
}catch(Exception e){System.out.println(e);}
%>
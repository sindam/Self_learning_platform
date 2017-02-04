<%@page import="java.sql.*,java.lang.*,dbconnection.*"%>
<% 
String iname=request.getParameter("iname");
String dept=request.getParameter("dept");
String email=request.getParameter("email");
String dob=request.getParameter("dob");
String uname=request.getParameter("uname");
String pass=request.getParameter("pass");
Connection con=DBConnection.dBCon();
try{
PreparedStatement ps=con.prepareStatement("INSERT INTO Instructor VALUES(?,?,?,?,?,?)");
	
   	ps.setString(1,iname);
	ps.setString(2,dept);	
	ps.setString(3,email);
	ps.setString(4,dob);
    ps.setString(5,uname);
    ps.setString(6,pass);
   
    
    int x=ps.executeUpdate();
	
	if(x!=0)
	{
		response.sendRedirect("reginst.jsp?message=success");

	}
	else
	{
		response.sendRedirect("reginst.jsp?message=fail");
	}
		
} 
catch (Exception ex) 
{
	out.println(ex.getMessage());
}
	
%>

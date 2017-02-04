<%@ include file="ihead.jsp" %>
<div style="position:absolute; top:200px; left:500px">
<%@page import="java.sql.*,java.lang.*,dbconnection.*"%>
<% 

try{
	
	Connection con=DBConnection.dBCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from notice");
	while(rs.next())
	{%><div id="lastDateBlinker"><br><table border=2><tr><td><center>
		<h2 >Subject : <%=rs.getString(2)%> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <blink><%=rs.getString(4)%></blink></h2>
	    <h3>Notice : <%=rs.getString(3)%></h3>
</center><td>	 </tr></table>  </div>
	<%}
	}catch(Exception e){System.out.println(e);}%>
	</div>
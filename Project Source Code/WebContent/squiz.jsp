<%@ include file="shead.jsp" %>
<div style="position:absolute; top:250px; left:600px">
<script>
function myFunction() {
var a=document.getElementById("anjum").value;
window.open("squiz2.jsp?sub="+a,"_self");
}
</script>
<%@page import="java.sql.*,java.lang.*,dbconnection.*"%>
<% 

try{
	Connection con=DBConnection.dBCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from sub");%>
	
	Select Subject <select name=sub onChange="myFunction()" id="anjum">
	<option>select</option>
	<% while(rs.next())
	{   
	%>
	<option value="<%=rs.getString(2)%>"><%=rs.getString(2)%></option>
	<%}%>
	</select><br><br>
<%}catch(Exception e){System.out.println(e);}
	%>
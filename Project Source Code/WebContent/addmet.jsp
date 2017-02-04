<%@ include file="ihead.jsp" %>
<div style="position:absolute; top:250px; left:630px">
<script>
function validation()
{
var a=document.s.met.value;
if(a=="")
{
alert("Select Meterial");
document.s.met.focus();
return false;
}
}
</script>
<%@page import="java.sql.*,java.lang.*,dbconnection.*"%>
<% 

try{
	
	Connection con=DBConnection.dBCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from sub");%>
	<form name="s" action="addmet1.jsp" method="post" onsubmit="return validation();" enctype="multipart/form-data">
	Select Subject <select name=sub>
	<% while(rs.next())
	{%>
	<option><%=rs.getString(2)%></option>
	<%} %>
	</select><br><br>
	Select Meterial <input type=file name=met><br><br>
	<input type=submit value="Add Meterial">
	</form>
	<%}catch(Exception e){System.out.println(e);}
	%>
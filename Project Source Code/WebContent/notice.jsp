<%@ include file="ihead.jsp" %>
<div style="position:absolute; top:250px; left:630px">
<script>
function validation()
{
var a=document.s.note.value;
if(a=="")
{
alert("Write The Note");
document.s.note.focus();
return false;
}
}
</script>
<%@page import="java.sql.*,java.lang.*,dbconnection.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<% 

try{
	
    DateFormat df = new SimpleDateFormat("dd/MM/yy");
    Date d = new Date();
    String a = df.format(d);

	
	Connection con=DBConnection.dBCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from sub");%>
	<form name="s" action="notice1.jsp" onsubmit="return validation();">
	Select Subject <select name=sub>
	<% while(rs.next())
	{%>
	<option><%=rs.getString(2)%></option>
	<%} %>
	</select><br><br>
	Notice <textarea name=note></textarea><br><br>
	Date <input type=text name=datee value="<%=a%>" readonly><br><br>
	<input type=submit value="Add Notice">
	</form>
	
	<% }catch(Exception e){System.out.println(e);}
	%>
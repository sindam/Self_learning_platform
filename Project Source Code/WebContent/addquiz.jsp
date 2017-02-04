<%@ include file="ihead.jsp" %>
<div style="position:absolute; top:250px; left:630px">
<script>
function validation()
{
var a=document.s.qname.value;
if(a=="")
{
alert("Enter Quiz Name");
document.s.qname.focus();
return false;
}
var b=document.s.que.value;
if(b=="")
{
alert("Number Of Questions");
document.s.que.focus();
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
	<form name="s" action="addquiz1.jsp" method="post" onsubmit="return validation();">
	Select Subject <select name=sub>
	<% while(rs.next())
	{%>
	<option><%=rs.getString(2)%></option>
	<%} %>
	</select><br><br>
	Quiz Name <input type=text name=qname><br><br>
	Quiz Type<select name=qtype>
	<option>Easy</option>
	<option>Medium</option>
	<option>Hard</option>
	</select><br><br>
     Number Of Questions <input type=text name=que size=6><br><br>
     <input type=submit value="Proceed">
     </form>
	<%}catch(Exception e){System.out.println(e);}
	%>
<%@ include file="shead.jsp" %>
<div style="position:absolute; top:250px; left:600px">
<script>
function myFunction() {
var a=document.getElementById("anjum").value;
var b=document.getElementById("chandana").value;
var c=document.getElementById("rus").value;
window.open("squize1.jsp?sub="+b+"&qname="+c+"&qtype="+a,"_self");
}
</script>
<%@page import="java.sql.*,java.lang.*,dbconnection.*"%>
<% 
  String sub=request.getParameter("sub");
String qname=request.getParameter("qname");
try{
	Connection con=DBConnection.dBCon();
	Statement st=con.createStatement();
	ResultSet rs2=st.executeQuery("select qtype from quiz where sub='"+sub+"' and qname='"+qname+"'");%>
	<input type=hidden value="<%=sub%>" id="chandana">
	<input type=hidden value="<%=qname%>" id="rus">
	Select Quiz <select name=qname onChange="myFunction()" id="anjum">
	<option>select</option>
	<% while(rs2.next())
	{%>
	<option value="<%=rs2.getString(1)%>"><%=rs2.getString(1)%></option>
	<%} %>
	</select><br><br>
   <%}catch(Exception e){System.out.println(e);}
	%>
	

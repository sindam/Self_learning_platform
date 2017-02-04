<%@ include file="shead.jsp" %>
<div style="position:absolute; top:250px; left:600px">
<script>
function validation()
{
var a=document.s.com.value;
if(a=="")
{
alert("Enter Comment");
document.s.com.focus();
return false;
}
}
</script>
<%@page import="java.sql.*,java.lang.*,dbconnection.*"%>
<% 
int did=Integer.parseInt(request.getParameter("did"));
String sid=request.getParameter("sid");
String dname=request.getParameter("dname");
String sid2=(String)session.getAttribute("sid");
%>
<form action=viewdis2.jsp onsubmit="return validation();" name="s">
<h3>Posted By :<%=sid%></h3>
<h2><%=dname%></h2>
<input type=hidden name=did value="<%=did%>">
<input type=hidden name=sid value="<%=sid%>">
<input type=hidden name=dname value="<%=dname%>">
<textarea name=com></textarea>
<input type=submit value="POST COMMENT">
</form>
<%@ include file="shead.jsp" %>
<div style="position:absolute; top:250px; left:600px">
<%@page import="java.sql.*,java.lang.*,dbconnection.*"%>
<%Statement st=null; %>
<% 
int qid2=Integer.parseInt(request.getParameter("qid2"));
int qid=Integer.parseInt(request.getParameter("qid"));
int que=Integer.parseInt(request.getParameter("que"));
int eid2=Integer.parseInt(request.getParameter("eid2"));
int eid=Integer.parseInt(request.getParameter("eid"));
String sid=(String)session.getAttribute("sid");
int qnum=0,sc=0;
String a=null,b=null,url=null,status=null;
try{
Connection con=DBConnection.dBCon();
st=con.createStatement();
ResultSet rs=st.executeQuery("select count(qnum) from exam where sid='"+sid+"' and eid2='"+eid2+"' and opt!='null'");
while(rs.next())
{
	qnum=rs.getInt(1);
}
ResultSet rs2=st.executeQuery("select * from exam where sid='"+sid+"' and eid2='"+eid2+"'");
while(rs2.next())
{   
	if(rs2.getString(8).compareToIgnoreCase(rs2.getString(9))==0)
	{  
		sc++;
	}
}
url="result1.jsp?qid="+qid+"&qid2="+qid2+"&que="+que+"&eid="+eid+"&sid="+sid+"&eid2="+eid2;

%>
<h2>Total Number of Questions : <%=que%></h2>
<h2>Number of Questions Answered  : <%=qnum%></h2>
<h2>Score : <%=sc%></h2>
<% 
ResultSet rs3=st.executeQuery("select * from exam where sid='"+sid+"' and eid2='"+eid2+"'");
System.out.println("select * from exam where sid='"+sid+"' and eid2='"+eid2+"'");
%>
<table border=1><tr><th>Question Number</th><th>Question</th><th>Answer</th><th>Your Answer</th><th>Status</th></tr>
<%while(rs3.next())
{
 if(rs3.getString(8).compareToIgnoreCase(rs3.getString(9))==0)
	{  
		status="Correct";
		
	}
	else
	{
		status="Wrong";
	}%>
<tr><td><%=rs3.getInt(6)%></td><td><%=rs3.getString(7)%></td><td><%=rs3.getString(8)%></td><td><%=rs3.getString(9)%></td><td><%if(status=="Correct"){%><font color=green><% }else{%><font color=red><%}%><%=status%></font></td></tr>
<% }%>
</table>
<%}catch(Exception e){System.out.println(e);}
%>
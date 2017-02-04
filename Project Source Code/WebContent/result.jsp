<%@ include file="shead.jsp" %>
<div style="position:absolute; top:250px; left:600px">
<%@page import="java.sql.*,java.lang.*,dbconnection.*"%>
<% 
int qid2=Integer.parseInt(request.getParameter("qid2"));
int qid=Integer.parseInt(request.getParameter("qid"));
int que=Integer.parseInt(request.getParameter("que"));
int eid2=Integer.parseInt(request.getParameter("eid2"));
int eid=Integer.parseInt(request.getParameter("eid"));
String sid=(String)session.getAttribute("sid");
int qnum=0,sc=0;
String a=null,b=null,url=null;
try{
Connection con=DBConnection.dBCon();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select count(qnum) from exam where sid='"+sid+"' and eid2='"+eid2+"' and opt!='null'");
System.out.println("select max(qnum) from exam where sid='"+sid+"' and eid2='"+eid2+"' and opt!=null");
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
}catch(Exception e){System.out.println(e);}
%>
<h2>Total Number of Questions : <%=que%></h2>
<h2>Number of Questions Answered  : <%=qnum%></h2>
<h2>Score : <%=sc%></h2>
<a href="<%=url%>">Details</a>
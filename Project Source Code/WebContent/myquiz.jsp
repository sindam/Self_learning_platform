<%@ include file="shead.jsp" %>
<div style="position:absolute; top:250px; left:600px">
<%@page import="java.sql.*,java.lang.*,dbconnection.*"%>
<% 
int qid2=Integer.parseInt(request.getParameter("qid2"));
int qid=Integer.parseInt(request.getParameter("qid"));
int qnum=Integer.parseInt(request.getParameter("qnum"));
int que=Integer.parseInt(request.getParameter("que"));
int eid2=Integer.parseInt(request.getParameter("eid2"));
String sid=(String)session.getAttribute("sid");
String url=null,pic=null;ResultSet rs4=null,rs5=null,rs6=null;int qid22=0,eid=0;
try{
	
	Connection con=DBConnection.dBCon();
	Statement st=con.createStatement();
	
if(que<qnum)
{  
	rs4=st.executeQuery("select * from questions where qid='"+qid+"' and qnum=1");
	while(rs4.next()){
	qid22=rs4.getInt(1);
	}
	rs5=st.executeQuery("select eid from exam where qid='"+qid+"' and qid2='"+qid22+"' and sid='"+sid+"' and qnum=1");
	System.out.println("select eid from exam where qid='"+qid+"' and eid2='"+eid2+"' and qid2='"+qid22+"' and sid='"+sid+"' and qnum=1");
	while(rs5.next())
	{
		eid=rs5.getInt(1);
		
	}
	url="result.jsp?qid="+qid+"&qid2="+qid22+"&que="+que+"&eid="+eid+"&sid="+sid+"&eid2="+eid2;
	System.out.println(url);
	response.sendRedirect(url);
}else
{
	
		ResultSet rs2=st.executeQuery("select * from questions where qid2='"+qid2+"' and qid='"+qid+"' and qnum='"+qnum+"'");
		
		while(rs2.next())
		{
%>    Qustion <%=rs2.getString(3)%> of <%=que%>
	<form action=myquiz1.jsp>
	<input type=hidden name=qid value="<%=qid%>">
	<input type=hidden name=eid2 value="<%=eid2%>">
	<input type=hidden name=qid2 value="<%=qid2%>">
	<input type=hidden name=qnum value="<%=qnum%>">
	<input type=hidden name=que value="<%=que%>">
	<input type=hidden name=question value=<%=rs2.getString(4)%>>
	<input type=hidden name=ans value=<%=rs2.getString(9)%>>
	<% if(rs2.getString(10)!=null)
	{   pic="Questions\\"+rs2.getString(10);%> 
	<img src="<%=pic%>" alt="No Image" width=200 height="300"><br>
	<%} %>
	<h2><%=rs2.getString(3)%>&nbsp&nbsp<%=rs2.getString(4)%></h2><br>
    <h3><input type=radio name=opt value=<%=rs2.getString(5)%>><%=rs2.getString(5)%></h3>
	<h3><input type=radio name=opt value=<%=rs2.getString(6)%>> <%=rs2.getString(6)%></h3>
	<h3><input type=radio name=opt value=<%=rs2.getString(7)%>> <%=rs2.getString(7)%></h3>
	<h3><input type=radio name=opt value=<%=rs2.getString(8)%>> <%=rs2.getString(8)%></h3><br><br>
	<input type=submit <%if((que)==qnum){%>value="Submit" <%}else{ %> value="Next" <%} %>>
	</form>
	<%if(que>qnum){
	url="result.jsp?qid="+qid+"&qid2="+qid2+"&que="+que+"&eid="+eid+"&sid="+sid+"&eid2="+eid2;
	%>
	<a href="<%=url%>"><input type=button value="Exit"></a>
	
<%}}}}catch(Exception e){System.out.println(e);}
%>
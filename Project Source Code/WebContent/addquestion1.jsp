<%@page import="java.sql.*,java.lang.*,dbconnection.*"%>
<% 
int qid=Integer.parseInt(request.getParameter("qid"));
int que=Integer.parseInt(request.getParameter("que"));
int qnum=Integer.parseInt(request.getParameter("qnum"));

String question=request.getParameter("question");
String opt1=request.getParameter("opt1");
String opt2=request.getParameter("opt2");
String opt3=request.getParameter("opt3");
String opt4=request.getParameter("opt4");
String ans=request.getParameter("ans");
try{
	
	Connection con=DBConnection.dBCon();
	Statement st=con.createStatement();
	st.executeUpdate("insert into questions(qid,qnum,question,opt1,opt2,opt3,opt4,ans) values('"+qid+"','"+qnum+"','"+question+"','"+opt1+"','"+opt2+"','"+opt3+"','"+opt4+"','"+ans+"')");
	String url="addquestion.jsp?qid="+qid+"&que="+que+"&qnum="+(qnum+1);
		response.sendRedirect(url);
}catch(Exception e){System.out.println(e);}
%>
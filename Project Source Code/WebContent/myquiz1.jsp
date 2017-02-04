<%@page import="java.sql.*,java.lang.*,dbconnection.*"%>
<% 
int qid=Integer.parseInt(request.getParameter("qid"));
int eid2=Integer.parseInt(request.getParameter("eid2"));
int qid2=Integer.parseInt(request.getParameter("qid2"));
int qnum=Integer.parseInt(request.getParameter("qnum"));
int que=Integer.parseInt(request.getParameter("que"));
String question=request.getParameter("question");
String ans=request.getParameter("ans");
String opt=request.getParameter("opt");
String sid=(String)session.getAttribute("sid");
String url=null;
try{
Connection con=DBConnection.dBCon();
Statement st=con.createStatement();
st.executeUpdate("insert into exam(eid2,sid,qid2,qid,qnum,question,ans,opt) values('"+eid2+"','"+sid+"','"+qid2+"','"+qid+"','"+qnum+"','"+question+"','"+ans+"','"+opt+"')");
url="myquiz.jsp?qid="+qid+"&qid2="+(qid2+1)+"&que="+que+"&qnum="+(qnum+1)+"&eid2="+eid2;
response.sendRedirect(url);
}catch(Exception e){System.out.println(e);}
%>
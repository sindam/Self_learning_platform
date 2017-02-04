<%@page import="java.sql.*,java.lang.*,dbconnection.*"%>
<% 
int a=0,qid=0,mqnum=0,que=0,eid2=0;ResultSet rs4=null;
String url=null;
String sub=request.getParameter("sub");
String qname=request.getParameter("qname");
String qtype=request.getParameter("qtype");
String sid=(String)session.getAttribute("sid");
ResultSet rs6=null;
System.out.println(sub+" "+qname+" "+qtype+"  "+sid);
try{

	Connection con=DBConnection.dBCon();
	Statement st=con.createStatement();
	System.out.println("select qid,que from quiz where qname='"+qname+"' and sub='"+sub+"' and qtype='"+qtype+"'");
	ResultSet rs2=st.executeQuery("select qid,que from quiz where qname='"+qname+"' and sub='"+sub+"' and qtype='"+qtype+"'");
	
	while(rs2.next())
	{
	qid=rs2.getInt(1);
	que=rs2.getInt(2);
	}
	System.out.println("select max(qnum) from questions where qid='"+qid+"'");
	ResultSet rs3=st.executeQuery("select max(qnum) from questions where qid='"+qid+"'");
	
	while(rs3.next())
	{ System.out.println("hai");
		mqnum=rs3.getInt(1);
	}
	if(que==mqnum)
	{  System.out.println("select * from questions where qid='"+qid+"' and qnum=1");
	rs6=st.executeQuery("select max(eid2) from exam");
	while(rs6.next())
	{
		eid2=rs6.getInt(1);
	}
		rs4=st.executeQuery("select * from questions where qid='"+qid+"' and qnum=1");
		while(rs4.next()){
		System.out.println("after rs");
		url="myquiz.jsp?qid="+qid+"&qid2="+rs4.getInt(1)+"&que="+que+"&qnum=1&eid2="+(eid2+1);
		System.out.println(url);
		response.sendRedirect(url);}
	}else
	{
		out.println("Question Paper not Uploaded Completly ");
	}
	
	}catch(Exception e){System.out.println(e);}
%>
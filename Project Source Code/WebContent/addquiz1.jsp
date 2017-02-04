<%@page import="java.sql.*,java.lang.*,dbconnection.*"%>
<% 
int a=0,qid=0,mqnum=0;
String url=null;
String sub=request.getParameter("sub");
String qname=request.getParameter("qname");
String qtype=request.getParameter("qtype");
int que=Integer.parseInt(request.getParameter("que"));
int  que2=1000;
String iname=(String)session.getAttribute("iname");
System.out.println(sub+" "+qname+" "+qtype+"  "+que+"  "+iname);
try{
	
	Connection con=DBConnection.dBCon();
	Statement st=con.createStatement();
	
	ResultSet rs2=st.executeQuery("select qid,que from quiz where iname='"+iname+"' and sub='"+sub+"' and qtype='"+qtype+"' and qname='"+qname+"'");
	
	while(rs2.next())
	{
	qid=rs2.getInt(1);
	que2=rs2.getInt(2);
	
	}
	if(que2<que)
	{
		response.sendRedirect("instructorhome.jsp?message=you can not add more question");
	}
	ResultSet rs3=st.executeQuery("select max(qnum) from questions where qid='"+qid+"'");
	System.out.println("select max(qnum) from questions where qid='"+qid+"'");
	while(rs3.next())
	{
		mqnum=rs3.getInt(1);
	}
	
	ResultSet rs4=st.executeQuery("select qid from quiz where iname='"+iname+"' and sub='"+sub+"' and qtype='"+qtype+"' and qname='"+qname+"'");
	System.out.println("select qid from quiz where iname='"+iname+"' and sub='"+sub+"' and qtype='"+qtype+"'and qname='"+qname+"'");
	if(rs4.next())
	{  
		if(que==mqnum)
		{
			url="addquiz.jsp?message=Questions Already Added";
			response.sendRedirect(url);
		}else
		{
			url="addquestion.jsp?qid="+qid+"&que="+que+"&qnum="+(mqnum+1);
			response.sendRedirect(url);
		}
	}
	else
	{
	a=st.executeUpdate("insert into quiz(iname,sub,qname,qtype,que) values('"+iname+"','"+sub+"','"+qname+"','"+qtype+"','"+que+"');");
	ResultSet rs=st.executeQuery("select max(qid) from quiz where iname='"+iname+"' and sub='"+sub+"' and qtype='"+qtype+"'and qname='"+qname+"'");
	while(rs.next())
	{
		
		qid=rs.getInt(1);
	}
	if(a!=0)
	{     url="addquestion.jsp?qid="+qid+"&que="+que+"&qnum=1";
		response.sendRedirect(url);
	}else
	{
		response.sendRedirect("addsub.jsp?message=Fail");
	}
	}
	}catch(Exception e){System.out.println(e);}
%>
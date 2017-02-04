<%@ include file="shead.jsp" %>
<div style="position:absolute; top:200px; left:500px">
<%@page import="java.sql.*,java.lang.*,dbconnection.*"%>
<%!int qid2[]=new int[200]; %>
<%!ResultSet rs2=null,rs3=null; %>
<% 
String sid=(String)session.getAttribute("sid");
System.out.println(sid);
String url=null;
int a=0,b=0,i=0,qid=0,eid=0;
try{
	
	Connection con=DBConnection.dBCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from exam where sid='"+sid+"'");

	while(rs.next())
	{   System.out.println(sid);
		a=rs.getInt(2);
		
		if(a!=b)
		{   
			qid2[i]=rs.getInt(2);
			System.out.println(rs.getInt(2));
			i++;
		}
		b=rs.getInt(2);
	}
	x: for(i=0;i<qid2.length;i++)
	{
	
	if(qid2[i]==0)
	{
		break x;
	}
	System.out.println(qid2[i]+"hiii");
	 System.out.println("select * from exam where sid='"+sid+"' and eid2='"+qid2[i]+"'");
	rs2=st.executeQuery("select * from exam where sid='"+sid+"' and eid2='"+qid2[i]+"'");
	if(rs2.next())
	{System.out.println("start");
	    eid=rs2.getInt(4);
	    qid=rs2.getInt(5);
	    st=con.createStatement();
	    System.out.println("select * from quiz where qid='"+qid+"'");
	    rs3=st.executeQuery("select * from quiz where qid='"+qid+"'");
	    while(rs3.next()){
	        url="result1.jsp?qid="+rs3.getString(1)+"&qid2="+qid2[i]+"&que="+rs3.getString(6)+"&sid="+sid+"&eid2="+qid2[i]+"&eid=0"; %>
	   
	    	<%=rs3.getString(2)%>-->><%=rs3.getString(3)%>-->><%=rs3.getString(4)%>-->><%=rs3.getString(5)%>-->><%=qid2[i]%>&nbsp&nbsp&nbsp<a href="<%=url%>">Result</a><br><br>
	   <% }
	    System.out.println("hai2");
	}
	 System.out.println("hai3");
	}
	 System.out.println("hai4");
}catch(Exception e){System.out.println(e.getMessage());}
%>
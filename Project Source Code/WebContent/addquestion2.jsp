<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,dbconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>



<html>
<head>
</head>
<body>
<%
int qid=0,que=0,qnum=0;
String question=null,opt1=null,opt2=null,opt3=null,opt4=null,ans=null,file=null,url=null;
ArrayList list = new ArrayList();
		ServletContext context = getServletContext();

		String dirName =context.getRealPath("\\Questions");
		String paramname=null;
		
		
		String sts = "Hai Everybody";
		String z2 = (String) session.getAttribute("z1");
		String pic=null;
		Connection con=null;		
		
        
		
		  
	 
	 	
 
		File file1 = null;
			
		
		try {
			
			MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024); // 10MB

			Enumeration params = multi.getParameterNames();
			while (params.hasMoreElements()) 
			{
				paramname = (String) params.nextElement();
				if(paramname.equalsIgnoreCase("qid"))
				{
					qid=Integer.parseInt(multi.getParameter(paramname));
					
					
				}
				if(paramname.equalsIgnoreCase("que"))
				{
					que=Integer.parseInt(multi.getParameter(paramname));
					
				}
				if(paramname.equalsIgnoreCase("qnum"))
				{
					qnum=Integer.parseInt(multi.getParameter(paramname));
				}
				if(paramname.equalsIgnoreCase("question"))
				{
					question=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("opt1"))
				{
					opt1=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("opt2"))
				{
					opt2=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("opt3"))
				{
					opt3=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("opt4"))
				{
					opt4=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("ans"))
				{
					ans=multi.getParameter(paramname);
					System.out.println("ans is  "+ans);
				}
				if(paramname.equalsIgnoreCase("file"))
				{
					pic=multi.getFilesystemName(paramname);
					System.out.println(pic);
				}
				}
			System.out.println(pic==null);
			int p = 0;
	Enumeration files = multi.getFileNames();	
	System.out.println(pic);
	while (files.hasMoreElements()) 
	{
		paramname = (String) files.nextElement();
		if(paramname.equals("d1"))
		{
			paramname = null;
		}
		
		if(paramname != null)
		{    System.out.println(paramname);
			
			pic = multi.getFilesystemName(paramname);
			if(pic!=null)
			{p = 9;
			String fPath = context.getRealPath("\\Questions\\"+pic);
			file1 = new File(fPath);
			FileInputStream fs = new FileInputStream(file1);
			list.add(fs);
			}
		}		
	}
	        FileInputStream fs1 = null;
            //name=dirName+"\\Gallery\\"+image;
						
			
			con=DBConnection.dBCon();

			PreparedStatement ps=con.prepareStatement("INSERT INTO questions(qid,qnum,question,opt1,opt2,opt3,opt4,ans,file,pic) values(?,?,?,?,?,?,?,?,?,?)");
				
               	ps.setInt(1,qid);
				ps.setInt(2,qnum);	
       			ps.setString(3,question);
       			ps.setString(4,opt1);
			    ps.setString(5,opt2);
			    ps.setString(6,opt3);
				ps.setString(7,opt4);
				ps.setString(8,ans);
				ps.setString(9,pic);
				
		 if(p == 0)
			ps.setObject(10,null);
		else if(p == 9)
		{
			fs1 = (FileInputStream)list.get(0);
			ps.setBinaryStream(10,fs1,fs1.available());
		}	 
			int x=ps.executeUpdate();
		
			if(x!=0)
			{
				url="addquestion.jsp?qid="+qid+"&que="+que+"&qnum="+(qnum+1);
				response.sendRedirect(url);

			}
			else
			{
				response.sendRedirect("register.jsp?message=fail");
			}
				
		} 
		catch (Exception ex) 
		{
			out.println(ex.getMessage());
		}
	
 %>
</body>
</html>
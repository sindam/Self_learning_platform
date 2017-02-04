
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,dbconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>



<html>
<head>
</head>
<body>
<%

ArrayList list = new ArrayList();
		ServletContext context = getServletContext();

		String dirName =context.getRealPath("\\Gallery");
		String paramname=null;
		String file=null;
		
		String sts = "Hai Everybody";
		String z2 = (String) session.getAttribute("z1");
		String sname=null,sid=null,dept=null,email=null,dob=null,uname=null,pass=null,pic=null;
		Connection con=null;		
		
        
		
		  
	 
	 	
 
		File file1 = null;
			
		
		try {
			
			MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024); // 10MB

			Enumeration params = multi.getParameterNames();
			while (params.hasMoreElements()) 
			{
				paramname = (String) params.nextElement();
				if(paramname.equalsIgnoreCase("sname"))
				{
					sname=multi.getParameter(paramname);
					System.out.println(sname);
					
				}
				if(paramname.equalsIgnoreCase("sid"))
				{
					sid=multi.getParameter(paramname);
					
				}
				if(paramname.equalsIgnoreCase("dept"))
				{
					dept=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("email"))
				{
					email=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("dob"))
				{
					dob=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("uname"))
				{
					uname=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("pass"))
				{
					pass=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("pic"))
				{
					pic=multi.getParameter(paramname);
				}
				
				
				}
					
			int p = 0;
	Enumeration files = multi.getFileNames();	
	while (files.hasMoreElements()) 
	{
		paramname = (String) files.nextElement();
		if(paramname.equals("d1"))
		{
			paramname = null;
		}
		
		if(paramname != null)
		{
			p = 9;
			pic = multi.getFilesystemName(paramname);
			String fPath = context.getRealPath("\\Gallery\\"+pic);
			file1 = new File(fPath);
			FileInputStream fs = new FileInputStream(file1);
			list.add(fs);
		}		
	}
	        FileInputStream fs1 = null;
            //name=dirName+"\\Gallery\\"+image;
						
			
			con=DBConnection.dBCon();

			PreparedStatement ps=con.prepareStatement("INSERT INTO student VALUES(?,?,?,?,?,?,?,?,?)");
				
               	ps.setString(1,sname);
				ps.setString(2,sid);	
       			ps.setString(3,dept);
       			ps.setString(4,email);
			    ps.setString(5,dob);
			    ps.setString(6,uname);
				ps.setString(7,pass);
				
		 if(p == 0)
			ps.setObject(9,null);
		else if(p == 9)
		{
			fs1 = (FileInputStream)list.get(0);
			ps.setBinaryStream(8,fs1,fs1.available());
		}	  ps.setString(9,pic);
			int x=ps.executeUpdate();
		
			if(x!=0)
			{
				response.sendRedirect("register.jsp?message=success");

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
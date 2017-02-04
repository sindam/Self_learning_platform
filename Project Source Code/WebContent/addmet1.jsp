<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,dbconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>



<html>
<head>
</head>
<body>
<%
String iname=(String)session.getAttribute("iname");
ArrayList list = new ArrayList();
		ServletContext context = getServletContext();

		String dirName =context.getRealPath("\\Meterials");
		String paramname=null;
		String file=null;
		
		String sts = "Hai Everybody";
		String z2 = (String) session.getAttribute("z1");
		String sub=null,met=null;
		Connection con=null;		
		
        
		
		  
	 
	 	
 
		File file1 = null;
			
		
		try {
			
			MultipartRequest multi = new MultipartRequest(request, dirName,	103333 * 1033324 * 103333324); // 10MB

			Enumeration params = multi.getParameterNames();
			while (params.hasMoreElements()) 
			{
				paramname = (String) params.nextElement();
				if(paramname.equalsIgnoreCase("sub"))
				{
					sub=multi.getParameter(paramname);
					
					
				}
				if(paramname.equalsIgnoreCase("met"))
				{
					met=multi.getParameter(paramname);
					
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
			met = multi.getFilesystemName(paramname);
			String fPath = context.getRealPath("\\Meterials\\"+met);
			file1 = new File(fPath);
			FileInputStream fs = new FileInputStream(file1);
			list.add(fs);
		}		
	}
	        FileInputStream fs1 = null;
            //name=dirName+"\\Meterials\\"+image;
						
			
			con=DBConnection.dBCon();

			PreparedStatement ps=con.prepareStatement("INSERT INTO meterial VALUES(?,?,?)");
			ps.setString(1,iname);
               	ps.setString(2,sub);
				ps.setString(3,met);	
       			
		
			int x=ps.executeUpdate();
		
			if(x!=0)
			{
				response.sendRedirect("addmet.jsp?message=Meterial Uploaded Successfully");

			}
			else
			{
				response.sendRedirect("addmet.jsp?message=Fails To Upload");
			}
				
		} 
		catch (Exception ex) 
		{
			out.println(ex.getMessage());
		}
	
 %>
</body>
</html>
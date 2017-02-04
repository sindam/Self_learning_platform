package dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection 
{
 static	Connection con;
	public static Connection dBCon()
	{  
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Study","root","root");
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return con;
	}
}

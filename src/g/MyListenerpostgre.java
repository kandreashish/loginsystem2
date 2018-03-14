package g;
import javax.servlet.*;
import java.sql.*;

public class MyListenerpostgre implements ServletContextListener{

	public void contextInitialized(ServletContextEvent arg0) {
		boolean status=false;
		Connection con=null;
		PreparedStatement ps1=null;

		try{
			con=GetCon.getCon();
			ps1=con.prepareStatement("Select * from login");

			try{
				System.out.println(status);
				status=ps1.execute();
			}

			catch(Exception e)
			{System.out.println(e);
			status=false;
			System.out.println("your table status is "+status);
			}		

			if(status==true)
			{System.out.println("your table already exist "+status);}


			else if(status==false) 
			{
				System.out.println("table does not exist so new table has been created ");
				String s = "create table login(id int,uname VARCHAR,password varchar,date varchar,mnumber varchar,photos varchar,active int);";
				PreparedStatement ps=con.prepareStatement(s);
				ps.executeUpdate();

			}
			else{System.out.println("unknown "+status);
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
			}
	}
	
	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("project is undeployed");

	}
}

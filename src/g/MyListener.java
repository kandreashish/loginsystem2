package g;
import javax.servlet.*;
import java.sql.*;

public class MyListener implements ServletContextListener{

	public void contextInitialized(ServletContextEvent arg0) {
		int status=0;
		Connection con=null;
	
      try{
		con=GetCon.getCon();
		PreparedStatement ps1=con.prepareStatement("Select * from NEWACCOUNT");
	
      try{
		status=ps1.executeUpdate();
		}

      catch(Exception e)
		{e.printStackTrace();
		 status=2;
		 System.out.println("my staus is "+status);
		 }		
		
       if(status==0)
		{System.out.println("your table name already exist"+status);}
		
         
       else if(status==2) 
		
        {System.out.println("else if part table does not exist new table has created"+status);
		//PreparedStatement ps3=con.prepareStatement("CREATE SEQUENCE javatpointnewaccount MINVALUE 1 MAXVALUE 999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE");
		//ps3.executeUpdate();
		
		PreparedStatement ps=con.prepareStatement("CREATE TABLE  NEWACCOUNT(ACCOUNTNO int(11) primary key,USERNAME VARCHAR(400),PASSWORD VARCHAR(400),REPASSWORD VARCHAR(400),AMOUNT int(50),ADDERESS VARCHAR(400),PHONE int(50))");
		ps.executeUpdate();
		
		}
		else{System.out.println("else part "+status);
		}
       }
	    catch(Exception e)
      {e.printStackTrace();}
	    }
	    public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("project undeployed");
		
	}
}

package g;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet("/Upload")
public class Upload extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ServletFileUpload sf=new ServletFileUpload(new DiskFileItemFactory());
		try
		{
		List<FileItem> list= sf.parseRequest(request);
		for(FileItem item:list)
		{
			item.write(new File("/Users/ashish/loginsystem1/WebContent/images/" + item.getName()));
		}
		System.out.println("uploaded");
        response.sendRedirect("Forgotpassword.jsp");
		}
		catch (Exception e) {
			System.out.println(e);
			response.sendError(1);
		}
	}

}

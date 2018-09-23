package servlet;

import java.io.*;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig
public class UpdateUser extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        PrintWriter out = res.getWriter();
        //FileInputStream photo =null;
        Connection con = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
            HttpSession session = req.getSession(true);
            res.setContentType("text/html");
            Long uid = Long.parseLong(req.getParameter("uid"));
            
            String uname = req.getParameter("uname");
            String ugender = req.getParameter("ugender");
            String udob1 = req.getParameter("udob");
            Date udob = Date.valueOf(udob1);
            String uemail = req.getParameter("uemail"); 
            Long umobile = Long.parseLong(req.getParameter("umobile"));
            
            ServletContext context = req.getServletContext();
            CustomerBean bean = new CustomerBean(uid,uname,uemail,umobile,udob,ugender);
                String result = CustomerDao.update(bean);
                if ("true".equals(result)) {
                    session.setAttribute("success", "Your Account is Updated...");
                    res.sendRedirect("CustomerProfile.jsp");
                   // RequestDispatcher rd = context.getRequestDispatcher("/CustomerProfile.jsp");
                    //rd.forward(req, res);
                }
                if ("false".equals(result)) {
                    
                    //res.sendRedirect("Registration.jsp");
                    RequestDispatcher rd = context.getRequestDispatcher("/Update.jsp");
                    rd.forward(req, res);
                }
                if ("error".equals(result)) {
                    
                    //res.sendRedirect("Contact.jsp");
                    req.setAttribute("success", "Your Account is Not Updated...");
                    RequestDispatcher rd = context.getRequestDispatcher("/CustomerProfile.jsp");
                    rd.forward(req, res);
                }
            
            out.close();
            con.setAutoCommit(false);
            
        } catch (Exception e) {
            out.println(e);
        }
    }
}

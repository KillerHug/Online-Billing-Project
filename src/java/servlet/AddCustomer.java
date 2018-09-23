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
public class AddCustomer extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        PrintWriter out = res.getWriter();
        //FileInputStream photo =null;
        Connection con = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
            HttpSession session = req.getSession(true);
            res.setContentType("text/html");
            String satural = req.getParameter("salution");
            String marital = req.getParameter("marital");
            String emp = req.getParameter("emp");
            String fname = req.getParameter("fname");
            String mname = req.getParameter("mname");
            String lname = req.getParameter("lname");
            String gender = req.getParameter("gender");
            String dob1 = req.getParameter("dob");
            Date dob = Date.valueOf(dob1);
            String national = req.getParameter("national");
            String email = req.getParameter("email");
            Long mobile = Long.parseLong(req.getParameter("mobile"));
            String address = req.getParameter("address");
            String city = req.getParameter("city");
            String state = req.getParameter("state");
            String country = req.getParameter("country");
            String userid = req.getParameter("userid");
            String password = req.getParameter("password");
            String name = satural + " " + fname + " " + mname + " " + lname;
            ServletContext context = req.getServletContext();
            CustomerBean bean = new CustomerBean(name, dob, gender, emp, marital, email, mobile, address, city, state, country, national, userid, password);
            PreparedStatement ps=con.prepareStatement("select * from customer where email=?  or userid=?");
            ps.setString(1,email);
            ps.setString(2, userid);
            ResultSet rs=ps.executeQuery();
            if(rs.next())
            {
                req.setAttribute("Reg_Error", "Email or UserId is already Existing.");
                RequestDispatcher rd = context.getRequestDispatcher("/Registration.jsp");
                    rd.include(req, res);
            }else
            {
                String result = CustomerDao.save(bean);
                if ("true".equals(result)) {
                    req.setAttribute("success", "Your Account is Created...");
                    RequestDispatcher rd = context.getRequestDispatcher("/CustomerLogIn.jsp");
                    rd.include(req, res);
                }
                if ("false".equals(result)) {
                    
                    //res.sendRedirect("Registration.jsp");
                    RequestDispatcher rd = context.getRequestDispatcher("/index.jsp");
                    rd.include(req, res);
                }
                if ("error".equals(result)) {
                    
                    //res.sendRedirect("Contact.jsp");
                    RequestDispatcher rd = context.getRequestDispatcher("/Registration.jsp");
                    rd.include(req, res);
                }
            }
            out.close();
            con.setAutoCommit(false);
            session.invalidate();
        } catch (Exception e) {
            out.println(e.getMessage());
        }
    }
}

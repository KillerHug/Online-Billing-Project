package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.DriverManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Forget extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        PrintWriter out = res.getWriter();
        //FileInputStream photo =null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
            res.setContentType("text/html");
            HttpSession session = req.getSession();
            String forUser = req.getParameter("forgetUser");
            String forEmail = req.getParameter("forgetEmail");
            PreparedStatement ps = con.prepareStatement("select * from customer where userid=? and email=?");
            ps.setString(1,forUser);
            ps.setString(2,forEmail);
            ResultSet rs = ps.executeQuery();
            ServletContext context = getServletContext();
            if (rs.next()) {
                String pass=rs.getString(14);
                System.out.println(pass);
                req.setAttribute("password",pass);
                RequestDispatcher rd = context.getRequestDispatcher("/CustomerLogIn.jsp");
                rd.include(req, res);
            } else {
                System.out.println("Error msg");
                req.setAttribute("msg", "---User-Id & Email ID not Matched---");
                //res.sendRedirect("Forget.jsp");
                RequestDispatcher rd = context.getRequestDispatcher("/Forget.jsp");
                rd.forward(req, res);
            }
        } catch (Exception e) {

        }
    }
}

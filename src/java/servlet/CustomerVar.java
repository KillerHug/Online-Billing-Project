package servlet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

public class CustomerVar extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        Boolean result = false;
        String userid, password = null;
        PrintWriter out = res.getWriter();
        try {
            res.setContentType("text/html");
            String user = req.getParameter("loginUser");
            String pass = req.getParameter("loginPass");
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
            PreparedStatement ps = con.prepareStatement("select * from customer where userid=? and password=?");
            ps.setString(1, user);
            ps.setString(2, pass);
            HttpSession session = req.getSession(true);
            ServletContext context = getServletContext();
            ResultSet rs = ps.executeQuery();
            //result=rs.next();
            if (rs.next()) {
                userid = rs.getString("userid");
                password = rs.getString("password");
                if (user.equals(userid) && pass.equals(password)) {
                    session.setAttribute("email", rs.getString(6));
                    session.setAttribute("userid", rs.getString(13));
                    res.sendRedirect("CustomerProfile.jsp");
                } 
            } else {
                req.setAttribute("error","Wrong User-Id & Password");
                RequestDispatcher rd = context.getRequestDispatcher("/CustomerLogIn.jsp");
                rd.include(req, res);
            }
            con.close();
        } catch (Exception e) {

        }
    }
}

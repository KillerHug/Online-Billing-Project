/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ABC
 */
public class ResetPassword extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        HttpSession session = req.getSession();
        String userid = (String) session.getAttribute("userid");
        String userpass = (String) session.getAttribute("pass");
        ServletContext context = getServletContext();
        try {
            
            String oldpass = req.getParameter("old");
            String newpass = req.getParameter("new");
            String repass = req.getParameter("re");
            System.out.println(oldpass + newpass + repass + userid + userpass);
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
            if (!newpass.equals(repass)) {
                req.setAttribute("msg1", "Password does not matched");
                RequestDispatcher rd = context.getRequestDispatcher("/Reset.jsp");
                rd.forward(req, res);
            } else if (!oldpass.equals(userpass)) {
                req.setAttribute("msg1", "Old password does not correct");
                RequestDispatcher rd = context.getRequestDispatcher("/Reset.jsp");
                rd.forward(req, res);
            } else {
                PreparedStatement ps = con.prepareStatement("update customer set password=? where userid=?");
                ps.setString(1, newpass);
                ps.setString(2, userid);
                int i = ps.executeUpdate();
                if (i != 0) {
                    req.setAttribute("msg1", "Password successfully updated.");
                    context.getRequestDispatcher("/Reset.jsp").forward(req, res);
                } else {
                    req.setAttribute("msg1", "Password not updated.");
                    context.getRequestDispatcher("/Reset.jsp").forward(req, res);
                }
            }
        } catch (Exception e) {
            out.println(e);
        }
        

    }

}

package servlet;

import java.io.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PaymentCustomer extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException {
        PrintWriter out = res.getWriter();
        try{
            
            SimpleDateFormat sdf = new SimpleDateFormat("mm-yyyy");
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system","oracle");
            HttpSession session = req.getSession(true);
            res.setContentType("text/html");
            String state = req.getParameter("state");
            String type=req.getParameter("type");
            Long consumer=Long.parseLong(req.getParameter("consumer"));
            String provider =req.getParameter("provider");
            Long mobile= Long.parseLong(req.getParameter("mobile"));
            Double payment=Double.valueOf(req.getParameter("payment"));
            String option= req.getParameter("option");
            Long cardno=Long.parseLong(req.getParameter("cardno"));
            String cardname=req.getParameter("cardname");
            String cardtype=req.getParameter("cardtype");
            String carddate = req.getParameter("expire");
            String email=(String)session.getAttribute("email");
            //String email=req.getParameter("email1");
            //Date carddate=Date.valueOf(date);
           Long cvv=Long.parseLong(req.getParameter("cvv"));
           Double paid=Double.valueOf(req.getParameter("paid"));
            PaymentBean bean=new PaymentBean(state,type,consumer,provider,email,mobile,payment,option,cardno,cardname,cardtype,carddate,cvv,paid);
           String result = CustomerDao.payment(bean);
            ServletContext context = req.getServletContext();
            //PreparedStatement ps = con.prepareStatement("insert into payment values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            
            if (result == "true") { 
                req.setAttribute("success","Your Bill is PAID");
                System.out.println(email);
                //res.sendRedirect("History.jsp");
                RequestDispatcher rd = context.getRequestDispatcher("/History.jsp");
                rd.include(req, res);
            }
            if (result == "false") {
                req.setAttribute("unsuccess","Your Bill is not PAID");
                RequestDispatcher rd = context.getRequestDispatcher("/CustomerProfile.jsp");
                rd.include(req, res);
            }
            
        }
        catch(Exception e)
        {
           out.println(e);
        }
    }
}

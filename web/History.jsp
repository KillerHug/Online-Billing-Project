<%@page import="servlet.*"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="java.sql.*" %>
<%@page session="true"%>
<%
    try {

        String id = (String) session.getAttribute("userid");
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
        PreparedStatement ps = con.prepareStatement("select * from customer where userid=?");
        ps.setString(1, id);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="https://www.w3schools.com/w3css/4/w3.css" />
        <!--<meta http-equiv="refresh" content="5">-->
        <meta name="Content-Style-Type" content="text/css">
        <link rel="icon" href="./images/icon.png"/>    
        <link rel="stylesheet" type="text/css" href="style.css" />
        <link rel="stylesheet" type="text/css" href="style4.css" />
        <title>Online Billing System</title>     
        <style>
            * {
                box-sizing: border-box;
            }
        </style>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>


    </head>
    <body text="black" bgcolor="green">   
        
        <div id="box">
            <div id="header1">
                <p align=left style="color:white">Welcome,&nbsp;<%= rs.getString("name")%></p>
                <% 
                    session.setAttribute("email",rs.getString("email"));
                        }
                            } catch (Exception e) {
                                out.println(e);
                            }
                        %>
                
                <%
            if (session.getAttribute("userid") == null) {
                response.sendRedirect("CustomerLogIn.jsp");
            }
        %>
            <p align=right><font size='1' face="cambria" color="white">Home || About Us || Contact Us || Register || LogIn</font></p>           
            </div>
            <div class="title">
                <font size="+3" style="font-family:cambria; color: white">Online Payment Billing System</font><br>      
                <font size="2"style="font-family:cambria;color: white">Pay for Electricity, Telephone, Water And LPG Gas Bills Online</font>
            </div>
            <div class="container"> 
                <a href="CustomerProfile.jsp" class="btn ">Home</a> 
                <a href="History.jsp" class="btn active">Billing History</a> 
                <a href="PayBill.jsp" class="btn ">Pay Bill</a>
                
                <a href="Reset.jsp" class="btn">Reset Password</a>
                <a href="Update.jsp">Update Information</a>
                <a href="Logout.jsp" id="link" style="float:right;" >Logout</a>
            </div> 
            <br>
            <div class="middle">
                <div id="area2">
                    <%
                        String success = (String) request.getAttribute("success");
                        if (success != null) {
                    %>
                    <p style="color:red" align="center"><%= success%>
                    </p>
                    <%
                        } else {
                        }
                    %>
                    <p style="text-shadow: 5px 5px 10px black;"><font size="5" style="font-family:cambria; color: black">&nbsp;&nbsp;&nbsp;Bill Payment History</font></p>
                    <hr class="style21">
                    <%
                        ResultSet rs = null;
                        try {
                            response.setContentType("text/html");
                            Class.forName("oracle.jdbc.driver.OracleDriver");
                            String email = (String)session.getAttribute("email");
                            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
                            PreparedStatement ps = con.prepareStatement("select * from payment where email=?");
                            ps.setString(1, email);
                            rs = ps.executeQuery();
                            ResultSetMetaData rsmd = rs.getMetaData();
                            int total = rsmd.getColumnCount();
                    %>
                    <table border='1' id='table_style' width="100%">
                        <tr bgcolor="#000000" style="color:white">
                            <th>
                                Bill Type
                            </th>
                            <th>
                                Reference No.
                            </th>
                            <th>
                                Consumer No.
                            </th>
                            <th>
                                Provider
                            </th>
                            <th>
                                Mode of Payment
                            </th>
                            <th>
                                Total Amount
                            </th>
                            <th>
                                Mobile
                            </th>
                            <th>
                                Action
                            </th>
                        </tr>
                        <%while (rs.next()) {%>
                        <%
                            session.setAttribute("consumer", rs.getLong("consumer"));
                            session.setAttribute("pay_email", rs.getString("email"));
                            session.setAttribute("pay_mobile", rs.getLong("mobile"));
                            session.setAttribute("payment", rs.getFloat("payment"));
                            session.setAttribute("provider", rs.getString("provider"));
                            session.setAttribute("type", rs.getString("type"));
                            session.setAttribute("option", rs.getString("pay_option"));
                            session.setAttribute("reference", rs.getString("reference"));
                        %>
                        <tr align="center">
                            <td align="center">
                                <%= rs.getString("type")%>
                            </td>
                            <td align="center">
                                <%= rs.getLong("reference")%>
                            </td>
                            <td align="center">
                                <%= rs.getLong("consumer")%>
                            </td>
                            <td align="center">
                                <%= rs.getString("provider")%>
                            </td>
                            <td align="center">
                                <%= rs.getString("pay_option")%>
                            </td>
                            <td align="center">
                                <%= rs.getFloat("payment")%>
                            </td>
                            <td align="center">
                                <%= rs.getLong("mobile")%>
                            </td>
                            <td align="center">
                                <a href="PaymentReceipt.jsp" style="color:red">Details</a>
                            </td>                          
                        </tr>                                         
                        <%}
                            } catch (Exception e) {
                                out.println(e);
                            }
                        %>
                    </table>
                </div>
                <br>
            </div>
        </div>
    </body>
</html>

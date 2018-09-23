<%@page import="servlet.*"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="java.sql.*" %>
<%
                    if (session.getAttribute("userid") == null) {
                        response.sendRedirect("CustomerLogIn.jsp");
                    }
                %>
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
        <link rel="stylesheet" type="text/css" href="style5.css" />
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>Online Billing System</title>     
    </head>
    <body text="black" bgcolor="green">    
        <div id="box">
            <div id="header1">
                <p align=left style="color:white">Welcome,&nbsp;<%= rs.getString("name")%></p>

                <!-- ------------------------------------------------------------ -->
                
                <p align=right><font size='1' face="cambria" color="white">Home || About Us || Contact Us || Register || LogIn</font></p>             
            </div>
            <div class="title">
                <font size="+3" style="font-family:cambria; color: white">Online Payment Billing System</font><br>
                <font size="2"style="font-family:cambria;color: white">Pay for Electricity, Telephone, Water And LPG Gas Bills Online</font>
            </div>
            <div class="container"> 
                <a href="CustomerProfile.jsp" class="btn">Home</a> 
                <a href="History.jsp" class="btn">Billing History</a> 
                <a href="PayBill.jsp" class="btn">Pay Bill</a>
                
                <a href="Reset.jsp" class="btn">Reset Password</a>
                <a href="Update.jsp" class="btn active">Update Information</a>
                <a href="Logout.jsp" id="link" style="float:right;" >Logout</a>
            </div> 
            <br>
            <div class="updateForm">
                <br>
                <font size="5px" style="font-family:cambria; color: black;">&nbsp;Update Information</font>
                <hr class="style18" width="75%" align="left">   
                <br>
                <form action="updateUser" method="post" name="updateUser" enctype='multipart/form-data'>
                    <%
                        String msg = (String) request.getAttribute("Reg_Error");
                        if (msg != null) {
                    %>
                    <p style="color:red"><%= msg%>
                    </p>
                    <%
                        } else {
                        }
                    %>                    
                    <table frame="box" width="75%">     
                        <tr>
                            <td>
                                Personal Information
                            </td>

                        </tr>
                        <tr>
                            <td>
                                User ID:
                                <input type="text" name="uid" value="<%= rs.getLong("srno")%>" readonly="true">
                            </td>
                            <td>
                                Name:<br>
                                <input type="text" name="uname" placeholder="Enter Name" value="<%= rs.getString("name")%>">
                            </td>
                            <td>
                                Email<br>
                                <input type="email" name="uemail" placeholder="Enter Email Id" value="<%= rs.getString("email")%>">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Mobile No.<br>
                                <input type="text" name="umobile" placeholder="Enter Mobile No." value="<%= rs.getLong("mobile")%>" maxlength="10">
                            </td>

                            <td>
                                Gender
                                <br>
                                <select name="ugender" required>
                                    <option value="Female" >Female</option>
                                    <option value="Male" selected>Male</option>
                                </select>
                            </td>
                            <td>
                                Date of Birth<br>
                                <input type="date" name="udob" value="<%= rs.getDate("dob")%>">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <button class="button button2">Update</button> &nbsp;

                            </td>
                            <td> 
                                <input class="button button2" type="reset">
                            </td></tr>
                    </table>              
                </form>
                <%}
                    } catch (Exception e) {
                        out.println(e);
                    }
                %>
                <br>           
            </div>
        </div>
        <br>
    </body>
</html>

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
        <link rel="stylesheet" type="text/css" href="style3.css" />
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>Online Billing System</title>     
        <style>
            * {
                box-sizing: border-box;
            }
        </style>
        <style>
            table {
                border-collapse: collapse;
                border-spacing: 0;
                width: 100%;
            }

            #table_style {font-family:cambria;border-collapse: collapse;width: 100%; font-size: 17px;}
            #table_style td, #customers th {border: 1px solid #ddd; padding: 8px; size: 1px;}       
            #table_style tr:nth-child(even){background-color: whitesmoke;}
            #table_style tr:hover {background-color: #33ccff;}
            #table_style th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: black;
                color: white;
            </style>

        </head>
        <body text="black" bgcolor="green">    
            <div id="box">
                <div id="header1">
                    <p align=left style="color:white">Welcome,&nbsp;<%=rs.getString(1)%></p>
                        <p align=right><font size='1' face="cambria" color="white">Home || About Us || Contact Us || Register || LogIn</font></p>             
                    </div>
                    <div class="title">
                        <font size="+3" style="font-family:cambria; color: white">Online Payment Billing System</font><br>
                        <font size="2"style="font-family:cambria;color: white">Pay for Electricity, Telephone, Water And LPG Gas Bills Online</font>
                    </div>
                    <div class="container"> 
                        <a href="CustomerProfile.jsp" class="btn active">Home</a> 
                        <a href="History.jsp" class="btn">Billing History</a> 
                        <a href="PayBill.jsp" class="btn">Pay Bill</a>
                        
                        <a href="Reset.jsp" class="btn">Reset Password</a>
                        <a href="Update.jsp">Update Information</a>
                        <a href="Logout.jsp" id="link" style="float:right;" >Logout</a>
                </div> 
                <br>
                
                <div class="middle">
                    <div id="area1">
                        <p style="text-shadow: 5px 5px 10px black;"><font size="5" style="font-family:cambria; color: black">&nbsp;&nbsp;&nbsp;User Profile</font></p>
                            <hr class="style21">                   

                            <%
                                String unsuccess = (String) request.getAttribute("unsuccess");
                                if (unsuccess != null) {
                            %>
                            <p style="color:red;"align="center"><%= unsuccess%>
                        </p>
                        <%
                            } else {
                            }
                        %>
                        <%
                            String success = (String) session.getAttribute("success");
                            if (success != null) {
                        %>
                        <p style="color:red;"align="center"><%= success%>
                        </p>
                        <%
                            } else {
                            }
                        %>
                        <div class="tableArea"> 
                            <table width="100%" cellpadding="5px" id='table_style'>
                                <tr>
                                    <td width="30%">
                                        User ID
                                    </td>
                                    <td width="70%">
                                        <%=rs.getString("userid")%> 
                                    </td>
                                </tr>
                                <tr>
                                    <td width="30%">
                                        Account ID
                                    </td>
                                    <td width="70%">
                                        <%=rs.getLong("srno")%> 
                                    </td>
                                </tr>
                                <tr>
                                    <td width="30%">
                                        Name:
                                    </td>
                                    <td width="70%">
                                        <%=rs.getString("name")%> 
                                    </td>
                                </tr>
                                <tr>
                                    <td width="30%">
                                        Email:
                                    </td>
                                    <td width="70%">
                                        <%=rs.getString("email")%> 
                                        <% session.setAttribute("email", rs.getString("email"));%>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="30%">
                                        Date of Birth:
                                    </td>
                                    <td width="70%">
                                        
                                        <%=rs.getDate("dob")%> 
                                    </td>
                                </tr>
                                <tr>
                                    <td width="30%">
                                        Marital Status
                                    </td>
                                    <td width="70%">
                                        <%=rs.getString("marital")%> 
                                    </td>
                                </tr>
                                <tr>
                                    <td width="30%">
                                        Employee Status
                                    </td>
                                    <td width="70%">
                                        <%=rs.getString("emp")%> 
                                    </td>
                                </tr>
                                <tr>
                                    <td width="30%">
                                        Address:
                                    </td>
                                    <td width="70%">
                                        <%=rs.getString("address")%> &nbsp; <%=rs.getString("state")%> &nbsp; <%=rs.getString("country")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="30%">
                                        Mobile No:
                                    </td>
                                    <td width="70%">
                                        <lable>+91-</lable><%=rs.getLong("mobile")%>
                                    </td>
                                </tr>
                            </table>
                            <%
                                    }
                                } catch (Exception e) {
                                    out.print(e.getMessage());
                                }%>
                        </div>
                        <br>
                    </div>  
                </div>
            </div>
            <br>
        </body>
    </html>

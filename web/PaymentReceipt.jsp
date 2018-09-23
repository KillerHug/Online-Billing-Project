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

        <link rel="stylesheet" type="text/css" href="style.css" />
        <link rel="stylesheet" type="text/css" href="style4.css" />
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
                border: 1px solid black;
            }

            #table_style {font-family:Trebuchet MS, Arial, Helvetica, sans-serif;border-collapse: collapse;width: 60%;}
            #table_style td, #customers th {border: 1px solid black; padding: 8px; size: 1px;font-family: cambria;}       
            #table_style tr:nth-child(even){background-color: graytext;}
            #table_style tr:hover {background-color: #ddd;}
            #table_style th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: black;
                color: white;
            </style>
            <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
        </head>
        <body text="black" bgcolor="green">   
            
            <div id="box">
                <div id="header1">
                    <p align=left style="color:white">Welcome,&nbsp;<%= rs.getString("name")%></p>
                        <%
                                    session.setAttribute("email", rs.getString("email"));
                                }
                            } catch (Exception e) {
                                out.println(e);
                            }
                        %>
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
                        <a href="Update.jsp">Update Information</a>
                        <a href="Logout.jsp" id="link" style="float:right;" >Logout</a>
                </div> 
                <br>
                <div class="middle">
                    <center>
                        
                        
                        <div id="area2">
                            <p style="text-shadow: 5px 5px 10px black;"><font size="5" style="font-family:cambria; color: black">&nbsp;&nbsp;&nbsp;Payment Receipt</font></p>
                                <br>
                                <table width="70%"border="1" id="table_style" >
                                    <tr>
                                        <td width="50%">
                                            Payment Reference Number
                                        </td>
                            
                                        <td width="50%" align="center">
                                            <%= session.getAttribute("reference")%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Consumer Number
                                        </td>
                                        <td align="center">
                                            <%= session.getAttribute("consumer")%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Provider
                                        </td>
                                        <td align="center">
                                            <%= session.getAttribute("provider")%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Bill Type
                                        </td>
                                        <td align="center">
                                            <%= session.getAttribute("type")%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Email ID
                                        </td>
                                        <td align="center">
                                            <%= session.getAttribute("email")%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Mobile Number
                                        </td>
                                        <td align="center">
                                            <%= session.getAttribute("pay_mobile")%>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            Payment Option
                                        </td>
                                        <td align="center">
                                            <%= session.getAttribute("option")%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Total Amount
                                        </td>
                                        <td align="center">
                                            
                                            <%= session.getAttribute("payment")%>
                                        </td>
                                    </tr> 
                                </table>     
                            </div>
                        </center>
                        <br>
                    </div>
                </div>
                <br>
            </body>
        </html>

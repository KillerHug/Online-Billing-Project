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
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>

        
    </head>
    <body text="black" bgcolor="green">   
        
        <div id="box">
            <div id="header1">
                <p align=left style="color:white">Welcome,&nbsp;<%= rs.getString("name")%></p>
                
                <p align=right><font size='1' face="cambria" color="white">Home || About Us || Contact Us || Register || LogIn</font></p>           
            </div>
            <div class="title">
                <font size="+3" style="font-family:cambria; color: white">Online Payment Billing System</font><br>      
                <font size="2"style="font-family:cambria;color: white">Pay for Electricity, Telephone, Water And LPG Gas Bills Online</font>
            </div>
            <div class="container"> 
                <a href="CustomerProfile.jsp" class="btn ">Home</a> 
                <a href="History.jsp" class="btn">Billing History</a> 
                <a href="PayBill.jsp" class="btn active">Pay Bill</a>
                <a href="Reset.jsp" class="btn">Reset Password</a>
                <a href="Update.jsp">Update Information</a>
                <a href="Logout.jsp" id="link" style="float:right;" >Logout</a>
            </div> 
            <br>
            <div class="middle">
                <div id="area2">        
                    <form action="paymentCustomer" method="post">
                        <img src="images/image1.jpg" width="300px" height="300px" style="float:right">
                        <table frame="" width="70%">             
                            <p style="text-shadow: 5px 5px 10px black;"><font size="5" style="font-family:cambria; color: black">&nbsp;&nbsp;&nbsp;Bill Payment</font></p>
                            <hr class="style21"> 
                            
                            <tr>
                                <td width="45%">
                                    State<font color="red">*</font>
                                    <br>
                                    <select name="state">
                                        <option value="" selected>------------------Please Select------------------</option>
                                        <option value="Andhra Pradesh">Andhra Pradesh</option>
                                        <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                                        <option value="Assam">Assam</option>
                                        <option value="Bihar">Bihar</option>
                                        <option value="Chhattisgarh">Chhattisgarh</option>
                                        <option value="Goa">Goa</option>
                                        <option value="Gujarat">Gujarat</option>
                                        <option value="Haryana">Haryana</option>
                                        <option value="Himachal_Pradesh">Himachal Pradesh</option>
                                        <option value="Jammu & Kashmir">Jammu & Kashmir</option>
                                        <option value="Jharkhand">Jharkhand</option>
                                        <option value="Karnataka">Karnataka</option>
                                        <option value="Kerala">Kerala</option>
                                        <option value="Madhya Pradesh">Madhya Pradesh</option>
                                        <option value="Maharashtra">Maharashtra</option>
                                        <option value="Manipur">Manipur</option>
                                        <option value="Meghalaya">Meghalaya</option>
                                        <option value="Mizoram">Mizoram</option>
                                        <option value="Nagaland">Nagaland</option>
                                        <option value="Odisha">Odisha</option>
                                        <option value="Punjab">Punjab</option>
                                        <option value="Rajasthan">Rajasthan</option>
                                        <option value="Sikkim">Sikkim</option>
                                        <option value="Tamil_Nadu">Tamil Nadu</option>
                                        <option value="Telangana">Telangana</option>
                                        <option value="Tripura">Tripura</option>
                                        <option value="Uttarakhand">Uttarakhand</option>
                                        <option value="Uttar Pradesh">Uttar Pradesh</option>
                                        <option value="West Bengal">West Bengal</option>
                                    </select>
                                </td>
                                <td width="45%">
                                    Bill Type<font color="red">*</font>
                                    <br>
                                    <select name="type">
                                        <option value="" selected>------------------Please Select------------------</option>
                                        <option value="Electricity Bill">Electricity Bill</option>
                                        <option value="Gas Bill">Gas Bill</option>
                                        <option value="Water Bill"> Water Bill</option>
                                        <option value="Telephone Bill">Telephone Bill</option>
                                    </select>
                                </td>
                            </tr> 
                            <tr>
                                <td>
                                    Consumer No.<font color="red">*</font>
                                    <br>
                                    <input type="text" name="consumer" value="" size="10" maxlength="10"/> 
                                </td>
                                <td width="45%">
                                    Provider<font color="red">*</font>
                                    <br>
                                    <input type="text" id="" name="provider" size="30" maxlength="20" /> 
                                </td>
                            </tr>
                            <tr>
                                <%}
                            } catch (Exception e) {
                                out.println(e);
                            }
                        %>
                                <td>
                                    Mobile no.<font color="red">*</font>
                                    <br>
                                    <input type="text" name="mobile" value="" size="10" maxlength="10"/> 
                                </td>
                                <td>
                                    Email<font color="red">*</font>
                                    <br>
                                    <input type="text" name="email" value="<%= session.getAttribute("email")%>" disabled/> 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Total Amount Payment<font color="red">*</font>
                                    <br>
                                    <input type="text" name="payment" value="" size="10" maxlength="10" onkeyup="change();" id="source"/> 
                                </td>
                                <td>
                                    Payment Option<font color="red">*</font>
                                    <br>
                                    <select name="option">
                                        <option value="" selected>------------------Please Select------------------</option>
                                        <option value="Internet Banking">Internet Banking</option>
                                        <option value="Credit/Debit Card">Credit/Debit Card</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                        
                        <br>
                        
                        <img src="images/pay.png" style="float:right" width="300px" height="300px">
                        <table frame="" width="70%">
                            
                            <p style="text-shadow: 5px 5px 10px black;"><font size="5" style="font-family:cambria; color: black">&nbsp;&nbsp;&nbsp;Make Payment</font></p>
                            <hr class="style21">                 
                            <tr>
                                <td>
                                    Credit/Debit Card Number<font color="red">*</font>
                                    <br> 
                                    <input type="text" id="" name="cardno" size="30" maxlength="16" />
                                </td>
                                <td>
                                    Name on Credit/Debit Card<font color="red">*</font>
                                    <br> 
                                    <input type="text" id="" name="cardname" size="30" maxlength="20" onKeyup="javascript:this.value = this.value.toUpperCase();"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Card Type<font color="red">*</font>
                                    <br> 
                                    <select name="cardtype" id="">
                                        <option value="" selected>----------------Please Select----------------</option>
                                        <option value="Visa">Visa</option>
                                        <option value="Master Card">Master Card</option>

                                    </select>
                                </td>
                                <td>
                                    Expiry Date<font color="red">*</font>
                                    <br> 
                                    <input type="month" id="" name="expire" size="30" maxlength="20" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    CVV No.<font color="red">*</font>
                                    <br> 
                                    <input type="password" id="" name="cvv" size="30" maxlength="3" />
                                </td>
                                <td>
                                    Amount Paid<font color="red">*</font>
                                    <br> 
                                    <input type="text" name="paid" size="30" maxlength="10" id="send"/>
                                </td>
                            </tr>
                        </table>
                        
                        <br>
                        <button class="button button2">Submit</button>
                    </form>
                </div>
                <br>
            </div>
        </div>
        <br>
        <script>
            function change() {
                var src = document.getElementById("source");
                var dest = document.getElementById("send");
                dest.value = src.value;
            }
        </script>
    </body>
</html>

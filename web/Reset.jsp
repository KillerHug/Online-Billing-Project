<%@page import="servlet.*"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="java.sql.*" %>
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
        <link rel="stylesheet" type="text/css" href="style2.css" />
        <link rel="stylesheet" type="text/css" href="style.css" />
        <link rel="stylesheet" type="text/css" href="style1.css" />
        <title>Online Billing System</title>     
    </head>
    <body text="black" bgcolor="green">    

        <div id="box">
            <div id="header1">
                <p align=left style="color:white">Welcome,&nbsp;<%= rs.getString("name")%></p>
                <%}
                            } catch (Exception e) {
                                out.println(e);
                            }
                        %>
                        <!-- ------------------------------------------------------------ -->
                        <%
                    if (session.getAttribute("userid") == null) {
                        response.sendRedirect("CustomerLogIn.jsp");
                    }
                %>
                <p align=right></p>   
            </div>
            <p align=right><font size='1' face="cambria" color="white">Home || About Us || Contact Us || Register || LogIn</font></p>           
            <div class="title">
                <font size="+3" style="font-family:cambria; color: white">Online Payment Billing System</font><br>
                <font size="2"style="font-family:cambria;color: white">Pay for Electricity, Telephone, Water And LPG Gas Bills Online</font>
            </div>

            <div class="container"> 
                <a href="CustomerProfile.jsp" class="btn">Home</a> 
                <a href="History.jsp" class="btn">Billing History</a> 
                <a href="PayBill.jsp" class="btn">Pay Bill</a>
                <a href="Reset.jsp" class="btn active">Reset Password</a>
                <a href="Update.jsp">Update Information</a>
                <a href="Logout.jsp" id="link" style="float:right;" >Logout</a> 
            </div> 
            <br>
            <div class ="formStyle1">
                <br>  
                <div class="login1">

                    <%
                        String msg1 = (String) request.getAttribute("msg1");
                        if (msg1 != null) {
                    %>
                    <p style="color:red"><%= msg1%>
                    </p>
                    <%
                        } else {
                        }
                    %>
                    <p style="text-shadow: 5px 5px 10px black;"><font size="5" style="font-family:cambria; color: black">Reset Password</font></p>
                    <hr class="style20">
                    <form action="resetPassword" method="Post">
                        <input type="password" size="10" placeholder="Enter Old Password..." name="old" required/><br>
                        <input type="password" size="10" placeholder="Enter New Password..." name="new" id="pass1" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required/><br>
                        <input type="password" size="10" placeholder="Enter Re-New Password..." name="re"  required/><br>
                        <button class="button button2">Submit</button> &nbsp;                       
                        <button type="reset" value="Reset" class="button button2">Reset</button>
                    </form>
                    
                    <br>
                    <div id="message">
                        <font id="letter" class="invalid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>lowercase</b></font>&nbsp;&nbsp;&nbsp;
                        <font id="capital" class="invalid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>UPPERCASE</b> letter</font>&nbsp;&nbsp;&nbsp;
                        <font id="number" class="invalid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>number</b></font>&nbsp;&nbsp;&nbsp;
                        <font id="length" class="invalid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>8 characters</b></font>&nbsp;&nbsp;&nbsp;
                    </div>
                </div> 
                <br>
            </div>   
        </div>
        <br>
        <script>
            var myInput = document.getElementById("pass1");
            var letter = document.getElementById("letter");
            var capital = document.getElementById("capital");
            var number = document.getElementById("number");
            var length = document.getElementById("length");
// When the user clicks on the password field, show the message box
            myInput.onfocus = function () {
                document.getElementById("message").style.display = "block";
            }

// When the user clicks outside of the password field, hide the message box
            myInput.onblur = function () {
                document.getElementById("message").style.display = "none";
            }

// When the user starts to type something inside the password field
            myInput.onkeyup = function () {
                // Validate lowercase letters
                var lowerCaseLetters = /[a-z]/g;
                if (myInput.value.match(lowerCaseLetters)) {
                    letter.classList.remove("invalid");
                    letter.classList.add("valid");
                } else {
                    letter.classList.remove("valid");
                    letter.classList.add("invalid");
                }

                // Validate capital letters
                var upperCaseLetters = /[A-Z]/g;
                if (myInput.value.match(upperCaseLetters)) {
                    capital.classList.remove("invalid");
                    capital.classList.add("valid");
                } else {
                    capital.classList.remove("valid");
                    capital.classList.add("invalid");
                }

                // Validate numbers
                var numbers = /[0-9]/g;
                if (myInput.value.match(numbers)) {
                    number.classList.remove("invalid");
                    number.classList.add("valid");
                } else {
                    number.classList.remove("valid");
                    number.classList.add("invalid");
                }

                // Validate length
                if (myInput.value.length >= 8) {
                    length.classList.remove("invalid");
                    length.classList.add("valid");
                } else {
                    length.classList.remove("valid");
                    length.classList.add("invalid");
                }
            }
        </script>
    </body>
</html>

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
        <title>Online Billing System</title>     
    </head>
    <body text="black" bgcolor="green">    
        <div id="box">
            <p align=right><font size='1' face="cambria" color="white">Home || About Us || Contact Us || Register || LogIn</font></p>           
            <div class="title">
                <font size="+3" style="font-family:cambria; color: white">Online Payment Billing System</font><br>
                <font size="2"style="font-family:cambria;color: white">Pay for Electricity, Telephone, Water And LPG Gas Bills Online</font>
            </div>
            <div class="container"> 
                <a href="index.jsp" class="btn ">Home</a> 
                <a href="Registration.jsp" class="btn ">Customer Registration</a> 
                <a href="CustomerLogIn.jsp" class="btn active">Customer LogIn</a>
                <a href="AdminLogIn.jsp" class="btn">Administration LogIn</a> 
                <a href="#" class="btn">About Us</a>
                <a href="Contact.jsp" class="btn">Contact Us</a> 
            </div> 
            <br>
            <div class ="formStyle1">
                <br>  
                <img src="images/Login.jpg" style="float:left" width="200px" height="180px">
                <div class="login1">
                    <%
                        String logout = (String) request.getAttribute("logout");
                        if (logout != null) {
                    %>
                    <p style="color:red"><%= logout%>
                    </p>
                    <%
                        } else {
                        }
                    %>
                    <!-- Account Success full message-->
                    <%
                        String success1 = (String) request.getAttribute("success");
                        if (success1 != null) {
                    %>
                    <p style="color:red"><%= success1%>
                    </p>
                    <%
                        } else {
                        }
                    %>
                    <!-- Message for wrong Password-->
                    <%
                        String msg = (String) request.getAttribute("error");
                        if (msg != null) {
                    %>
                    <p style="color:red"><%= msg%>
                    </p>
                    <%
                        } else {
                        }
                    %>
                    <!-- Message for forget Password-->
                    <%
                        String passMSG = (String) request.getAttribute("password");
                        if (passMSG != null) {
                    %>
                    <p style="color:red">Your Password is <%= passMSG%></p>
                    <%
                        } else {
                        }
                    %>
                    <p style="text-shadow: 5px 5px 10px black;"><font size="5" style="font-family:cambria; color: black">Customer Log-In</font></p>
                    <hr class="style20">
                    <form action="customerVar" method="get" name="registration" enctype='multipart/form-data'>
                        <input type="text" size="10" placeholder="Enter Username..." name="loginUser" required/><br>
                        <input type="password" size="10" placeholder="Enter Password..." name="loginPass" required/><br>
                        <br>
                        <button class="button button2">Submit</button> &nbsp;                       
                        <button type="reset" value="Reset" class="button button2">Reset</button>
                    </form>
                    <br>
                    <a href="Forget.jsp" class="active">Forget Password</a>

                    <br>

                </div> 
                <br>
            </div>   
        </div>
        <br><br><br><br><br>
        <br>
    </body>
</html>

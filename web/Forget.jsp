
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
        <link rel="stylesheet" type="text/css" href="style3.css" />
        <link rel="stylesheet" type="text/css" href="style2.css" />
        <title>Online Billing System</title>
    </head>
    <body text="black" bgcolor="green">    
        <div id="box">
            <p align=right><font size='1' face="cambria" color="white"><a href="index.jsp" style="color:white">Home</a> || About Us || Contact Us || Register || LogIn</font></p>           
            <div class="title">
                <font size="+3" style="font-family:cambria; color: white">Online Payment Billing System</font><br>
                <font size="2"style="font-family:cambria;color: white">Pay for Electricity, Telephone, Water And LPG Gas Bills Online</font>
            </div>           
            <div class="container1"> 
                <div id="forget">
                    <h3 style="color:white;font-family:cambria;">User Forget Password Portal</h3>
                </div>
            </div> 
            <br>
            <div class ="formStyle1">
                <img src="images/forget.png" style="float:left" width="245px" height="196px">
                <br>      
                <div class="login1">
                    
                    <p style="text-shadow: 5px 5px 10px black;"><font size="5" style="font-family:cambria; color: black">Forget Password</font></p>
                    <hr class="style20">
                    <form action="forget" method="get" name="registration" enctype='multipart/form-data'>
                        <input type="text" size="10" placeholder="Enter UserID..." name="forgetUser" required/><br>
                        <input type="email" size="10" placeholder="Enter Email-ID..." name="forgetEmail" required/><br>
                        <br>
                        <button class="button button2">Submit</button> &nbsp;
                        <button class="button button2" type="reset">Reset</button> &nbsp;
                    </form>
                    <%
                        String invalid = (String) request.getAttribute("msg");
                        if (invalid != null) {
                    %>
                    <p style="color:red"><%= invalid%>
                    </p>
                    <%
                        } else {
                        }
                    %>
                </div>  
                <br>
            </div>   
        </div>
    </body>
</html>

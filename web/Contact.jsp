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
    </head>
    <body text="black" bgcolor="green" onload="displayResult()"> 

        <div id="box">
            <p align=right><font size='1' face="cambria" color="white">Home || About Us || Contact Us || Register || LogIn</font></p>           
            <div class="title">
                <font size="+3" style="font-family:cambria; color: white">Online Payment Billing System</font><br>
                <font size="2"style="font-family:cambria;color: white">Pay for Electricity, Telephone, Water And LPG Gas Bills Online</font>
            </div>
            <div class="container"> 
                <a href="index.jsp" class="btn ">Home</a> 
                <a href="Registration.jsp" class="btn ">Customer Registration</a> 
                <a href="CustomerLogIn.jsp" class="btn ">Customer LogIn</a>
                <a href="AdminLogIn.jsp" class="btn ">Administration LogIn</a> 
                <a href="#" class="btn">About Us</a>
                <a href="Contact.jsp" class="btn active">Contact Us</a> 
            </div> 
            <br>
            <div class="contactForm">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/Contact.png" width="80%" height="186px">            
                <form action="emailSend" method="post" enctype='multipart/form-data'name="myform">
                    <label for="subject">Subject:</label><br>
                    <input type="text" id="subject" name="subject" placeholder="Enter Subject..." ><br>
                    <label for="email">Email:</label><br>
                    <input type="email" id="email" name="email" placeholder="Your email-id..."><br>
                    <label for="subject">Message:</label><br>
                    <textarea id="subject" name="message" placeholder="Write something.." style="height:200px"class="emailForm"></textarea><br>
                    <button class="button button2" name="send">Submit</button> &nbsp;
                    <input class="button button2" type="reset">
                    
                </form>
                
            </div>
        </div>
        <br>
    </body>
</html>

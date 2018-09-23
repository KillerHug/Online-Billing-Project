
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
        
        <title>Online Billing System</title>
    </head>
    <body text="black">    
        <div id="box">
            <p align=right><font size='1' face="cambria" color="white">Home || About Us || Contact Us || Register || LogIn</font></p>           
            <div class="title">
                <font size="+3" style="font-family:cambria; color: white;">Online Payment Billing System</font><br>
                <font size="2"style="font-family:cambria;color: white">Pay for Electricity, Telephone, Water And LPG Gas Bills Online</font>        
            </div>
            <div class="container"> 
                <a href="index.jsp" class="btn active">Home</a> 
                <a href="Registration.jsp" class="btn ">Customer Registration</a> 
                <a href="CustomerLogIn.jsp" class="btn">Customer LogIn</a>
                <a href="AdminLogIn.jsp" class="btn">Administration LogIn</a> 
                <a href="#" class="btn">About Us</a>
                <a href="Contact.jsp" class="btn">Contact Us</a> 
            </div> 
            <div class="middle">             
                <div class="middleTable">
                    <table width="100%" border="0px" cellspacing="10px" >
                        <tr>
                            <td>
                                <font size="5px" style="font-family:cambria; color: black;">Online Billing Payment System</font>
                                
                                <hr class="style20">
                            </td>
                            <td>
                                <font size="5px" style="font-family:cambria; color: black;">Login-Portal</font>
                                <hr class="style20">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p style="font-family: cambria;text-align: justify;text-justify: inter-word; margin-top: 0px">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; An Online Billing payment system facilitates the acceptance of electronic payment for online transactions. Also known as a sample of Electronic Data Interchange (EDI), e-commerce payment systems have become increasingly popular due to the widespread use of the Internet-based shopping and banking.<br>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Over the years, credit cards have become one of the most common forms of payment for e-commerce transactions. In North America almost 90% of online retail transactions were made with this payment type. Turban et al. goes on to explain that it would be difficult for an online retailer to operate without supporting credit and debit cards due to their widespread use. Increased security measures include use of the card verification number (CVN) which detects fraud by comparing the verification number printed on the signature strip on the back of the card with the information on file with the card holder's issuing bank. Also online merchants have to comply with stringent rules stipulated by the credit and debit card issuers (Visa and Master Card) this means that merchants must have security protocol and procedures in place to ensure transactions are more secure. This can also include having a certificate from an authorized certification authority (CA) who provides PKI (Public-Key infrastructure) for securing credit and debit card transactions.
                                </p>
                            </td>
                            <td>
                                <a href="AdminLogIn.jsp"><img src="images/admin.jpg" width="200px" height="100px" style="border-radius: none;border: 1px solid black;box-shadow: none;"></a><br><br><br><br>
                                <a href="CustomerLogIn.jsp"><img src="images/customer.jpg" width="200px" height="100px" style="border-radius: none;border: 1px solid black;box-shadow: none;"></a>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>

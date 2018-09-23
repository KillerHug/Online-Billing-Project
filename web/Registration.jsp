
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
        <link rel="stylesheet" type="text/css" href="style1.css" />
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
                <a href="Registration.jsp" class="btn active">Customer Registration</a> 
                <a href="CustomerLogIn.jsp" class="btn">Customer LogIn</a>
                <a href="AdminLogIn.jsp" class="btn">Administration LogIn</a> 
                <a href="#" class="btn">About Us</a>
                <a href="Contact.jsp" class="btn">Contact Us</a> 
            </div> <br>
            <div class="form">
                
                <img src="images/banner.jpg" width="100%" height="200px"><br>
                <!--<font size="5px" style="font-family:cambria; color: black;">&nbsp;Customer Registration Form</font>
                <hr class="style18" width="75%" align="left">    -->
                <br>
                <form action="addCustomer" method="post" name="registration" enctype='multipart/form-data'>
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
                        <tr >
                            <td colspan="3">
                                <h4 style="font-family: cambria"> Personal Detail</h4><hr class="style19">
                            </td>
                        </tr>
                        <tr>
                            <td width="34%">
                                Salution<font color="red">*</font>
                                <br>
                                <select name="salution" required>
                                    <option value="" selected>--Please Select--</option>
                                    <option value="Mr.">Mr.</option>
                                    <option value="Mrs.">Mrs.</option>
                                </select>
                            </td>
                            <td width="34%">
                                Marital Status<font color="red">*</font>
                                <br>
                                <select name="marital" required>
                                    <option value="none" selected>--Please Select--</option>
                                    <option value="Unmarried">Unmarried</option>
                                    <option value="Married">Married</option>
                                </select>
                            </td> 
                            <td width="32%">
                                Employment Status<font color="red">*</font>
                                <br>
                                <select name="emp" required>
                                    <option value="none" selected>--Please Select--</option>
                                    <option value="Private">Private</option>
                                    <option value="Student">Student</option>
                                    <option value="Self_Employee">Self Employee</option>
                                    <option value="Government_Job">Government Job</option>
                                </select>
                            </td> 
                        </tr>
                        <tr>
                            <td>
                                First Name<font color="red">*</font>
                                <br>
                                <input type="text" name="fname" onKeyup="javascript:this.value = this.value.toUpperCase();" required>
                            </td>
                            <td>
                                Middle Name<font color="red">*</font>
                                <br>
                                <input type="text" name="mname"onKeyup="javascript:this.value = this.value.toUpperCase();">
                            </td>
                        <td>
                            Last Name<font color="red">*</font>
                            <br>
                            <input type="text" name="lname" size="30" onKeyup="javascript:this.value = this.value.toUpperCase();" required>
                            </td>
                            </tr>
                            <tr>
                                <td>
                                    Gender
                                    <br>
                                    <select name="gender" required>
                                        <option value="" selected>--Please Select--</option>
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                    </select>
                                </td>
                                <td>
                                    Date Of Birth
                                    <br>
                                    <input type="date" name="dob" placeholder="(DD-MM-YYYY)">
                                </td>
                                <td>
                                    Nationality
                                    <br>
                                    <select name="national" required>
                                        <option value="" selected>--Please Select--</option>
                                        <option value="Indian">Indian</option>
                                        <option value="Other">Other</option>
                                    </select>
                                </td>                  
                            </tr>
                            <tr>
                                <td>
                                    Email
                                    <br>
                                    <input type="email" name="email" placeholder="">
                                    
                                </td>
                                <td>
                                    Mobile
                                    <br>
                                    <input type="text" name="mobile" maxlength="10" placeholder="">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <h4 style="font-family: cambria"> Customer Address Detail</h4><hr class="style19">                   
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Address
                                    <br>
                                    <input type="text" name="address" maxlength="50" placeholder="">
                                </td>
                                <td>
                                    Village/City/Town
                                    <br>
                                    <input type="text" name="city" maxlength="20" placeholder="">
                                </td>
                                <td>
                                    State
                                    <br>
                                    <input type="text" name="state" maxlength="20" placeholder="">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    Country
                                    <br>
                                    <select name="country" required>
                                        <option value="" selected>--Please Select--</option>
                                        <option value="India">India</option>
                                        <option value="Other">Other</option>
                                    </select>
                                </td> 
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <h4 style="font-family: cambria"> Customer Log-In Detail</h4><hr class="style19">                   
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    User-ID
                                    <br>
                                    <input type="text" name="userid" maxlength="20" placeholder="" >
                                </td>
                                <td>
                                    Password
                                    <br>
                                    <input type="password" id="pass1" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
                                </td>
                                <td>
                                    Confirm Password &nbsp; 
                                    <br>
                                    <input type="password" name="pass2" id="pass2" onkeyup="checkPass(); return false;">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <button class="button button2" onClick="return Upload()">Submit</button> &nbsp;

                                </td>
                                <td> 
                                    <input class="button button2" type="reset">
                                </td>
                                <td>
                                    <input type="checkbox" onchange="document.getElementById('pass1').type = this.checked ? 'text' : 'password'"> Show password                           
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <br><span id="confirmMessage" class="confirmMessage"></span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <div id="message">
                                        <font id="letter" class="invalid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>lowercase</b></font>&nbsp;&nbsp;&nbsp;
                                        <font id="capital" class="invalid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>UPPERCASE</b> letter</font>&nbsp;&nbsp;&nbsp;
                                        <font id="number" class="invalid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>number</b></font>&nbsp;&nbsp;&nbsp;
                                        <font id="length" class="invalid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>8 characters</b></font>&nbsp;&nbsp;&nbsp;
                                    </div>
                                </td>
                            </tr>
                    </table>              
                </form>
                <br>           
            </div>
        </div>
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
        <script>
            function isPasswordMatch() {
                var password = $("#txtNewPassword").val();
                var confirmPassword = $("#txtConfirmPassword").val();
                if (password != confirmPassword)
                    $("#divCheckPassword").html("Passwords do not match!");
                else
                    $("#divCheckPassword").html("Passwords match.");
            }

            $(document).ready(function () {
                $("#txtConfirmPassword").keyup(isPasswordMatch);
            });
            function checkPass()
            {
                //Store the password field objects into variables ...
                var pass1 = document.getElementById('pass1');
                var pass2 = document.getElementById('pass2');
                //Store the Confimation Message Object ...
                var message = document.getElementById('confirmMessage');
                //Set the colors we will be using ...
                var goodColor = "#66cc66";
                var badColor = "#ff6666";
                //Compare the values in the password field 
                //and the confirmation field
                if (pass1.value == pass2.value) {
                    //The passwords match. 
                    //Set the color to the good color and inform
                    //the user that they have entered the correct password 

                    message.style.color = goodColor;
                    message.innerHTML = "Passwords Match!"
                } else {
                    //The passwords do not match.
                    //Set the color to the bad color and
                    //notify the user.

                    message.style.color = badColor;
                    message.innerHTML = "Passwords Do Not Match!"
                }
            }

            function Upload() {
                //Get reference of FileUpload.
                var fileUpload = document.getElementById("fileUpload");
                //Check whether the file is valid Image.
                var regex = new RegExp("([a-zA-Z0-9\s_\\.\-:])+(.jpg|.png|.gif)$");
                if (regex.test(fileUpload.value.toLowerCase())) {

                    //Check whether HTML5 is supported.
                    if (typeof (fileUpload.files) != "undefined") {
                        //Initiate the FileReader object.
                        var reader = new FileReader();
                        //Read the contents of Image File.
                        reader.readAsDataURL(fileUpload.files[0]);
                        reader.onload = function (e) {
                            //Initiate the JavaScript Image object.
                            var image = new Image();
                            //Set the Base64 string return from FileReader as source.
                            image.src = e.target.result;
                            //Validate the File Height and Width.
                            image.onload = function () {
                                var height = this.height;
                                var width = this.width;
                                if (height > 100 || width > 100) {
                                    alert("Height and Width must not exceed 100px.");
                                    return false;
                                }
                                alert("Uploaded image has valid Height and Width.");
                                return true;
                            };

                        }
                    } else {
                        alert("This browser does not support HTML5.");
                        return false;
                    }
                } else {
                    alert("Please select a valid Image file.");
                    return false;
                }
            }
        </script>
        <br>
    </body>
</html>

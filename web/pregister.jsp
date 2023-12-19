<!DOCTYPE HTML>
<html>

    <head>
        <title>PHR Sharing in Cloud</title>
        <meta name="description" content="website description" />
        <meta name="keywords" content="website keywords, website keywords" />
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <link rel="shortcut icon" type="image/x-icon" href="images/brainstorming_alternative.png"/>
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <!-- modernizr enables HTML5 elements and feature detects -->
        <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
        <script>
            function validation() {
                var name = document.ureg.name.value;
                var uname = document.ureg.username.value;
                var pass = document.ureg.password.value;
                var cpass = document.ureg.cpassword.value;
                var mail = document.ureg.mail.value;
                var ph = document.ureg.mobile.value;

                if (uname == 0) {
                    alert("Enter username");
                    document.ureg.username.focus();
                    return false;
                }
                if (pass == 0) {
                    alert("Enter password");
                    document.ureg.password.focus();
                    return false;
                }
                if (cpass != pass) {
                    alert("Incorrect password");
                    document.ureg.cpassword.focus();
                    return false;
                }
                if (mail == 0) {
                    alert("Enter mailid");
                    document.ureg.mail.focus();
                    return false;
                }
                if (ph == 0) {
                    alert("Enter your mobile no");
                    document.ureg.mobile.focus();
                    return false;
                }
                if (isNaN(ph)) {
                    alert("Invalid phoneno");
                    document.ureg.mobile.focus();
                    return  false;
                }
                var y = document.ureg.mobile.value;
                if (isNaN(y) || y.indexOf(" ") != -1)
                {
                    alert("Invalid Mobile No.");
                    document.ureg.mobile.focus();
                    return false;
                }

                if (y.length > 10 || y.length < 10)
                {
                    alert("Mobile No. should be 10 digit");
                    document.ureg.mobile.focus();
                    return false;
                }
                if (!(y.charAt(0) == "9" || y.charAt(0) == "8" || y.charAt(0) == "7"))
                {
                    alert("Mobile No. should start with 9 ,8 or 7 ");
                    document.ureg.mobile.focus();
                    return false
                }


                if (document.ureg.password.value !== "") {
                    if (document.ureg.password.value.length < 6) {
                        alert("Error: Password must contain at least six characters!");
                        document.ureg.password.focus();
                        return false;
                    }
                    re = /[@./#&+-]*$/;
                    if (!re.test(document.ureg.password.value)) {
                        alert("Error: Password must contain at least one special symbol!");
                        document.ureg.password.focus();
                        return false;
                    }
                    re = /[0-9]/;
                    if (!re.test(document.ureg.password.value)) {
                        alert("Error: password must contain at least one number (0-9)!");
                        document.ureg.password.focus();
                        return false;
                    }
                    re = /[a-z]/;
                    if (!re.test(document.ureg.password.value)) {
                        alert("Error: password must contain at least one lowercase letter (a-z)!");
                        document.ureg.password.focus();
                        return false;
                    }
                    re = /[A-Z]/;
                    if (!re.test(document.ureg.password.value)) {
                        alert("Error: password must contain at least one uppercase letter (A-Z)!");
                        document.ureg.password.focus();
                        return false;
                    }
                }
                return true;
            }
        </script>
        <style>
            h1{
                position: relative;
                left: 50%;
            }
            h2{
                position: relative;
                left: 60%;
            }

            input{
                width: 200px;
                height: 25px;
                background-color: #D5D5D5;
            }
            #but{
                width: 75px;
                height: 25px;
            }
        </style>
    </head>

    <body>
        <%
//             datalib.DataLib.main(null);
            if (request.getParameter("username") != null) {
                out.println("<script>alert('Username already used')</script>");
            }
            if (request.getParameter("mail") != null) {
                out.println("<script>alert('Mailid already used')</script>");
            }
            if (request.getParameter("phn") != null) {
                out.println("<script>alert('Mobile No. already used')</script>");
            }
        %>
        <div id="main">
            <header>
                <div id="logo">
                    <div id="logo_text">
                        <!-- class="logo_colour", allows you to change the colour of the text -->
                        <pre> <h1><a href="index.html">Personal Health Records </a></h1>
          <h2 style="font-size: 22px">for Secure Authorized Record Sharing</h2></pre>
                    </div>
                </div>
                <nav>
                    <ul class="sf-menu" id="nav">
                        <li class="selected"><a href="index.html">Home</a></li>
                        <li><a href="#">Admin</a>
                            <ul>
                                <li><a href="p_cloud1.jsp">Login</a></li>
                            </ul>
                        </li> 
                        <li><a href="#">PHR Owner</a>
                            <ul>
                                <li><a href="p_cloud.jsp">Login</a></li>
                                <li><a href="pregister.jsp">Register</a></li>
                            </ul>
                        </li>  
                        <li><a href="#">Hospital</a>
                            <ul>
                                <li><a href="user.jsp">Login</a></li>
                                <li><a href="register.jsp">Register</a></li>
                            </ul>
                        </li>
                        <li><a href="ContactUs.jsp">About Us</a></li>
                    </ul>
                </nav>
            </header>
            <div id="site_content">
                <div id="sidebar_container">
                    <div class="gallery">
                        <ul class="images">
                            <li class="show"><img width="450" height="390" src="images/c1.jpg" alt="photo_one" /></li>
                            <li><img width="450" height="390" src="images/c2.jpg" alt="photo_two" /></li>
                            <li><img width="450" height="390" src="images/c3.jpg" alt="photo_three" /></li>
                            <li><img width="450" height="390" src="images/c4.jpg" alt="photo_four" /></li>
                            <li><img width="450" height="390" src="images/c5.jpg" alt="photo_five" /></li>
                        </ul>
                    </div>
                </div>
                <div id="content">
                    <fieldset>
                        <center>
                            <h3 class="title"style="color: coral">PHR Owner Registration</h3>
                        </center>

                        <form action="pregister" name="ureg" style="position: relative;left: 110px;" method="post" onsubmit="return validation()"> 
                            <!--                  USERNAME:<br>-->
                            Owner Name :<BR>
                            <input type="text" name="name" placeholder="Enter Owner Name"><br></br>
                            UserName :<BR>
                            <input type="text" name="username" placeholder="Enter username"><br></br>
                            <!--                  PASSWORD:<br>-->
                            Password :<BR>
                            <input type="password" name="password" placeholder="Enter password"><br></br>
                            Confirm Password :<BR>
                            <input type="password" name="cpassword" placeholder="confirm your password"><br></br>
                            Email-Id :<BR>
                            <input type="email" name="mail" placeholder="Enter your email"><br></br>
                            Contact No :<BR>
                            <input type="text" name="mobile" placeholder="Enter your mobile no" maxlength="10"><br></br>
                            &nbsp;&nbsp;<input type="submit" id="but" value="Register"style="background-color: yellowgreen;color: #ffffff"/>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   <input type="reset"id="but" value="Reset" style="background-color: #AA3300;color: #ffffff"></input><br></br>
                        </form>
                    </fieldset>
                </div>
            </div>
            <footer>
                <p>Copyright &copy; BE Comp. All Rights Reserved.</p>
            </footer>
        </div>
        <p>&nbsp;</p>
        <!-- javascript at the bottom for fast page loading -->
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery.easing-sooper.js"></script>
        <script type="text/javascript" src="js/jquery.sooperfish.js"></script>
        <script type="text/javascript" src="js/image_fade.js"></script>
        <script type="text/javascript">
                            $(document).ready(function() {
                                $('ul.sf-menu').sooperfish();
                            });
        </script>
    </body>
</html>

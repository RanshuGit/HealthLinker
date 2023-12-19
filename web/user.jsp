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
                var uname = document.ulogin.username.value;
                var pass = document.ulogin.password.value;

                if (uname == 0) {
                    alert("Enter username");
                    document.ulogin.username.focus();
                    return false;
                }
                if (pass == 0) {
                    alert("Enter password");
                    document.ulogin.password.focus();
                    return false;
                }
            }
        </script>
        <style>
            #id{
                width: 200px;
                height: 25px;
                background-color: #D5D5D5;
            }
            #but{
                width: 60px;
                height: 25px;
            }
            h1{
                position: relative;
                left: 50%;
            }
            h2{
                position: relative;
                left: 60%;
            }
        </style>
    </head>

    <body>
        <%
            if (request.getParameter("status") != null) {
                out.println("<script>alert('Registered')</script>");
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
                            <li class="show"><img width="450" height="450" src="images/d1.jpg" alt="photo_one" /></li>
                            <li><img width="450" height="450" src="images/m1.jpg" alt="photo_two" /></li>
                            <li><img width="450" height="450" src="images/f1.jpg" alt="photo_three" /></li>
                            <li><img width="450" height="450" src="images/a1.jpg" alt="photo_four" /></li>
                            <li><img width="450" height="450" src="images/i1.jpg" alt="photo_five" /></li>
                        </ul>
                    </div>
                </div>
                <div id="content"><br></br>
                    <fieldset style="padding: 10px">
                        <center>
                            <h3>Login</h3>
                            <form action="user_login" name="ulogin" method="post" onsubmit="return validation()"> 
                                <!--                  USERNAME:<br>-->
                                <input type="text" id="id" name="username" placeholder="Enter username"/><br></br>
                                <!--                  PASSWORD:<br>-->
                                <input type="password" id="id" name="password" placeholder="Enter password"/><br></br>
                                <input type="submit" id="but" value="Login"style="background-color: yellowgreen;color: #ffffff"/>
                                &nbsp;&nbsp;   <input type="reset" id="but" value="Reset" style="background-color: #AA3300;color: #ffffff"><br></br>
                                <font style="font-size: 17px;">        Don't have an Register <a href="register.jsp" style="color: cadetblue">Register here</a>     </font>              
                            </form>
                        </center>
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

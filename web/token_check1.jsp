<!DOCTYPE HTML>
<html>

    <head>
        <title>PHR Sharing On Cloud</title>
        <meta name="description" content="website description" />
        <meta name="keywords" content="website keywords, website keywords" />
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <link rel="shortcut icon" type="image/x-icon" href="images/brainstorming_alternative.png"/>
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <!-- modernizr enables HTML5 elements and feature detects -->
        <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
    </head>
    <style>
        form{
                position: relative;
                left: 300px;

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
    <body>
        <div id="main">
            <header>
                <div id="logo">
                    <div id="logo_text">
                        <!-- class="logo_colour", allows you to change the colour of the text -->
                        <pre> <h1><a href="index.html">Personal Health Records </a></h1>
          <h2 style="font-size: 22px">For Secure Authorized Record Sharing</h2></pre>
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
                        <li><a href="#">User</a>
                            <ul>
                                <li><a href="user.jsp">Login</a></li>
                                <li><a href="register.jsp">Register</a></li>
                            </ul>
                        </li>
                        <li><a href="ContactUs.jsp">About Us</a></li>
                    </ul>
                </nav>
            </header>
            <%
                HttpSession user = request.getSession();
                String uname = user.getAttribute("username").toString();
            %>
            <div id="site_content">

                <div id="content">
                    <center><h1>Welcome ! <font style="color: tomato"> <%=uname%></font></h1></center>
                    <form action="token1.jsp" name="name" method="get" onsubmit="return validation()">
                        Enter Token:
                        <input type="text" id="id" name="token" placeholder="Enter Token" style="height: 25px"/><br></br>
                        <pre>
        <input type="submit" id="but"value="Submit" style="background-color: #009900; height: 25px; width: 70px"/>   <input type="reset" id="but" value="Reset" style="background-color: #AA3300; height: 25px; width: 70px"/>
                        </pre>
                    </form>
                </div>
            </div>
            <footer>
                <p>Copyright &copy; All Rights Reserved.</p>
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

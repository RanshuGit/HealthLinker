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
                if (document.name.token.value == 0) {
                    alert('Enter your token');
                    document.name.token.focus();
                    return false;
                }
            }
        </script>

        <style>
            form{
                position: relative;
                left: 350px;
            }

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
            if (request.getParameter("no") != null) {
                out.println("<script>alert('your not having permission to do this...')</script>");
            }
            if (request.getParameter("status") != null) {
                out.println("<script>alert('Your request sent to PHR Owner')</script>");
            }

        %>
        <div id="main">
            <header>
                <div id="logo">
                    <div id="logo_text">
                        <!-- class="logo_colour", allows you to change the colour of the text -->
                        <pre> <h1><a href="index.html">Personal Health Records </a></h1>
          <h2 style="font-size: 22px">For Secure Authorized Record Sharing</h2>
                        </pre>
                    </div>
                </div>
                <nav>
                    <ul class="sf-menu" id="nav">
                        <li ><a href="users.jsp">Users</a></li>
                        <li><a href="acturies.jsp">Actuaries</a></li>
                        <li ><a href="a_uploads.jsp">Uploads</a></li>
                        <li ><a href="a_downloads.jsp">Downloads</a></li>
                        <li><a href="a_analysis.jsp">Analysis</a></li>
                        <li><a href="traitor.jsp">Traitor Tracing</a></li>
                        <li ><a href="load.jsp">Dataset</a></li>
                         
                        <li><a href="#"><img width="40" height="40" src="images/user.png" alt="photo_two" /></a>
                            <ul>
                                <li><a href="index.html">Logout</a></li>  
                            </ul>
                        </li>
                    </ul>
                </nav>
            </header>
            <div id="site_content">

                <div id="content">
                    <%                        HttpSession user = request.getSession();
                        String uname = user.getAttribute("username").toString();
                        //  String name = user.getAttribute("name").toString();
%>
                    <center><h1>Welcome ! <font style="color: tomato"> <%=uname%></font></h1></center>
                    <div style="position: relative;left: 50px;">
                        <img src="images/p.jpg" width="800" height="400" ></img>
                    </div>
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

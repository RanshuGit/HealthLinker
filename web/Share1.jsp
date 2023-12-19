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
                width: 150px;
                height: 25px;
            }
        </style>
    </head>

    <body>
        <%
            if (request.getParameter("username") != null) {
                out.println("<script>alert('Username already used')</script>");
            }
            if (request.getParameter("mail") != null) {
                out.println("<script>alert('Mailid already used')</script>");
            }
            if (request.getParameter("phn") != null) {
                out.println("<script>alert('Mobile No. already used')</script>");
            }
            String id = request.getParameter("id");
        %>
        <%
            HttpSession user = request.getSession();
            String uname = user.getAttribute("username").toString();
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
                        <li ><a href="CreateRecord.jsp">Create Health Records</a></li>
                        <li ><a href="View.jsp">View</a></li>
                        <li ><a href="update.jsp">Update</a></li>
                        <li ><a href="aupload.jsp">Upload</a></li>
                        <li><a href="download.jsp">Download</a></li>
                         <li><a href="inbox.jsp">Inbox</a></li>
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
                    <div style="position: relative;width: 800px;left: 50px;">
                        <fieldset>
                            <center>
                                <h3 class="title"style="color: coral">Share Secret Key With</h3>
                            </center>
                            <form action="ShareKey1" name="ureg" style="position: relative;left: 175px;" method="get" onsubmit="return validation()"> 
                                <table>
                                    <tr>
                                        <td>Email-Id : </td>
                                        <td><input type="email" name="mail1" placeholder="Enter Email Id"></td>
                                    </tr>
                                </table>
                                <input type="hidden" value="<%=id%>" name="id">
                                <input type="hidden" value="<%=uname%>" name="id1">
                                &nbsp;&nbsp;&nbsp;<input type="submit" id="but" value="Send Secret Key"style="background-color: yellowgreen;color: #ffffff"/>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                <input type="reset"id="but" value="Reset" style="background-color: #AA3300;color: #ffffff"></input><br></br>

                            </form>
                        </fieldset>
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

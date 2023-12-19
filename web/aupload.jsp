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
            if (request.getParameter("status") != null) {
                out.println("<script>alert('Uploaded...')</script>");
            }
            if (request.getParameter("failed") != null) {
                out.println("<script>alert('file already exist...')</script>");
            }
            if (request.getParameter("rename") != null) {
                out.println("<script>alert('file name already exist...Please rename the file')</script>");
            }

        %>
        <div id="main">
            <header>
                <div id="logo">
                    <div id="logo_text">
                        <!-- class="logo_color", allows you to change the color of the text -->
                        <pre> <h1><a href="index.html">Personal Health Records</a></h1>
                            <h2 style="font-size: 22px">For Secure Authorized Record Sharing</h2>
                        </pre>
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
                    <%
                        HttpSession user = request.getSession();
                        String uname = user.getAttribute("username").toString();
                    %>
                    <center> <h1>Welcome ! <font style="color: tomato"> <%=uname%></font></h1></center>

                    <form action="upload" name="name" method="post" enctype="multipart/form-data">
                        <input type="file" name="file" ><br></br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" id="but" style="background-color: #009900"value="Upload">  <input type="reset"id="but"  style="background-color: #AA3300"value="Reset">
                    </form>
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

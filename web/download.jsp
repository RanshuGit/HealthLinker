<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="pack.Dbconnection"%>
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
            form,h1{
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
        <style>
            table,td,tr,th{
                border: 1px solid black;
                border-collapse: collapse;
                border-style: solid;
            }
            table tr:nth-child(even) {
                background-color: #fff;
            }
            table tr:nth-child(odd) {
                background-color: #eee;
            }
            table{
                position: relative;
                left: 50px;
                width: 680px;
            }
            th{
                background-color: #ccffcc;
                text-align: center;
            }
            td{
                text-align: center;
            }
            tr{ 

                height: 50px;
            }
        </style>
    </head>

    <body>
        <%
            if (request.getParameter("updated") != null) {
                out.println("<script>alert('updated....')</script>");
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
                        <li ><a href="CreateRecord.jsp">Create Health Record</a></li>
                        <li ><a href="View.jsp">View</a></li>
                        <li ><a href="update.jsp">Update</a></li>
                        <li><a href="aupload.jsp">Upload</a></li>
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
                    <%                        HttpSession user = request.getSession();
                        String uname = user.getAttribute("username").toString();
                        String name = user.getAttribute("name").toString();

                        Connection con = Dbconnection.getConn();
                        Statement st = con.createStatement();
                        ResultSet rt = st.executeQuery("select * from files where owner_name='" + uname + "'");
                    %>
                    <center> <h1>Welcome ! <font style="color: tomato"> <%=uname%></font></h1></center>
                    <div style="position: relative;width: 800px;">
                        <center>
                            <table style="border-style: solid">
                                <caption> <h3 style="color: coral"> FILES</h3></caption>
                                <tr STYLE="background-color: #999999;font-size: 15px;">                                
                                    <th>File Name</th> <th>Owner Name</th><th>Upload Time</th><th style="text-align: center">File Size</th><th>Download</th>
                                </tr>
                                <%
                                    while (rt.next()) {
                                        String id = rt.getString("idfiles");
                                %>
                                <TR>
                                    <td><%=rt.getString("filename")%></td>
                                    <td><%=rt.getString("owner_name")%></td>
                                    <td><%=rt.getString("upload_time")%></td>
                                    <td><%=rt.getString("size")%></td>
                                    <td align="center"><a href="download?<%=id%>">Download</a></td>
                                </TR>
                                <%}%>
                            </table>
                        </center>
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

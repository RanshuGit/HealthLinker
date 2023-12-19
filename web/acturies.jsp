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
                left: 100px;
                width: 680px;
            }
            th{
                background-color: #ccccff;
                text-align: center;
            }
            td{
                text-align: center;
            }
            tr{ 

                height: 50px;
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
            if (request.getParameter("rights") != null) {
                out.println("<script>alert('Updated...')</script>");
            }

        %>
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
                        <li ><a href="users.jsp">Users</a></li>
                        <li><a href="acturies.jsp">Actuaries</a></li>
                        <li ><a href="a_uploads.jsp">Uploads</a></li>
                        <li ><a href="a_downloads.jsp">Downloads</a></li>
                        <li><a href="a_analysis.jsp">Analysis</a></li>
                        <li><a href="traitor.jsp">Traitor Tracing</a></li>
                        <li><a href="#"><img width="40" height="40" src="images/user.png" alt="photo_two" /></a>
                            <ul>
                                <li><a href="index.html">Logout</a></li>  
                            </ul>
                        </li>
                    </ul>
                </nav>
            </header>
            <div id="site_content">

                <%
                    Connection con = Dbconnection.getConn();
                    Statement st = con.createStatement();
                    ResultSet rt = st.executeQuery("select * from actuary_reg order by activate asc");
                %>
                <div id="content">
                    <pre><h2 style="left: 80%">Welcome ! Admin</h2></pre>
                    <center>
                        <form action="" method="get">
                            <table style="border-style: solid">
                                    <caption> <h3 style="color: coral"> ACTUARIES</h3></caption>
                                <tr STYLE="background-color: yellowgreen;font-size: 15px;">                                
                                    <td>DESIGNATION</td> <td>USERNAME</td><td>PASSWORD</td><td style="text-align: center">MAIL</td><td>STATUS</td><td>ACTION</td>
                                </tr>
                                <%
                                    while (rt.next()) {
                                        String name = rt.getString("designation");
                                        String uname = rt.getString("username");
                                        String pass = rt.getString("password");
                                        String mail = rt.getString("mail");
                                        String status = rt.getString("activate");
                                %>
                                <TR>
                                    <td><%=name%></td> <td><%=uname%></td> <td style="text-align: center">****</td> <td><%=mail%></td><td style="text-align: center"><%=status%></td>
                                    <%
                                        if (status.equalsIgnoreCase("no")) {
                                    %>
                                    <td><a href="activate1.jsp?<%=uname%>" >Activate</a></td>
                                    <%
                                    } else {
                                    %>

                                    <td><a href="deactivate.jsp?<%=uname%>" >Deactivate</a></td>
                                    <%
                                        }
                                    %>

                                </TR>    
                                <%
                                    }
                                %>
                            </table>
                        </form>
                    </center> 
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

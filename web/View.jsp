<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="pack.Dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE HTML>
<html>

    <head>
        <title>PHR Sharing In Cloud</title>
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
            HttpSession user = request.getSession();
            String uname = user.getAttribute("username").toString();
           
        %>

        <%
            Connection con = Dbconnection.getConn();
            Statement st = con.createStatement();
            String sql = "select * from patient_record where username='" + uname + "'";
            ResultSet rs = st.executeQuery(sql);
            String fname = "", lname = "", email = "", contact = "", address = "";
            int id = 1;
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
                    <div style="position: relative;width: 800px;">
                        <center>
                            <table>
                                <caption> <h3 style="color: coral"> Health Record Files</h3></caption>
                                <tr>
                                    <th>Patient Id</th>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Email-Id</th>
                                    <th>Contact No</th>
                                    <th>Address</th>
                                    <th>View</th>
                                    <th>Share</td>
                                    <th>Delete</td>
                                </tr>
                                <%
                                    while (rs.next()) {
                                        String id1 = rs.getString(1);
                                        fname = rs.getString(2);
                                        lname = rs.getString(3);
                                        email = rs.getString(4);
                                        contact = rs.getString(10);
                                        address = rs.getString(6);
                                %>
                                <tr>
                                    <td><%=id++%></td>
                                    <td><%=fname%></td>
                                    <td><%=lname%></td>
                                    <td><%=email%></td>
                                    <td><%=contact%></td>
                                    <td><%=address%></td>
                                    <td><a href="HealthData.jsp?id=<%=email%>">view</a></td>
                                    <td><a href="Share1.jsp?id=<%=email%>">Share</a></td>
                                    <td><a href="DeleteRecord1?id=<%=email%>"onclick="if (!confirm('Are You Sure')) {
                                                return false;
                                            }">Delete</a></td>
                                </tr>
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

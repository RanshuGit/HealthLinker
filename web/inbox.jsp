<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
            form,h1{
                position: relative;
                left: 50%;
            }
            form,h2{
                position: relative;
                left: 60%;
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


            table {
                position: relative;
                left: 50px;
                width: 680px;
                table-layout:fixed;
                margin:auto;
                width: 700px;
                border: 1px solid black;
                border-collapse: collapse;
                border-style: solid;
            }
            th, td {
                padding:10px 10px;
                text-align: center;
                border: 1px solid black;
                border-collapse: collapse;
                border-style: solid;
            }

            tbody {
                overflow:auto;
                overflow-x:hidden;
                display:block;
                width:100%;
            }
            tbody tr {
                display:table;
                width:100%;
                table-layout:fixed;
            }

            table,td,tr,th{
                border: 1px solid black;
                border-collapse: collapse;
                border-style: solid;
            }
            th{
                background-color: #ccffcc;
                text-align: center;
                height: 35px;
            }

        </style>
    </head>

    <body>
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
//                         datalib.DataLib.main(null);
                        HttpSession user = request.getSession();
                        String uname = user.getAttribute("username").toString();
                        //String name = user.getAttribute("name").toString();
                        Connection con = Dbconnection.getConn();
                        Statement st = con.createStatement();
                        ResultSet rt = st.executeQuery("select * from prescription where patient_name='" + uname + "'");
                        
                    %>
                    <center><h1>Welcome ! <font style="color: tomato"> <%=uname%></font></h1></center>
                    <div style="position: relative; width: 800px;">
                        <center>
                            <table style="border-style: solid">
                                <center><caption> <h3 style="color: coral">Prescription by Doctors</h3></caption></center>
                                <tr STYLE="background-color: #999999;font-size: 15px;">                                
                                    <th>Prescription By</td> 
                                    <th>File Name</td>
                                    <th>Date & Time</td>
                                    <th>Prescription</td>
                                </tr>
                                <%
                                    while (rt.next()) {

                                %>
                                <tbody>
                                    <TR>
                                        <td>Dr. <%=rt.getString("doctor_name")%></td>
                                        <td><%=rt.getString("filename")%></td>
                                        <td><%=rt.getString("p_time")%></td>
                                        <td><%=rt.getString("prescription")%></td>
                                    </TR>
                                </tbody>
                                <%} %>
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

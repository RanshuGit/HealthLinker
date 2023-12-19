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

                <div id="content">
                    <%                        Connection con = Dbconnection.getConn();
                        Statement st = con.createStatement();
                        ResultSet rt = st.executeQuery("select * from sharekey");
                    %>


                    <center>
                        <table style="border-style: solid">
                            <caption> <h3 style="color: coral">DOWNLOADS</h3></caption>
                            <tr STYLE="background-color: yellowgreen;font-size: 15px;">                               
                                <td>OWNER NAME</td>   
                                <td>FILE NAME</td> 
                                <td>SHARE KEY</td>
                                <td>SHARE WITH</td>
                                <td> TRAITOR COUNT</td>
                                <td>USER STATUS</td>
                            </tr>
                            <%
                                while (rt.next()) {
                                    String share_with = rt.getString("share_with");

                                    Statement st1 = con.createStatement();
                                    ResultSet rt1 = st1.executeQuery("select * from actuary_reg where username='" + share_with + "'");
                                    if (rt1.next()) {
                                        String count = rt1.getString("count_");
                                        String uname = rt1.getString("username");
                            %>
                            <TR>
                                <td><%=rt.getString("owner")%></td>
                                <td><%=rt.getString("filename")%></td>
                                <td>******</td>
                                <td><%=uname%></td>
                                <td><%=rt1.getString("count_")%></td>
                                <%
                                    if (count.equals("0")) {
                                %>
                                <td>Active</td>
                                <%
                                } else {
                                    Statement st2 = con.createStatement();
                                    st2.execute("delete from rights where username_='" + uname + "'");
                                    int i = st1.executeUpdate("update actuary_reg set activate='no' where username='" + uname + "'");
                                %>

                                <td>Deactive</td>
                                <%
                                    }
                                %>
                            </TR>
                            <%}
                                }%>
                        </table>
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

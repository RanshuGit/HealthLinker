
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
    </head>
    <script>
        function validation() {
            if (doucment.name.upload.value == 0) {
                alert('select upload rights.');
                return false;
            }
            if (doucment.name.download.value == 0) {
                alert('select upload rights.');
                return false;
            }
            if (doucment.name.update.value == 0) {
                alert('select upload rights.');
                return false;
            }
        }
    </script>
    <style>
        #id{
            width: 200px;
            height: 25px;
            background-color: #D3F2F7;
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
            <%
                String token = request.getQueryString();
                Connection con = Dbconnection.getConn();
                Statement st = con.createStatement();
                ResultSet rt = st.executeQuery("select * from rights where token_='" + token + "'");

                if (rt.next()) {
            %>
            <div id="site_content">

                <div id="content">
                    <fieldset style="position: relative;left: 200px;background-color: yellowgreen">
                        <h1  style="position: relative;left: 60px;">Give Rights to Activated User</h1>
                        <form action="rights1" name="name" method="get" onsubmit="return validation()" style="position: relative;left: 100px;">

                            TOKEN:<BR>
                            <input type="text" id="id" name="token" readonly="true" value="<%=rt.getString("token_")%>"/> <BR></BR>  
                            USERNAME:<BR>
                            <input type="text" id="id"name="uname" readonly="true" value="<%=rt.getString("username_")%>"/><BR></BR>   
                            <!--             MAIL ID:<BR>
                                         <input type="text" id="id"name="mail" readonly="true" value="<%=rt.getString("username_")%>"/><BR></BR>-->
                            <%}%>
                            VIEW:<BR>
                            <select id="id" name="upload">

                                <option value="yes">yes</option>
                                <option value="no">no</option>
                            </select><BR></BR>
                            DOWNLOAD:<BR>
                            <select id="id" name="download">
                                <option value="yes">yes</option>
                                <option value="no">no</option>
                            </select><BR></BR>
                            UPDATE:<BR>
                            <select id="id" name="update">
                                <option value="yes">yes</option>
                                <option value="no">no</option>
                            </select><BR></BR>
                            <input  type="submit" value="Submit" style="background-color: cadetblue;width: 200px;height: 25px;"/><br></br>
                        </form>
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

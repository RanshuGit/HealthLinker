<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="pack.Dbconnection"%>
<%@page import="java.sql.Connection"%>
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
    </head>
    <style>
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
                        <li ><a href="CraeteRecord.jsp">Create Health Records</a></li>
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
                    <div style="position: relative;left: 50px; width: 800px;">
                        <fieldset >
                            <center>
                                <h3 class="title"style="color: coral"> Health Record Details</h3>
                            </center>

                            <form action="#" name="health" style="position: relative;left: 50px;" method="get" onsubmit="return validation()"> 
                                <%
                                    String id = request.getParameter("id");
                                    Connection con = Dbconnection.getConn();
                                    Statement st = con.createStatement();
                                    String sql = "Select * from patient_record where email='" + id + "'";
                                    ResultSet rs = st.executeQuery(sql);
                                    if (rs.next()) {

                                %>
                                <h3> <u>Patient Details Shared With  </u> </h3>
                                <table>
                                    <tr>
                                        <td>Shared With : </td>
                                        <td><%=rs.getString("share_with")%></td>
                                    <tr>
                                </table>
                                <h3> <u>Patient General Information </u> </h3>
                                <table>
                                    <tr>
                                        <td>Patient Name : </td>
                                        <td><%=rs.getString("fname")%> <%=rs.getString("lname")%></td>
                                    </tr>
                                    <tr>
                                        <td>E-Mail Id :</td> 
                                        <td><%=rs.getString("email")%></td>
                                    </tr>
                                    <tr>
                                        <td>Gender : </td>
                                        <td><%=rs.getString("gender")%></td>
                                    </tr>
                                    <tr>
                                        <td>Home Address :</td>
                                        <td><%=rs.getString("address")%></td> 
                                    </tr>
                                    <tr>
                                        <td>City : </td>
                                        <td><%=rs.getString("city")%></td>
                                    <tr>
                                        <td>State :</td> 
                                        <td><%=rs.getString("state")%></td>
                                    </tr>
                                    <tr>
                                        <td>Zip :</td> 
                                        <td><%=rs.getString("zip")%></td>
                                    </tr>
                                    <tr>
                                        <td>Contact No : </td>
                                        <td><%=rs.getString("contact")%></td>
                                    </tr>
                                    <tr>
                                        <td>Date-Of-Birth : </td>
                                        <td><%=rs.getString("dob")%></td>
                                    </tr>
                                </table>
                                <hr style="width: 700px;">
                                <h3> <u>Patient Health Information </u> </h3>
                                <table>
                                    <tr> 
                                        <td>Height (Inches) :</td>
                                        <td><%=rs.getString("height")%><td>
                                    </tr>
                                    <tr>
                                        <td>Weight (Kg's) : </td>
                                        <td><%=rs.getString("weight")%></td>
                                    </tr>
                                    <tr>
                                        <td>Body Mass Index : </td>
                                        <td><%=rs.getString("bmi")%></td>
                                    </tr>
                                    <tr>
                                        <td>Body Temperature (degree C):</td>
                                        <td><%=rs.getString("temp")%></td>
                                    </tr>
                                    <tr>
                                        <td>Blood Group : </td>
                                        <td><%=rs.getString("bg")%></td>
                                    </tr>
                                    <tr>
                                        <td>Blood Pressure(Range) :</td> 
                                        <td><%=rs.getString("bp")%></td>
                                    </tr>
                                    <tr>
                                        <td> Pulse Rate(per minute) : </td>
                                        <td><%=rs.getString("prate")%></td>
                                    </tr>
                                    <tr>
                                        <td>Respiratory Rate(Breaths par minute) : </td>
                                        <td><%=rs.getString("rrate")%></td>
                                </table>
                                <%}%>
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

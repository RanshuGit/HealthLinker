<%@page import="pack.MailUtil"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="pack.Dbconnection"%>
<%@page import="java.sql.ResultSet"%>
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
        <div id="main">
            <header>
                <div id="logo">
                    <div id="logo_text">
                        <pre> <h1><a href="index.html">Personal Health Records </a></h1>
          <h2 style="font-size: 22px">for Secure Authorized Record Sharing</h2>
                        </pre>
                    </div>
                </div>
                <nav>
                    <ul class="sf-menu" id="nav">
                        <li ><a href="aview.jsp">View</a></li>
                        <li ><a href="aupdate.jsp">Update</a></li>
                        <li><a href="adownload.jsp">Download</a></li>
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

                            <form action="prescription.jsp" name="health" style="position: relative;left: 50px;" method="get" onsubmit="return validation()"> 

                                <%
                                    HttpSession user = request.getSession();
                                    String uname = user.getAttribute("username").toString();
                                    String secret = request.getParameter("token").toString();
                                    String id1 = request.getParameter("id1");

                                    Connection con = Dbconnection.getConn();
//                                   Statement st2 = con.createStatement();
//                                    String sql1 = "Select * from sharekey where share_with='" + uname + "' and sharekey='" + secret + "'";
//                                    ResultSet rt2 = st2.executeQuery(sql1);
//                                    if (rt2.next()) {
//                                        Statement st1 = con.createStatement();
//                                        String str = "select * from rights where username_='" + uname + "'";
//                                        ResultSet rt1 = st1.executeQuery(str);
//                                       if (rt1.next()) {
//                                            String up = rt1.getString("view_");
//                                            if (up.equalsIgnoreCase("yes")) {

                                    Statement st = con.createStatement();
                                    String sql = "Select * from patient_record where filename='" + id1 + "'";
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
                                </table><br>
                                <%
                                    }
                                    Statement st1 = con.createStatement();
                                    String sql1 = "Select * from actuary_reg where username='" + uname + "'";
                                    ResultSet rs1 = st1.executeQuery(sql1);
                                    if (rs1.next()) {
                                        String designation = rs1.getString("designation");

                                        if (designation.equals("Doctor")) {

                                %>
                                <center>
                                    <input type="submit" value="Prescribe" name="submit" style="width: 200px; height: 50px; background: blue; font-size: 25px;">
                                </center>
                                <%                                        }
                                    }

                                %>
                                <input type="hidden" name="id1" value="<%=id1%>">
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

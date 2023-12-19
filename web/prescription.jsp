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
                
               function validation() {
                var pres = document.getElementById("text").value;
                
                if (pres === "") {
                    alert("Enter Prescription");
                    document.getElementById("text").focus();
                    return false;
                }
                return true;
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
                        <center>
                            <h3 class="title"style="color: coral; font-size: 20px"> Prescription </h3>
                        </center>

                        <fieldset >
                            <form action="Prescribe" name="health" style="position: relative;left: 50px;" method="get" onsubmit="return validation()"> 

                                <%
                                    HttpSession user = request.getSession();
                                    String uname = user.getAttribute("username").toString();
                                    //String secret = request.getParameter("token").toString();
                                    String filename = request.getParameter("id1");

                                    Connection con = Dbconnection.getConn();
//                                   
                                    Statement st = con.createStatement();
                                    String sql = "Select * from patient_record where filename='"+ filename + "'";
                                    ResultSet rs = st.executeQuery(sql);


                                %>
                                <h3 style="font-size: 15px;">Give Prescription here to : <%=filename%> </h3>
                                <textarea id="text" name="text" style="width: 700px; height: 200px;"></textarea>
                                <center>
                                    <input type="submit" name="submit" value="Send" style="width: 100px; height: 50px; background: red; font-size: 15px;">
                                </center>
                                <input type="hidden" name="id1" value="<%=filename%>">
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

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
                        <form action="PredictionModule" method="post">
                            <table style="border-style: solid">
                                    <caption> <h3 style="color: coral">Prediction</h3></caption>
                                <tr>                                
                                    <td><h5 style="font-weight: bold;"> Itching</h5>
                               <select name="itching" id="cars">
                              <option value="0">No</option>
                              <option value="1">Yes</option>
  
                              </select>
                                    </td> 
                                    <td><h5 style="font-weight: bold;">Skin Rash</h5>
                               <select name="skinrash" id="cars">
                            <option value="0">No</option>
                              <option value="1">Yes</option>
                              </select>
                                 </td>
                                </tr>
                                <tr>                                
                                    <td><h5 style="font-weight: bold;">Nodal_Skin_Erruptions</h5>
                               <select name="nodalskin" id="cars">
                          <option value="0">No</option>
                              <option value="1">Yes</option>
                              </select>
                                    </td> 
                                    <td><h5 style="font-weight: bold;">Accidity</h5>
                               <select name="accidity" id="cars">
                             <option value="0">No</option>
                              <option value="1">Yes</option>
                              </select>
                                 </td>
                                </tr>
                                <tr>                                
                                    <td><h5 style="font-weight: bold;">Stomach Pain</h5>
                               <select name="stoamchpain" id="cars">
                              <option value="0">No</option>
                              <option value="1">Yes</option>
  
                              </select>
                                    </td> 
                                    <td><h5 style="font-weight: bold;">Ulcers</h5>
                               <select name="ulcers" id="cars">
                             <option value="0">No</option>
                              <option value="1">Yes</option>
  
                              </select>
                                 </td>
                                </tr>
                                <tr>                                
                                    <td><h5 style="font-weight: bold;">Vomitting</h5>
                               <select name="vomitting" id="cars">
                              <option value="0">No</option>
                              <option value="1">Yes</option>
  
                              </select>
                                    </td> 
                                    <td><h5 style="font-weight: bold;">Phlegm</h5>
                               <select name="phlegm" id="cars">
                              <option value="0">No</option>
                              <option value="1">Yes</option>  
                              </select>
                                 </td>
                                </tr>
                                <tr>                                
                                    <td><h5 style="font-weight: bold;">Irritation</h5>
                               <select name="irritation" id="cars">
                            <option value="0">No</option>
                              <option value="1">Yes</option>
  
                              </select>
                                    </td> 
                                    <td><h5 style="font-weight: bold;">Redness of Eyes</h5>
                               <select name="redness" id="cars">
                             <option value="0">No</option>
                              <option value="1">Yes</option>
  
                              </select>
                                 </td>
                                </tr>
                                <tr>                                
                                    <td><h5 style="font-weight: bold;">Sinus Pressure</h5>
                             <select name="sinus" id="cars">

                              <option value="0">No</option>
                              <option value="1">Yes</option>
  
                              </select>
                                    </td> 
                                    <td><h5 style="font-weight: bold;">Runny Nose</h5>
                               <select name="runny" id="cars">
                            <option value="0">No</option>
                              <option value="1">Yes</option>
  
                              </select>
                                 </td>
                                </tr>
                               
                            </table>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="submit" name="Ok" value="Submit">
                                   
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

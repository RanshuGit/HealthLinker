<%@page import="java.util.StringTokenizer"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pack.decryption"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.InputStream"%>
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


                if (confirm("Are Sure update this?")) {
                    return true;
                }
                else {
                    return false;
                }
            }
        </script>

        <style>
            h1{
                position: relative;
                left: 50%;
            }
            h2{
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
                background-color: burlywood;
            }
            input, select, textArea{
                width: 200px;
                height: 25px;
                background-color: #D5D5D5;
            }
            textArea{
                height: 50px;
            } 
        </style>
    </head>

    <body>
        <%
            HttpSession user = request.getSession();
            String uname = user.getAttribute("username").toString();
            // String name = user.getAttribute("name").toString();

            Connection con = Dbconnection.getConn();
            Statement st1 = con.createStatement();
            ResultSet rt1 = st1.executeQuery("select * from rights where username_='" + uname + "'");
            if (rt1.next()) {
                String up = rt1.getString("update_");
                if (up.equalsIgnoreCase("yes")) {
                } else {
                    response.sendRedirect("user_page1.jsp?no='yes'");
                }
            }

        %>
        <div id="main">
            <header>
                <div id="logo">
                    <div id="logo_text">
                        <!-- class="logo_colour", allows you to change the colour of the text -->
                        <pre> <h1><a href="index.html">Personal Health Records </a></h1>
          <h2 style="font-size: 22px">for Secure Authorized Record Sharing</h2>
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
                    <%                        //HttpSession user=request.getSession();
                        //String uname=user.getAttribute("username").toString();   
                        //String name=user.getAttribute("name").toString();  
                        String id = request.getQueryString();
                        String fname = null;

                        Statement st = con.createStatement();
                        ResultSet rt = st.executeQuery("select * from files where idfiles='" + id + "'");
                        StringBuffer sb = new StringBuffer();
                        if (rt.next()) {
                            String fkey = rt.getString("file_key");
                            fname = rt.getString("filename");
                            InputStream is = rt.getAsciiStream("content");
                            BufferedReader br = new BufferedReader(new InputStreamReader(is));
                            String temp = null;
                            while ((temp = br.readLine()) != null) {
                                sb.append(temp);

                            }
                            System.out.println(sb.toString());
                            String content = new decryption().decrypt(sb.toString(), fkey);
                            String ss[] = content.split("\n");

                            String s1 = ss[0].toString();
                            String a[] = s1.split(":");
                            String f1 = a[1].toString();

                            String s2 = ss[1].toString();
                            String b[] = s2.split(":");
                            String f2 = b[1].toString();

                            String s3 = ss[2].toString();
                            String c[] = s3.split(":");
                            String f3 = c[1].toString();

                            String s4 = ss[3].toString();
                            String d[] = s4.split(":");
                            String f4 = d[1].toString();

                            String s5 = ss[4].toString();
                            String e[] = s5.split(":");
                            String f5 = e[1].toString();

                            String s6 = ss[5].toString();
                            String f[] = s6.split(":");
                            String f6 = f[1].toString();

                            String s7 = ss[6].toString();
                            String g[] = s7.split(":");
                            String f7 = g[1].toString();

                            String s8 = ss[7].toString();
                            String h[] = s8.split(":");
                            String f8 = h[1].toString();

                            String s9 = ss[8].toString();
                            String i[] = s9.split(":");
                            String f9 = i[1].toString();

                            String s10 = ss[9].toString();
                            String j[] = s10.split(":");
                            String f10 = j[1].toString();

                            String s11 = ss[10].toString();
                            String k[] = s11.split(":");
                            String f11 = k[1].toString();

                            String s12 = ss[11].toString();
                            String l[] = s12.split(":");
                            String f12 = l[1].toString();

                            String s13 = ss[12].toString();
                            String m[] = s13.split(":");
                            String f13 = m[1].toString();

                            String s14 = ss[13].toString();
                            String n[] = s14.split(":");
                            String f14 = n[1].toString();

                            String s15 = ss[14].toString();
                            String o[] = s15.split(":");
                            String f15 = o[1].toString();

                            String s16 = ss[15].toString();
                            String p[] = s16.split(":");
                            String f16 = p[1].toString();

                            String s17 = ss[16].toString();
                            String q[] = s17.split(":");
                            String f17 = q[1].toString();

                            String s18 = ss[17].toString();
                            String r[] = s18.split(":");
                            String f18 = r[1].toString();

                            //String s19 = ss[18].toString();
                            // String s[] = s19.split(":");
                            //String f19 = s[1].toString();

                    %>
                    <form action="updating?<%=id + "," + fname%>" name="name" method="post" onsubmit="return validation()">
                        <center><h1>File Name: <font style="color: tomato"> <%=fname%></font></h1></center>
                        <h3> <u>Patient Details Shared With  </u> </h3>
                        <table>
                            <tr>
                                <td>Shared With : </td>
                                <td> <input type="text" id="share" name="share" value="<%=f1%>"></td>
                            </tr>
                        </table>
                        <h3> <u>Patient General Information </u> </h3>
                        <table>
                            <tr>
                                <td>Patient Name : </td>
                                <td><input type="text" name="name" value="<%=f2%>" readonly=""></td>
                            </tr>
                            <tr>
                                <td>E-Mail Id :</td> 
                                <td><input type="email" id="mail" name="mail" value="<%=f3%>"></td>
                            </tr>
                            <tr>
                                <td>Gender : </td>
                                <td><input type="text" id="gender" name="gender" value="<%=f4%>" readonly=""/></td>
                            </tr>
                            <tr>
                                <td>Home Address :</td>
                                <td><input type="text" id="address" name="address" value="<%=f5%>"></td> 
                            </tr>
                            <tr>
                                <td>City : </td>
                                <td><input type="text" id="city" name="city" value="<%=f6%>"></td>
                            </tr>
                            <tr>
                                <td>State :</td> 
                                <td><input type="text" id="state" name="state" value="<%=f7%>"></td>
                            </tr>
                            <tr>
                                <td>Zip :</td> 
                                <td><input type="text" id="zip" name="zip" value="<%=f8%>" maxlength="6"></td>
                            </tr>
                            <tr>
                                <td>Contact No : </td>
                                <td><input type="text" id="mobile" name="mobile" value="<%=f9%>" maxlength="10"></td>
                            </tr>
                            <tr>
                                <td>Date-Of-Birth : </td>
                                <td><input type="text" id="birth" name="birth" value="<%=f10%>"></td>
                            </tr>
                        </table>
                        <hr style="width: 700px;">
                        <h3> <u>Patient Health Information </u> </h3>
                        <table>
                            <tr> 
                                <td>Height (Inches) :</td>
                                <td><input type="text" id="height" name="height" value="<%=f11%>"><td>
                            </tr>
                            <tr>
                                <td>Weight (Kg's) : </td>
                                <td><input type="text" id="weight" name="weight" value="<%=f12%>"></td>
                            </tr>
                            <tr>
                                <td>Body Mass Index : </td>
                                <td>
                                    <select id="bmi" name="bmi">
                                        <option value="<%=f13%>"> <%=f13%> </option>
                                        <option value="below 18.5(Underweight)"> below 18.5(Underweight)</option>
                                        <option value="18.5 to 24.9(Healthy)">18.5 to 24.9(Healthy)</option>
                                        <option value="25 to 29.9(Overweight)">25 to 29.9(Overweight)</option>
                                        <option value="30 or higher(Obese)">30 or higher(Obese)</option>
                                    </select>
                                </td>
                                </td>
                            </tr>
                            <tr>
                                <td>Body Temperature (degree C):</td>
                                <td><input type="text" id="temp" name="temp" value="<%=f14%>"></td>
                            </tr>
                            <tr>
                                <td>Blood Group : </td>
                                <td><input type="text" id="bgroup" name="bgroup" value="<%=f15%>" readonly=""/></td>
                            </tr>
                            <tr>
                                <td>Blood Pressure(Range) :</td> 
                                <td>
                                    <select id="bpressure" name="bpressure">
                                        <option value="<%=f16%>"> <%=f16%></option>
                                        <option value="0-60(Very Low)">0-60(Very Low)</option>
                                        <option value="60-90(Low)">60-90(Low)</option>
                                        <option value="90-120(Ideal)">90-120(Ideal)</option>
                                        <option value="120-140(Pre-High)">120-140(Pre-High)</option>
                                        <option value="140-190(High)">140-190(High)</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td> Pulse Rate(per minute) : </td>
                                <td><input type="text" id="prate" name="prate" value="<%=f17%>"></td>
                            </tr>
                            <tr>
                                <td>Respiratory Rate(Breaths par minute) : </td>
                                <td><input type="text" id="Rrate" name="Rrate" value="<%=f18%>"></td>
                        </table>

                        <%-- <textarea name="content" style="width: 400px;height: 400px;position: relative;left: 250px;"><%=content%></textarea> --%>
                        <%
                            }
                        %>
                        <pre>
                                                                        <input type="submit" id="but"value="Update"/>
                        </pre>
                    </form>
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

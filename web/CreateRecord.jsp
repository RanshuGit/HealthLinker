<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="pack.Dbconnection"%>
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
        <script>
            function validation() {
                var share = document.health.share.value;
                var fname = document.health.fname.value;
                var lname = document.health.lname.value;
                var mail = document.health.mail.value;
                var gender = document.health.gender.value;
                var add = document.health.address.value;
                var city = document.health.city.value;
                var state = document.health.state.value;
                var zip = document.health.zip.value;
                var ph = document.health.mobile.value;
                var birth = document.health.birth.value;
                var height = document.health.height.value;
                var weight = document.health.weight.value;
                var bmi = document.health.bmi.value;
                var bg = document.health.bgroup.value;
                var btemp = document.health.temp.value;
                var bp = document.health.bpressure.value;
                var pulse = document.health.prate.value;
                var resp = document.health.Rrate.value;

                if (share === "Select") {
                    alert("Plese select option to share record");
                    document.health.share.focus();
                    return false;
                }
                if (fname === "") {
                    alert("Enter Patient's First_Name");
                    document.health.fname.focus();
                    return false;
                }
                if (lname === "") {
                    alert("Enter Patient's Last_Name");
                    document.health.lname.focus();
                    return false;
                }
                if (mail === "") {
                    alert("Enter Mail-Id");
                    document.health.mail.focus();
                    return false;
                }
                var email = document.health.mail.value;
                var validemail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$/;
                if (!(validemail.test(email))) {
                    alert("Invalid E-mail Address");
                    document.health.mail.focus();
                    return false;
                }
                if ((health.gender[0].checked === false) && (health.gender[1].checked === false))
                {
                    alert("Please choose your Gender: Male or Female");
                    return false;
                }
                if (add === "")
                {
                    alert("Please Enter Your Address Here");
                    document.health.address.focus();
                    return false;
                }
                if (city === "")
                {
                    alert("Please Enter City Name");
                    document.health.city.focus();
                    return false;
                }
                if (state === "")
                {
                    alert("Please Enter State Name");
                    document.health.state.focus();
                    return false;
                }
                if (zip === "")
                {
                    alert("Please Enter Zip Code");
                    document.health.zip.focus();
                    return false;
                }
                if (ph === 0) {
                    alert("Enter Mobile No");
                    document.health.mobile.focus();
                    return false;
                }
                if (isNaN(ph)) {
                    alert("Invalid Mobile No");
                    document.health.mobile.focus();
                    return  false;
                }
                var y = document.health.mobile.value;
                if (isNaN(y) || y.indexOf(" ") !== -1)
                {
                    alert("Invalid Mobile No");
                    document.health.mobile.focus();
                    return false;
                }
                if (y.length > 10 || y.length < 10)
                {
                    alert("Mobile No Should be 10 Digit");
                    document.health.mobile.focus();
                    return false;
                }
                if (!(y.charAt(0) === "9" || y.charAt(0) === "8" || y.charAt(0) === "7"))
                {
                    alert("Mobile No should Start With 9 ,8 or 7 ");
                    document.health.mobile.focus();
                    return false;
                }
                if (birth === "")
                {
                    alert("Please Select Date-Of-Birth");
                    document.health.birth.focus();
                    return false;
                }
                if (height === "")
                {
                    alert("Please Enter Height");
                    document.health.height.focus();
                    return false;
                }
                if (weight === "")
                {
                    alert("Please Enter Weight");
                    document.health.weight.focus();
                    return false;
                }
                if (bmi.value === "" || bmi.value === "Select")
                {
                    alert("Please Select an Body Mass Index");
                    document.health.bmi.focus();
                    return false;
                }
                if (btemp === "")
                {
                    alert("Please Enter Body Temperature");
                    document.health.temp.focus();
                    return false;
                }
                if (bg === "")
                {
                    alert("Please Enter Blood Group");
                    document.health.bgroup.focus();
                    return false;
                }
                if (bpressure.value === "" || bpressure.value === "select")
                {
                    alert("Please Select an Blood Pressure Range");
                    document.health.bpressure.focus();
                    return false;
                }
                if (pulse === "")
                {
                    alert("Please Enter Pulse Rate");
                    document.health.prate.focus();
                    return false;
                }
                if (resp === "")
                {
                    alert("Please Enter Respiratory Rate");
                    document.health.Rrate.focus();
                    return false;
                }
                return true;
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
            input, select, textArea{
                width: 200px;
                height: 25px;
                background-color: #D5D5D5;
            }
            #but{
                width: 100px;
                height: 50px;
                position: relative;
                left: 200px;
            }
            textArea{
                height: 50px;
            } 
        </style>
    </head>

    <body>
        <%
            if (request.getParameter("username") != null) {
                out.println("<script>alert('Username already used')</script>");
            }
            if (request.getParameter("mail") != null) {
                out.println("<script>alert('Mailid already used')</script>");
            }
            if (request.getParameter("phn") != null) {
                out.println("<script>alert('Mobile No. already used')</script>");
            }
        %>

        <%
            HttpSession user = request.getSession();
            String uname = user.getAttribute("username").toString();
            String name = user.getAttribute("name").toString();
        %>
        <div id="main">
            <header>
                <div id="logo">
                    <div id="logo_text">
                        <!-- class="logo_colour", allows you to change the colour of the text -->
                        <pre><h1><a href="index.html">Personal Health Records </a></h1>
          <h2 style="font-size: 22px">for Secure Authorized Record Sharing</h2></pre>
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
                    <div style="position: relative;left: 50px; width: 800px;">
                        <fieldset >
                            <center>
                                <h3 class="title"style="color: coral">Create New Health Record</h3>
                            </center>

                            <form action="HealthRecord" name="health" style="position: relative;left: 50px;" method="get" onsubmit="return validation()"> 
                                <h3> <u>Patient Details Shared With  </u> </h3>
                                <table>
                                    <tr>
                                        <td width="100px">Shared With : </td>
                                        <td width="200px"><input type="checkbox" name="share" value="Doctor">Doctor</td>
                                        <td width="200px"><input type="checkbox" name="share" value="Relatives">Relatives</td>
                                        <td width="200px"><input type="checkbox" name="share" value="Actuary">Actuary</td>
                                    <tr>
                                </table>
                                <h3> <u>Patient General Information </u> </h3>

                                <table>
                                    <tr>
                                        <td>Patient Name : </td>
                                        <td><input type="text" id="fname" name="fname" placeholder="First Name"></td>
                                        <td><input type="text" name="lname" placeholder="Last Name"></td>
                                    </tr>
                                    <tr>
                                        <td>E-Mail Id :</td> 
                                        <td><input type="email" id="mail" name="mail" placeholder="Enter your email"></td>
                                    </tr>
                                    <tr>
                                        <td>Gender : </td>
                                        <td>Male<input type="radio" id="gender" name="gender" value="male" checked> </td>
                                        <td>Female <input type="radio" id="gender" name="gender" value="female"></td> 
                                    </tr>
                                    <tr>
                                        <td>Home Address :</td>
                                        <td><textarea id="address" name="address" placeholder="Enter Address"></textarea></td> 
                                    </tr>
                                    <tr>
                                        <td>City : </td>
                                        <td><input type="text" id="city" name="city" placeholder="Enter City"></td>
                                    <tr>
                                        <td>State :</td> 
                                        <td><input type="text" id="state" name="state" placeholder="Enter State"></td>
                                    </tr>
                                    <tr>
                                        <td>Zip :</td> 
                                        <td><input type="text" id="zip" name="zip" placeholder="Zip Code" maxlength="6"></td>
                                    </tr>
                                    <tr>
                                        <td>Contact No : </td>
                                        <td><input type="text" id="mobile" name="mobile" placeholder="Enter your mobile no" maxlength="10"></td>
                                    </tr>
                                    <tr>
                                        <td>Date-Of-Birth : </td>
                                        <td><input type="date" id="birth" name="birth"></td>
                                    </tr>
                                </table>
                                <hr style="width: 700px;">
                                <h3> <u>Patient Health Information </u> </h3>
                                <table>
                                    <tr> 
                                        <td>Height (Inches) :</td>
                                        <td><input type="text" id="height" name="height" placeholder="Ex : 5.1"><td>
                                    </tr>
                                    <tr>
                                        <td>Weight (Kg's) : </td>
                                        <td><input type="text" id="weight" name="weight" placeholder="Ex : 50"></td>
                                    </tr>
                                    <tr>
                                        <td>Body Mass Index : </td>
                                        <td><select id="bmi" name="bmi">
                                                <option value="Select"> Select </option>
                                                <option value="below 18.5(Underweight)"> below 18.5(Underweight)</option>
                                                <option value="18.5 to 24.9(Healthy)">18.5 to 24.9(Healthy)</option>
                                                <option value="25 to 29.9(Overweight)">25 to 29.9(Overweight)</option>
                                                <option value="30 or higher(Obese)">30 or higher(Obese)</option>
                                            </select></td>
                                    </tr>
                                    <tr>
                                        <td>Body Temperature (degree C):</td>
                                        <%
                                            Connection con = Dbconnection.getConn();
                                            Statement st = con.createStatement();
                                            String temp="",hb="";
                                            String str="SELECT * FROM tbl_sensor ";
                                            ResultSet rs=st.executeQuery(str);
                                            if(rs.next()){
                                                temp=rs.getString("temp");
                                                hb=rs.getString("hb");
                                            }

                                        %>
                                        <td><input type="text" id="temp" name="temp" value="<%=temp%>"></td>
                                           
                                    </tr>
                                    <tr>
                                        <td>Blood Group : </td>
                                        <td><input type="text" id="bgroup" name="bgroup" placeholder="Ex : AB+ve"></td>
                                    </tr>
                                    <tr>
                                        <td>Blood Pressure(Range) :</td> 
                                        <td><select id="bpressure" name="bpressure">
                                                <option value="select"> Select </option>
                                                <option value="0-60(Very Low)">0-60(Very Low)</option>
                                                <option value="60-90(Low)">60-90(Low)</option>
                                                <option value="90-120(Ideal)">90-120(Ideal)</option>
                                                <option value="120-140(Pre-High)">120-140(Pre-High)</option>
                                                <option value="140-190(High)">140-190(High)</option>
                                            </select></td>
                                    </tr>
                                    <tr>
                                        <td> Pulse Rate(per minute) : </td>
                                        <td><input type="text" id="prate" name="prate" value="<%=hb%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Respiratory Rate(Breaths par minute) : </td>
                                        <td><input type="text" id="Rrate" name="Rrate" placeholder="Ex : 72"></td>
                                </table>
                                <input type="hidden" name="user" id="user" value="<%=uname%>"
                                       <center><br></br>
                                    &nbsp;<input type="submit" id="but" value="Create Record" style="background-color: yellowgreen;color: #ffffff"/>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   <input type="reset"id="but" value="Reset" style="background-color: #AA3300;color: #ffffff"></input><br></br>
                                </center>
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
                                $(document).ready(function () {
                                    $('ul.sf-menu').sooperfish();
                                });
        </script>
    </body>
</html>

<!DOCTYPE HTML>
<html>

    <head>
        <title>PHR Sharing On Cloud</title>
        <meta name="description" content="website description" />
        <meta name="keywords" content="website keywords, website keywords" />
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <link rel="shortcut icon" type="image/x-icon" href="images/brainstorming_alternative.png"/>
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <!-- modernizr enables HTML5 elements and feature detects -->
        <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
    </head>
    <style>
        form,h1{
            position: relative;
            left: 50%;
        }
        form,h2{
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
                        <li class="selected"><a href="index.html">Home</a></li>
                        <li><a href="#">Admin</a>
                            <ul>
                                <li><a href="p_cloud1.jsp">Login</a></li>
                            </ul>
                        </li> 
                        <li><a href="#">PHR Owner</a>
                            <ul>
                                <li><a href="p_cloud.jsp">Login</a></li>
                                <li><a href="pregister.jsp">Register</a></li>
                            </ul>
                        </li>  
                        <li><a href="#">Hospital</a>
                            <ul>
                                <li><a href="user.jsp">Login</a></li>
                                <li><a href="register.jsp">Register</a></li>
                            </ul>
                        </li>
                        <li><a href="ContactUs.jsp">About Us</a></li>
                    </ul>
                </nav>
            </header>
            <div id="site_content">
                <div id="sidebar_container">
                    <div class="gallery">
                        <ul class="images">
                            <li class="show"><img width="450" height="500" src="images/phr.png" alt="photo_one" /></li>
                            <li><img width="450" height="450" src="images/phr1.jpg" alt="photo_two" /></li>
                            <li><img width="450" height="450" src="images/phr2.jpg" alt="photo_three" /></li>
                            <li><img width="450" height="450" src="images/c4.jpg" alt="photo_four" /></li>
                            <li><img width="450" height="450" src="images/c5.jpg" alt="photo_five" /></li>
                        </ul>
                    </div>
                </div>
                <div id="content">
                    <!-- <h1>Abstract</h1>-->
                    <p style="text-align: justify">Personal health record (PHR) is an emerging patient-centric model of health information exchange, which is often
                        outsourced to be stored at a third party, such as cloud providers. However, there have been wide privacy concerns as personal health
                        information could be exposed to those third party servers and to unauthorized parties. To assure the patients? control over access to
                        their own PHRs, it is a promising method to encrypt the PHRs before outsourcing. Yet, issues such as risks of privacy exposure,
                        scalability in key management, flexible access, and efficient user revocation, have remained the most important challenges toward
                        achieving fine-grained, cryptographically enforced data access control. In this paper, we propose a novel patient-centric framework
                        and a suite of mechanisms for data access control to PHRs stored in semitrusted servers. To achieve fine-grained and scalable data
                        access control for PHRs, we leverage attribute-based encryption (ABE) techniques to encrypt each patient?s PHR file. Different from
                        previous works in secure data outsourcing, we focus on the multiple data owner scenario, and divide the users in the PHR system into
                        multiple security domains that greatly reduces the key management complexity for owners and users. A high degree of patient privacy
                        is guaranteed simultaneously by exploiting multiauthority ABE.</p>
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

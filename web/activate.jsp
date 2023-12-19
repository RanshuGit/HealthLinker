<%@page import="java.security.SecureRandom"%>
<%@page import="pack.MailUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="pack.Dbconnection"%>
<%@page import="java.util.Random"%>
<%
    try {
        String uname = request.getQueryString();
        Random r = new Random();
        int n = r.nextInt();
        String key = n + "";
        
        Connection con = Dbconnection.getConn();
        Statement st1 = con.createStatement();
                     
        Statement st = con.createStatement();
        st.executeUpdate("update user_reg set token_='" + key + "',activate='yes' where username='" + uname + "' ");
        int i = st.executeUpdate("insert into rights(token_, username_, view_, update_, download_)values('" + key + "','" + uname + "','no','no','no')");
        if (i != 0) {
            //out.println("success..");
            response.sendRedirect("my_rights.jsp?" + key);
        } else {
            out.println("error while entering data");
        }
    } catch (Exception e) {
        out.println(e);
    }
%>
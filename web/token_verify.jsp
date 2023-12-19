<%@page import="pack.MailUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="pack.Dbconnection"%>

<%
    HttpSession user = request.getSession();
    String uname = user.getAttribute("username").toString();
    String token = request.getParameter("token");

    String fileid = user.getAttribute("fileid").toString();
    Connection con = Dbconnection.getConn();
    Statement st = con.createStatement();
    Statement st1 = con.createStatement();

    String traitor = "";
    Statement st2 = con.createStatement();
    String sql1 = "Select * from sharekey where sharekey='" + token + "'";
    ResultSet rt2 = st2.executeQuery(sql1);
    if (rt2.next()) {
        
        traitor = rt2.getString("share_with");
        if (uname.equals(traitor)) {
        
        String str = "select * from rights where username_='" + uname + "'";
        ResultSet rt1 = st1.executeQuery(str);
        if (rt1.next()) {
            String up = rt1.getString("download_");
            if (up.equalsIgnoreCase("yes")) {

                //ArrayList a = new ArrayList();
                ResultSet rt = st.executeQuery("select * from files  where idfiles='" + fileid + "'");
                if (rt.next()) {

                    // response.sendRedirect("user_page1.jsp?login='true'");
                    response.sendRedirect("download?" + fileid);

                } else {
                    response.sendRedirect("adownload.jsp?token='failed'");
                }
            } else {

                out.println("<script>");
                out.println("alert('You are not Permitted to Download this file!')");
                out.println("location='adownload.jsp'");
                out.println("</script>");
                //response.sendRedirect("user_page1.jsp?no='yes'");
            }
        }

    } else {

        Statement st3 = con.createStatement();

        st3.execute("delete from rights where username_='" + traitor + "'");
        int i = st3.executeUpdate("update actuary_reg set activate='no', count_='1' where username='" + traitor + "'");

        if (i != 0) {
            out.println("<script>");
            out.println("alert('Traitor Detected! You are blocked because your key is tried to access by other person!')");
            out.println("location='index.html'");
            out.println("</script>");

        } else {
            out.println("error while Processing");
        }
    }
    }

%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pack.Dbconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
//     datalib.DataLib.main(null);
    HttpSession user = request.getSession();
    String uname = user.getAttribute("username").toString();
    String secret = request.getParameter("token").toString();
    String id1 = request.getParameter("id1");

    Connection con = Dbconnection.getConn();
    Statement st2 = con.createStatement();
    String traitor = "";
    String sql1 = "Select * from sharekey where sharekey='" + secret + "'";

    ResultSet rt2 = st2.executeQuery(sql1);
    if (rt2.next()) {

        traitor = rt2.getString("share_with");
        if (uname.equals(traitor)) {
            Statement st1 = con.createStatement();
            String str = "select * from rights where username_='" + uname + "'";
            ResultSet rt1 = st1.executeQuery(str);
            if (rt1.next()) {
                String up = rt1.getString("view_");
                if (up.equalsIgnoreCase("yes")) {

                    response.sendRedirect("a_view.jsp?token=" + secret + "&id1=" + id1 + "");
                } else {

                    out.println("<script>");
                    out.println("alert('You are not Permitted to View this file!')");
                    out.println("location='aview.jsp'");
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
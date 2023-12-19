<%@page import="java.security.SecureRandom"%>
<%@page import="pack.MailUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="pack.Dbconnection"%>
<%@page import="java.util.Random"%>
<%
    try {
        HttpSession user = request.getSession();
        String uname = user.getAttribute("username").toString();
        String token = request.getParameter("token");

        Connection con = Dbconnection.getConn();
        Statement st = con.createStatement();

        String sql = "select * from actuary_reg where username='" + uname + "'";
        ResultSet rs = st.executeQuery(sql);
        if (rs.next()) {
            String token1 = rs.getString("token_");
            if(token.equals(token1)){
                sql="UPDATE actuary_reg SET status='1' WHERE username='"+uname+"' ";
                 int i=st.executeUpdate(sql);
                 response.sendRedirect("actuary_page.jsp");
            }else{
               out.println("<script>");
                out.println("alert('Wrong Token !')");
                out.println("location='token_check1.jsp'");
                out.println("</script>");
            }
           
        } else {
            out.println("User does not exist !");
        }
    } catch (Exception e) {
        out.println(e);
    }
%>
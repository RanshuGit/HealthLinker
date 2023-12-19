<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="pack.Dbconnection"%>
<%
 try {
            String uname=request.getQueryString();
            
           Connection con= Dbconnection.getConn();          
           Statement st1=con.createStatement();
           
              st1.execute("delete from rights where username_='"+uname+"'");
           int i=st1.executeUpdate("update actuary_reg set activate='no' where username='"+uname+"'");
           
           
           if(i!=0){
                int i1=st1.executeUpdate("update actuary_reg set status='0' where username='"+uname+"'");
               response.sendRedirect("acturies.jsp");
           }
           else{
               out.println("error while updating");
           }
        }
        catch(Exception e){
            out.println(e);
        }
%>
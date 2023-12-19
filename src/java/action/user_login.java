/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pack.Dbconnection;

/**
 *
 * @author IBN5
 */
public class user_login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String uname = request.getParameter("username");
            String pass = request.getParameter("password");

            Connection con = Dbconnection.getConn();
            Statement st = con.createStatement();
            ResultSet rt = st.executeQuery("select * from actuary_reg where username='" + uname + "'");
            if (rt.next()) {
                String p = rt.getString("password");
                String activate = rt.getString("activate");
                String name = rt.getString("designation");
                String mail = rt.getString("mail");
                String status=rt.getString("status");
                if (pass.equalsIgnoreCase(p)) {
                    if (activate.equalsIgnoreCase("yes")) {
                        HttpSession user = request.getSession(true);
                        user.setAttribute("designation", name);
                        user.setAttribute("username", uname);
                        user.setAttribute("mail", mail);
                        if(status.equals("0")){
                            response.sendRedirect("token_check1.jsp");
                        }else{
                            response.sendRedirect("actuary_page.jsp");
                        }
                        
                        //response.sendRedirect("actuary_page.jsp");
                    } else {
                        out.println("<script>");
                        out.println("alert('Your not Yet Activeted!')");
                        out.println("location='user.jsp'");
                        out.println("</script>");

                    }
                } else {
                    out.println("<script>");
                    out.println("alert('incorrect password!')");
                    out.println("location='user.jsp'");
                    out.println("</script>");

                }
            } else {
                out.println("<script>");
                out.println("alert('Incorrect username')");
                out.println("location='user.jsp'");
                out.println("</script>");

            }
        } catch (Exception e) {
            out.println(e);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}

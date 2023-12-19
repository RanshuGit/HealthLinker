
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
import pack.Dbconnection;

/**
 *
 * @author IBN5
 */
public class registration extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
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
            String name = request.getParameter("upload").toString();
            String uname = request.getParameter("username");
            String pass = request.getParameter("password");
            String mail = request.getParameter("mail");
            String ph = request.getParameter("mobile");
            Connection con = Dbconnection.getConn();
            Statement st = con.createStatement();
            Statement st1 = con.createStatement();
            Statement st2 = con.createStatement();
            ResultSet rs = st1.executeQuery("select * from actuary_reg where username='" + uname + "'");
            if (rs.next()) {
                response.sendRedirect("register.jsp?username='true'");
            }
            ResultSet rs1 = st2.executeQuery("select * from actuary_reg where mail='" + mail + "'");
            if (rs1.next()) {
                response.sendRedirect("register.jsp?mail='true'");
            }
            ResultSet rs2 = st.executeQuery("select * from actuary_reg where phoneno='" + ph + "'");
            if (rs2.next()) {
                response.sendRedirect("register.jsp?phn='true'");
            }
            int i = st.executeUpdate("insert into actuary_reg (username,designation,password,mail,phoneno,activate,count_,status)values('" + uname + "','" + name + "','" + pass + "','" + mail + "','" + ph + "','no','0','0')");
            con.close();
            if (i != 0) {
                response.sendRedirect("user.jsp?status='registered'");
            }
        } catch (Exception e) {
            out.println(e);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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

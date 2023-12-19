/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pack.Dbconnection;

/**
 *
 * @author Jyoti
 */
public class DeleteRecord1 extends HttpServlet {

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
            String email = request.getParameter("id");
            Connection con = Dbconnection.getConn();
            Statement st = con.createStatement();
            ServletContext sc = this.getServletContext();
            String sg1 = sc.getRealPath("/");
            String fname1 = sg1.substring(0, sg1.indexOf("build"));
            String filePath = fname1 + "web/images/TextFiles/";
            String sql = "select * from patient_record where email = '" + email + "'";
            ResultSet rs = st.executeQuery(sql);

            if (rs.next()) {
                String filename = rs.getString("filename");
                int i = st.executeUpdate("delete from patient_record where email = '" + email + "'");
                int j = st.executeUpdate("delete from files where filename = '" + filename + "'");

                File file = new File(filePath, filename);

                if (file.delete()) {
                    System.out.println("File deleted successfully");
                } else {
                    System.out.println("Failed to delete the file");
                }

                out.println("<script>");
                out.println("alert('Patient Record Deleted Successfully !')");
                out.println("location='View.jsp'");
                out.println("</script>");
            } else {
                out.println("<script>");
                out.println("alert('Patient Record does not Exist!')");
                out.println("location='View.jsp'");
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

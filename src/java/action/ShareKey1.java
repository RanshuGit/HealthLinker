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
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pack.Dbconnection;
import pack.MailUtil;

/**
 *
 * @author Jyoti
 */
public class ShareKey1 extends HttpServlet {

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
            String id = request.getParameter("id");
            String uname = request.getParameter("id1");
            String demail = request.getParameter("mail1");

            Connection con = Dbconnection.getConn();
            Statement st = con.createStatement();
            Dbconnection db = new Dbconnection();
            String query = "Select * from actuary_reg";
            ResultSet r = st.executeQuery(query);
            while (r.next()) {
                String email = r.getString("mail");
                String name1 = r.getString("username");
                if (demail.equals(email)) {
                    String sql = "Select * from patient_record where email='" + id + "'";
                    Statement st1 = con.createStatement();
                    ResultSet rs = st1.executeQuery(sql);
                    if (rs.next()) {
                        String filename = rs.getString("filename");
                        String sql1 = "Select * from files where filename='" + filename + "'";
                        Statement st2 = con.createStatement();
                        ResultSet rs1 = st2.executeQuery(sql1);
                        if (rs1.next()) {
                            String key = rs1.getString("hashkey");
                            Random num = new Random();
                            int key1 = num.nextInt(10000);
                            String sql2 = "Insert into sharekey(owner,filename,sharekey,share_with)values('" + uname + "', '" + filename + "','" + key1 + "','" + name1 + "');";
                            Statement st3 = con.createStatement();
                            int i = st3.executeUpdate(sql2);
                            if (i != 0) {
                                String name = demail;

                                String mail[] = {name};
                                MailUtil mm = new MailUtil();
                                String msg = "Hello, File uploaded from PHR Owner for you.\n Filename ='" + filename + "' from Ownername= '" + uname + "' \n haskkey = '" + key1 + "'";
                                mm.sendMail(mail, mail, "File Uploaded", msg);

                                out.println("<script>");
                                out.println("alert('Secret Key Successfully Sent on Mail !')");
                                out.println("location='View.jsp'");
                                out.println("</script>");
                            } else {
                                out.println("<script>");
                                out.println("alert('Something went wrong!')");
                                out.println("location='Share1.jsp'");
                                out.println("</script>");
                            }
                        }
                    }
                }
            }
            out.println("<script>");
            out.println("location='View.jsp'");
            out.println("</script>");
        } catch (Exception e) {
            e.printStackTrace();
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

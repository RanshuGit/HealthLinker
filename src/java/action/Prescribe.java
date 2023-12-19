/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pack.Dbconnection;
import pack.MailUtil;

/**
 *
 * @author admin
 */
public class Prescribe extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            HttpSession user = request.getSession();
            String uname = user.getAttribute("username").toString();
            String prescription = request.getParameter("text");
            String filename = request.getParameter("id1");

            Connection con = Dbconnection.getConn();
            Statement st = con.createStatement();
            Statement st1 = con.createStatement();

            String sql = "select * from patient_record where filename = '" + filename + "'";
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                String ownername = rs.getString("username");
                
                String query = "select * from user_reg where username ='"+ownername+"'"; 
                Statement st5 = con.createStatement();
                ResultSet rs5 = st5.executeQuery(query);
                if(rs5.next()){
                    String umail = rs5.getString("mail");
                

                DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                //get current date time with Date()
                Date date = new Date();
                System.out.println(dateFormat.format(date));
                String time = dateFormat.format(date);
                
                int i = st1.executeUpdate("insert into prescription (doctor_name, patient_name, filename, p_time, prescription)values('" + uname + "','" + ownername + "', '" + filename + "', '" + time + "', '" + prescription + "')");
                if (i != 0) {
                    String mail1 = umail;

                String mail2[] = {umail};
                MailUtil mm = new MailUtil();
                String msg = "Hello, you have new prescription! by Dr. '" + uname + "'";
                mm.sendMail(mail2, mail2, "File Updated", msg);
                    
                    out.println("<script>");
                    out.println("alert('Prescription Sent Successfully !')");
                    out.println("location='aview.jsp'");
                    out.println("</script>");
                } else {
                    out.println("<script>");
                    out.println("alert('Something went wrong!')");
                    out.println("location='aview.jsp'");
                    out.println("</script>");
                }
            } else {
                out.println("<script>");
                out.println("alert('This Patient does not exist!')");
                out.println("location='aview.jsp'");
                out.println("</script>");
            }
            }

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

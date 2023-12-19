/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class HealthRecord extends HttpServlet {

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
        Document document = new Document();
        try {
            String user = request.getParameter("user");
            String share1[] = request.getParameterValues("share");
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String email = request.getParameter("mail");
            String gender = request.getParameter("gender");
            String add = request.getParameter("address");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String zip = request.getParameter("zip");
            String mobile = request.getParameter("mobile");
            String dob = request.getParameter("birth");
            String height = request.getParameter("height");
            String weight = request.getParameter("weight");
            String bmi = request.getParameter("bmi");
            String temp = request.getParameter("temp");
            String bg = request.getParameter("bgroup");
            String bp = request.getParameter("bpressure");
            String pr = request.getParameter("prate");
            String rr = request.getParameter("Rrate");

            String share = "";
            for (int j = 0; j < share1.length; j++) {
                share += share1[j] + ",";
            }
            if (share.contains(",")) {
                share = share.substring(0, share.lastIndexOf(","));
            }
            //String share = share2 + ", " + share3 + ", " + share4;

            String filename = request.getParameter("fname");
            String filename1 = filename + ".pdf";

            Connection con = Dbconnection.getConn();
            Statement st = con.createStatement();
            ServletContext sc = this.getServletContext();
            String sg1 = sc.getRealPath("/");
            String fname1 = sg1.substring(0, sg1.indexOf("build"));
            String filePath = fname1 + "web/images/TextFiles/";
            String sql = "select * from patient_record where email = '" + email + "'";
            ResultSet rs = st.executeQuery(sql);

            if (rs.next()) {
                out.println("<script>");
                out.println("alert('Patient already exist !')");
                out.println("location='CreateRecord.jsp'");
                out.println("</script>");
            } else {
                int i = st.executeUpdate("insert into patient_record (share_with, fname, lname, email, gender, address, city, state, zip, contact, dob, height, weight, bmi, temp, bg, bp, prate, rrate,filename,username)values('" + share + "','" + fname + "', '" + lname + "', '" + email + "', '" + gender + "', '" + add + "', '" + city + "', '" + state + "', '" + zip + "', '" + mobile + "', '" + dob + "', '" + height + "', '" + weight + "', '" + bmi + "', '" + temp + "', '" + bg + "', '" + bp + "', '" + pr + "', '" + rr + "', '" + filename1 + "', '" + user + "')");
                if (i != 0) {
                    PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(filePath + fname + ".pdf"));
                    document.open();
                    document.add(new Paragraph("Share with : " + share + "\n Patient Name : " + fname + " " + lname + "\n E-Mail Id : " + email + "\n Gender : " + gender + "\n Home Address : " + add + "\n City : " + city + "\n State : " + state + "\n Zip : " + zip + "\n Contact No : " + mobile + " \n Date-Of-Birth : " + dob + "\n Height (Inches) : " + height + "\n Weight (Kg's) : " + weight + "\n Body Mass Index : " + bmi + "\n Body Temperature (degree C): " + temp + "\n Blood Group : " + bg + "\n Blood Pressure(Range) :" + bp + "\n Pulse Rate(per minute) : " + pr + "\n Respiratory Rate(Breaths par minute) : " + rr));
                    document.close();
                    writer.close();
                    out.println("<script>");
                    out.println("alert('Patient Registered Successfully !')");
                    out.println("location='CreateRecord.jsp'");
                    out.println("</script>");
                } else {
                    out.println("<script>");
                    out.println("alert('Something went wrong!')");
                    out.println("location='CreateRecord.jsp'");
                    out.println("</script>");
                }
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

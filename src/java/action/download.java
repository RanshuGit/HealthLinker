/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import java.io.File;
import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pack.Dbconnection;
import pack.decryption;

/**
 *
 * @author IBN5
 */
public class download extends HttpServlet {

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

        try {
            String fileid = request.getQueryString();
            String fname = null, fkey = null;
            InputStream is = null;

            Connection con = Dbconnection.getConn();
            Statement st = con.createStatement();
            Statement st1 = con.createStatement();

            HttpSession user = request.getSession();
            String uname = user.getAttribute("username").toString();
            // String name = user.getAttribute("name").toString();

            Statement st2 = con.createStatement();
            ResultSet rt2 = st2.executeQuery("select * from rights where username_='" + uname + "'");

            ResultSet rt = st.executeQuery("select * from files where idfiles='" + fileid + "'");

            if (rt.next()) {
                fname = rt.getString("filename");
                fkey = rt.getString("file_key");
                boolean status = true;//new Ftpcon().checkFileExists("/D/" + fname);
                if (status) {
                    is = (InputStream) rt.getAsciiStream("content");
                } else {
                    response.sendRedirect("download.jsp?failed='true'");
                }
            } else {
                //  out.println("error while retreiving data");

            }
            BufferedReader br = new BufferedReader(new InputStreamReader(is));
            String temp = null;
            StringBuffer sb = new StringBuffer();
            while ((temp = br.readLine()) != null) {
                sb.append(temp);
            }
            Document document = new Document();
            ServletContext sc = this.getServletContext();
            String sg1 = sc.getRealPath("/");
            String fname1 = sg1.substring(0, sg1.indexOf("build"));
            String content = new decryption().decrypt(sb.toString(), fkey);
            String filePath = fname1 + "web/images/DownloadedFiles/";
            PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(filePath + fname));
            document.open();
            document.add(new Paragraph(content));
            document.close();
            writer.close();

            // file data get downloaded from file
            File file = new File(filePath + fname);
            ServletContext ctx = getServletContext();

            InputStream fis = new FileInputStream(file);
            String mimeType = ctx.getMimeType(file.getAbsolutePath());
            response.setContentType(mimeType != null ? mimeType : "application/octet-stream");
            response.setContentLength((int) file.length());
            response.setHeader("Content-Disposition", "attachment; filename=\"" + fname + "\"");

            ServletOutputStream os = response.getOutputStream();
            byte[] bufferData = new byte[1024];
            int read = 0;
            while ((read = fis.read(bufferData)) != -1) {
                os.write(bufferData, 0, read);
            }
            os.flush();
            os.close();
            fis.close();

            Calendar cal = Calendar.getInstance();
            DateFormat dateformat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            String time = dateformat.format(cal.getTime());
            System.out.println("download time:" + time);

            st1.executeUpdate("insert into downloads (filename,username,time)values('" + fname + "','" + uname + "','" + time + "')");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            //  out.close();
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

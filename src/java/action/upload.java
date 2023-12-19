/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.parser.PdfTextExtractor;
import com.oreilly.servlet.MultipartRequest;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.Date;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pack.Dbconnection;
import pack.Ftpcon;
import pack.MailUtil;
import pack.encryption;

/**
 *
 * @author IBN5
 */
public class upload extends HttpServlet {

    File file;
    final String filepath = "D:/";
    

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static String hash(StringBuffer sb) {
        // Implement hash (MD5)

        String md5 = null;

        if (null == sb) {
            return null;
        }
        try {

            //Create MessageDigest object for MD5
            MessageDigest digest = MessageDigest.getInstance("MD5");

            //Update input string in message digest
            digest.update(sb.toString().getBytes(), 0, sb.length());

            //Converts message digest value in base 16 (hex)
            md5 = new BigInteger(1, digest.digest()).toString(16);

        } catch (Exception e) {

            e.printStackTrace();
        }
        return md5.toString();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            long stime = System.currentTimeMillis();
            
            
            MultipartRequest m = new MultipartRequest(request, filepath);
            File file = m.getFile("file");
            String filename = file.getName().toLowerCase();
            HttpSession user = request.getSession(true);
            String owner = user.getAttribute("username").toString();
            Connection con = Dbconnection.getConn();
            Statement st3 = con.createStatement();
            Statement st4 = con.createStatement();
            ResultSet rt3 = st3.executeQuery("select * from files where filename='" + filename + "'");
            String contents = "";
            if (rt3.next()) {
                response.sendRedirect("aupload.jsp?rename='yes'");
            } else {
                //out.println("file location:"+filepath+"\n file name:"+filename+"\n");  
                PdfReader reader = new PdfReader(file.getAbsolutePath());
                int count = reader.getNumberOfPages();
                String page = "";
                if (!reader.isEncrypted()) {
                    for (int i = 0; i < count; i++) {
                        page = PdfTextExtractor.getTextFromPage(reader, (i + 1));
                    }
                }

                KeyGenerator keyGen = KeyGenerator.getInstance("AES");
                keyGen.init(128);
                SecretKey secretKey = keyGen.generateKey();
                System.out.println("secret key:" + secretKey);

                encryption e = new encryption();
                String encryptedtext = e.encrypt(page, secretKey);
                //storing encrypted file
                FileWriter fw = new FileWriter(file);
                fw.write(encryptedtext);
                fw.close();

                //converting secretkey to String
                byte[] b = secretKey.getEncoded();//encoding secretkey
                String skey = Base64.encode(b);
                System.out.println("converted secretkey to string:" + skey);
                //getting properties

                DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                //get current date time with Date()
                Date date = new Date();
                System.out.println(dateFormat.format(date));
                String time = dateFormat.format(date);
                //get current date time with Calendar()
                Calendar cal = Calendar.getInstance();
                System.out.println(dateFormat.format(cal.getTime()));
                String len = file.length() + "bytes";

                //uploading file
                boolean status = new Ftpcon().upload(file);

                if (true) {
                    //Connection con= Dbconnection.getConn();
                    Statement st = con.createStatement();
                    Statement st1 = con.createStatement();
                    ResultSet rt1 = st1.executeQuery("select * from user_reg where username='" + owner + "'");
                    //sending filekey to users mail
                    if (rt1.next()) {
                        String ma = rt1.getString("mail");
                        String[] mail = new String[]{ma};
                        String msg = "Filename:" + file.getName() + "\n Filekey:" + skey;
                        new MailUtil().sendMail(mail, mail, "File Key", msg);
                    } else {
                        out.println("error while sending mail");
                    }
                     long etime = System.currentTimeMillis();
                     long rtime = etime - stime; 
                    String sec = Utilities.stringtoByte(filename + filename.length());
                    int i = st.executeUpdate("insert into files(filename,content,owner_name,upload_time,size,file_key,hashkey,timerequired)values('" + file.getName() + "','" + encryptedtext + "','" + owner + "','" + time + "','" + len + "','" + skey + "','" + sec + "','"+rtime+"')");
                    if (i != 0) {
                        // out.println("success");
                        response.sendRedirect("aupload.jsp?status='uploded'");

                    } else {
                        out.println("error while uploading additional informations");
                    }

                } else {
                    out.println("error");
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

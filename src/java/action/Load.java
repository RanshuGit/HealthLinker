/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.net.InetAddress;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;
import javax.servlet.ServletContext;
//import javax.mail.Part;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author shivam
 */
@WebServlet(urlPatterns = {"/Load"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class Load extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     *
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();
            HttpSession session = request.getSession(true);

            long startime = System.currentTimeMillis();
            String saveFile = "", sn = "", un = "";
            int fileidnum = 0, downloadcount = 0, vc = 0;
           
            String contentType = request.getContentType();
            // Create a factory for disk-based file items
            DiskFileItemFactory factory = new DiskFileItemFactory();

            factory.setSizeThreshold(4012);

            ServletFileUpload upload = new ServletFileUpload(factory);

            List items = null;
            try {
                items = upload.parseRequest(request);
            } catch (FileUploadException e) {
                e.printStackTrace();
            }
            byte[] data = null;
            String fileName = null;
// Process the uploaded items
            Iterator iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();

                if (item.isFormField()) {
                    //processFormField(item);

                    String name = item.getFieldName();
                    String value = item.getString();

                } else {
                    data = item.get();
                    fileName = item.getName();
                    System.out.println("fn:" + fileName);
                }
            }
            String extension = "";

            int i = fileName.lastIndexOf('.');
            if (i > 0) {
                extension = fileName.substring(i + 1);
            }
            System.out.println("--" + extension);
            saveFile = fileName;
            ServletContext sc = this.getServletContext();
            String sg = sc.getRealPath("/");
            String path = sg.substring(0, sg.indexOf("build"));
            path = path + "web\\dataset\\";

            String strPath = path  + saveFile;
            System.out.println(strPath);
            File ff = new File(strPath);
            FileOutputStream fileOut = new FileOutputStream(ff);
            fileOut.write(data, 0, data.length);
            fileOut.flush();
            fileOut.close();
            System.out.println(strPath);
            System.out.println("Thrid");
            
          out.println("<script type=\"text/javascript\">"); 
          out.println("alert('succesfully');"); 
          out.println("</script>"); 
            response.sendRedirect("emergency_page.jsp");
            

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        
//
////        response.setContentType("text/html;charset=UTF-8");
////        
////          long startime = System.currentTimeMillis();
////            String saveFile = "", sn = "", un = "";
////            int fileidnum = 0, downloadcount = 0, vc = 0;
////          //  sn = (String) session.getAttribute("Sn");
////           // un = (String) session.getAttribute("un");
////            String contentType = request.getContentType();
////            // Create a factory for disk-based file items
////            DiskFileItemFactory factory = new DiskFileItemFactory();
////
////            factory.setSizeThreshold(4012);
////
////            ServletFileUpload upload = new ServletFileUpload(factory);
////
////            List items = null;
////            try {
////                items = upload.parseRequest(request);
////            } catch (FileUploadException e) {
////                e.printStackTrace();
////            }
////            byte[] data = null;
////            String fileName = null;
////// Process the uploaded items
////            Iterator iter = items.iterator();
////            while (iter.hasNext()) {
////                FileItem item = (FileItem) iter.next();
////
////                if (item.isFormField()) {
////                    //processFormField(item);
////
////                    String name = item.getFieldName();
////                    String value = item.getString();
////
////                } else {
////                    data = item.get();
////                    fileName = item.getName();
////                    System.out.println("fn:" + fileName);
////                }
////            }
////            String extension = "";
////
////            int i = fileName.lastIndexOf('.');
////            if (i > 0) {
////                extension = fileName.substring(i + 1);
////            }
////            System.out.println("--" + extension);
////            saveFile = fileName;
////            String path = request.getSession().getServletContext().getRealPath("/");
////            System.out.println(path);
////
////            String strPath = path + "E:\\CodeProject\\" + saveFile;
////            System.out.println(strPath);
////            File ff = new File(strPath);
////            FileOutputStream fileOut = new FileOutputStream(ff);
////            fileOut.write(data, 0, data.length);
////            fileOut.flush();
////            fileOut.close();
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
////    @Override
////    protected void doPost(HttpServletRequest request, HttpServletResponse response)
////            throws ServletException, IOException {
////         Part filePart = request.getPart("file");
////    String fileName = filePart.getSubmittedFileName();
////    for (Part part : request.getParts()) {
////      part.write("F:\\temp\\" + fileName);
////    }
////    response.getWriter().print("The file uploaded sucessfully.");
////  }
//      //  processRequest(request, response);
//    
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
////     */
////    @Override
////    public String getServletInfo() {
////        return "Short description";
////    }// </editor-fold>
}

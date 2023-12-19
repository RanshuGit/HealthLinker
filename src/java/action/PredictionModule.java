/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
//import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import pack.Dbconnection;
import weka.classifiers.Evaluation;
import weka.classifiers.functions.SMO;
import weka.core.Instance;
import weka.core.Instances;
import weka.core.SparseInstance;
import weka.core.converters.CSVLoader;

/**
 *
 * @author shivam
 */
public class PredictionModule extends HttpServlet {

    String ms;
    String username;

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
        Document document = new Document();

        try (PrintWriter out = response.getWriter()) {

            HttpSession user = request.getSession(true);
            String uname = user.getAttribute("username").toString();

            System.out.println(uname);
            String itching = request.getParameter("itching");
            String skinrash = request.getParameter("skinrash");
            String nodalskin = request.getParameter("nodalskin");
            String accidity = request.getParameter("accidity");
            String stoamchpain = request.getParameter("stoamchpain");
            String ulcers = request.getParameter("ulcers");
            String vomitting = request.getParameter("vomitting");
            String phlegm = request.getParameter("phlegm");
            String irritation = request.getParameter("irritation");
            String redness = request.getParameter("redness");
            String sinus = request.getParameter("sinus");

            String runny = request.getParameter("runny");
            System.out.println("disc:" + runny);

            Dbconnection db = new Dbconnection();
            Connection con = db.getConn();
            Statement st = con.createStatement();
            Statement st1 = con.createStatement();
            Statement st2 = con.createStatement();

            ServletContext sc = this.getServletContext();
            System.out.println("sc " + sc.getContextPath());
            System.out.println("rl " + sc.getRealPath("/"));

            String sg = sc.getRealPath("/");
            String path = sg.substring(0, sg.indexOf("build"));
            path = path + "web\\dataset\\";
            // message info
            String fpath = path + "Training.csv";
            String fpath1 = path + "Testing.csv";
            
            CSVLoader csv = new CSVLoader();
            csv.setSource(new File(fpath));
            Instances data = csv.getDataSet();
            data.setClassIndex(data.numAttributes() - 1);

            SMO sm = new SMO();
            sm.buildClassifier(data);

            Evaluation eval = new Evaluation(data);
            eval.evaluateModel(sm, data);
            double acc = (eval.correct() / data.numInstances()) * 100;
            double err = eval.errorRate();
            System.out.println(err + " : " + acc);

            String res = eval.toSummaryString();
            res = res + "\n\n Accuracy = " + acc;
            res = res + "\n\n Error = " + (100 - acc);
            System.out.println(res);

            int itchindex = 0;
            int skinras = 1;
            int nodal = 2;
            int acidy = 8;
            int ulsceron = 9;
            int stomach = 111;

            int vomdisch = 11;

            int phlegm1 = 50;
            int irritation1 = 63;
            int redness1 = 52;
            int sinus1 = 53;
            int runny1 = 54;

            BufferedReader br = new BufferedReader(new FileReader(fpath1));
            String line = "";
            boolean isFirstLine = true;
            while ((line = br.readLine()) != null) {
                String values[] = line.split(",");
                if (isFirstLine) {
                    isFirstLine = false;
                    continue;
                }
                Instance ins1 = new SparseInstance(values.length - 1);
                int index = 0;
                for (int i = 0; i < values.length - 1; i++) {
                    ins1.setValue(index, Double.parseDouble(values[i].trim()));
                    index++;
                }

                ins1.setValue(itchindex, Double.parseDouble(itching));
                ins1.setValue(skinras, Double.parseDouble(skinrash));
                ins1.setValue(nodal, Double.parseDouble(nodalskin));
                ins1.setValue(acidy, Double.parseDouble(accidity));
                ins1.setValue(stomach, Double.parseDouble(stoamchpain));
                ins1.setValue(ulsceron, Double.parseDouble(ulcers));
                ins1.setValue(vomdisch, Double.parseDouble(vomitting));
                ins1.setValue(phlegm1, Double.parseDouble(phlegm));
                ins1.setValue(irritation1, Double.parseDouble(irritation));
                ins1.setValue(redness1, Double.parseDouble(redness));
                ins1.setValue(sinus1, Double.parseDouble(sinus));
                ins1.setValue(runny1, Double.parseDouble(runny));
                ins1.setDataset(data);

                int r1 = (int) sm.classifyInstance(ins1);
                System.out.println(r1);

                String cs[] = sm.classAttributeNames();
                ms = cs[r1];
                System.out.println(ms);
                break;
            }
            String d1 = "delete  from filehandler where name='" + uname + "'";
            st1.executeUpdate(d1);
            username = uname;
            String fname = uname + ".pdf";

            ServletContext sc1 = this.getServletContext();
            String sg1 = sc1.getRealPath("/");
            String strPath = path + "\\" + fname;
            String fname1 = sg1.substring(0, sg1.indexOf("build"));
            String filePath = fname1 + "web/images/TextFiles/";
            File f1 = new File(filePath);              //f.mkdirs() ;
            f1.createNewFile();
            PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(filePath + fname));
            document.open();
            document.add(new Paragraph("Name:  " + username));
            document.add(new Paragraph("Predicted Disease is : " + ms + ""));
            document.close();
            writer.close();
            String str = "insert into filehandler(filename,name,content) values(?,?,?)";
            PreparedStatement psmnt = con.prepareStatement(str);

            psmnt.setString(1, fname);
            psmnt.setString(2, username);
            psmnt.setBytes(3, ms.getBytes());
            int s = psmnt.executeUpdate();

            if (s != 0) {

                out.println("<script>");
                out.println("alert('The desease is  " + ms + "')");
                out.println("location='Prediction.jsp'");
                out.println("</script>");
            }
            //end     

        } catch (Exception e) {
            e.printStackTrace();
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

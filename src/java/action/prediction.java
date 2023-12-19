/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import org.json.JSONObject;
//import pack.DBConnection;
import weka.classifiers.Evaluation;
import weka.classifiers.functions.SMO;
import weka.core.Instance;
import weka.core.Instances;
import weka.core.SparseInstance;
import weka.core.converters.CSVLoader;
// *
// * @author shivam
// */
@WebServlet(name = "prediction", urlPatterns = {"/prediction"})
public class prediction extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {

            //get username, latitude and longitude
//            String email = request.getParameter("email");
//            String latitude = request.getParameter("latitude");
//            String longitude = request.getParameter("longitude");
            ServletContext sc = this.getServletContext();
            System.out.println("sc " + sc.getContextPath());
            System.out.println("rl " + sc.getRealPath("/"));

            String sg = sc.getRealPath("/");
            String path = sg.substring(0, sg.indexOf("build"));
            path = path + "web\\dataset\\";
            // message info
            String fpath = path + "Training.csv";
           
                
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
                sm.buildClassifier(data);

                Instance ins1 = new SparseInstance(12);

//                ins1.setValue(0, fever);
//                ins1.setValue(1, tiredness);
//                ins1.setValue(2, drycough);
//                ins1.setValue(3, breathing);
//                ins1.setValue(4, sorethroat);
//
//                ins1.setValue(5, none_sympton);
//                ins1.setValue(6, nasal_congestion);
//                ins1.setValue(7, runny_nose);
//                ins1.setValue(8, diarrhea);
//                ins1.setValue(9, none_experiencing);
//                ins1.setValue(10, gender);
//                ins1.setValue(11, age);
//
//                ins1.setDataset(data);
//
//                int r1 = (int) sm.classifyInstance(ins1);
//                System.out.println(r1);
//
//               String cs[] = sm.classAttributeNames();
//                String ms = cs[r1];
//
//                //insert into severity_table along with latitude and longitude
//                String sql = "SELECT * FROM tbl_severity WHERE user_email='" + email + "'";
//
//                String timeStamp = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(new Date());
//                DBConnection db = new DBConnection();
//                ResultSet rs = db.selectData(sql);
//                if (rs.next()) {
//                    //update the existing severity detals with time stamp
//                    sql = "UPDATE tbl_severity SET severity='" + ms + "', timeStamp='" + timeStamp + "', latitude='" + latitude + "', longitude='" + longitude + "' WHERE user_email='" + email + "'";
//                    int row_affected = db.insert(sql);
//
//                } else {
//                    //insert new record into table
//                    sql = "INSERT INTO tbl_severity(user_email,severity,latitude,longitude,timeStamp) VALUES ('" + email + "','" + ms + "','" + latitude + "','" + longitude + "','" + timeStamp + "')";
//                    int row_affected = db.insert(sql);
//                }
//                System.out.println(ms);

//                JSONObject json = new JSONObject();



//                String msg="";
//                if(ms.equalsIgnoreCase("0"))
//                {
//                    msg="You have no symptoms of covid.";
//                }else if(ms.equalsIgnoreCase("0"))
//                {
//                      msg="You have mild symptoms of covid.";
//                }else
//                {
//                    msg="You have severe symptoms of covid.";
//                }
//                json.put("severity", msg);
//                json.put("success", 1);
//                response.setContentType("application/json");
//                response.getWriter().write(json.toString());
//
//            } 
//           catch (Exception e) 
//            {
//                e.printStackTrace();
//            } 

    }catch(Exception e)
    {
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
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }

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
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>

}


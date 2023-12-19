/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import pack.Dbconnection;

/**
 *
 * @author Dell
 */
public class TimeAnalysis1 extends HttpServlet {

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

        try {
            DefaultCategoryDataset dataset = new DefaultCategoryDataset();
            Connection con = Dbconnection.getConn();
            Statement st = con.createStatement();
            String str = "select * from files";
            ResultSet rs = st.executeQuery(str);
            while (rs.next()) {
                dataset.addValue(Double.parseDouble(rs.getString("timerequired")), rs.getString("idfiles"), rs.getString("size"));
            }
            JFreeChart chart = ChartFactory.createBarChart("Time Analysis", "", "Value", dataset,
                    PlotOrientation.VERTICAL, true, true, false);
            JFreeChart barChart = ChartFactory.createBarChart(
                    "Time Analysis",
                    "Number Of Documents", "Time Required(sec)",
                    dataset, PlotOrientation.VERTICAL,
                    true, true, false);
            int width = 300;
            int height = 300;
            response.setContentType("image/png");
            OutputStream outputStream = response.getOutputStream();
            ChartUtilities.writeChartAsPNG(outputStream, barChart, width, height);

        } catch (Exception e) {
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

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Products;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author java1
 */
@MultipartConfig(maxFileSize = 16177215)
public class add_product extends HttpServlet {

    private String dbURL = "jdbc:mysql://localhost:3306/distilled";
    private String dbUser = "root";
    private String dbPass = "root";
    private SimpleDateFormat format;

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
            String weight = request.getParameter("weight");
            String expiry_date = request.getParameter("expiry_date");
            String mfd = request.getParameter("mfd");
            String price = request.getParameter("price");
            String statuss = "waiting";

            System.out.println("weight" + weight + "expiry_date" + expiry_date  + "price" + price + "mfd" + mfd );
            InputStream inputStream = null;
            Part filePart = request.getPart("p_image");
            if (filePart != null) {
                System.out.println(filePart.getName());
                System.out.println(filePart.getSize());
                System.out.println(filePart.getContentType());
                inputStream = filePart.getInputStream();
            }
            Connection conn = null;
            String message = null;
            try {

                DriverManager.registerDriver(new com.mysql.jdbc.Driver());
                conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                String sql = "insert into containers(weight, expiry_date, mfd, price, statuss, p_image) values (?, ?, ?, ?, ?, ?)";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, weight);
                statement.setString(2, expiry_date);
                statement.setString(3, mfd);
                statement.setString(4, price);
                statement.setString(5, statuss);
                if (inputStream != null) {
                    statement.setBlob(6, inputStream);
                }

                int row = statement.executeUpdate();
                if (row > 0) {

                    response.sendRedirect("add_product.jsp?Success");
                } else {
                    response.sendRedirect("add_product.jsp?Failed");
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
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

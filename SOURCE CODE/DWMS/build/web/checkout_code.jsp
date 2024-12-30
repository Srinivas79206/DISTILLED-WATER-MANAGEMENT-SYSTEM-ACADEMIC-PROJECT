<%-- 
    Document   : checkout_code
    Created on : Jan 28, 2020, 6:22:23 PM
    Author     : java1
--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DWMS.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String product = request.getParameter("product");
    String del_time = request.getParameter("del_time");
    String quantity = request.getParameter("quantity");
    String containers = product + " " + quantity;
    String place=(String)session.getAttribute("Address");
    String user_id=(String)session.getAttribute("uid");
    String delivery_time = "Waiting";
    String price = request.getParameter("total");
    String statuss = "Waiting";
    String Transporter_id ="Waiting";
     DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date date = new Date();
            String time = dateFormat.format(date);
            System.out.println("Date and Time : " + time);
    Connection con = SQLconnection.getconnection();
    Statement st = con.createStatement();
    try {
        Statement st1 = con.createStatement();

        String query = "insert into orders(containers, delivery_time, delivery_place, transporter_id, statuss, price,user_id,time)values(?,?,?,?,?,?,?,?)";
        
        PreparedStatement preparedStmt = con.prepareStatement(query);
      preparedStmt.setString (1,containers );
      preparedStmt.setString (2, del_time);
      preparedStmt.setString (3, place);
      preparedStmt.setString (4, Transporter_id);
      preparedStmt.setString (5, statuss);
      preparedStmt.setString (6, price);
      preparedStmt.setString (7, user_id);
      preparedStmt.setString (8, time);
      

      // execute the preparedstatement
     int row = preparedStmt.executeUpdate();
      if (row > 0) {
            response.sendRedirect("my_orders.jsp?success");
        } else {
            response.sendRedirect("view_products.jsp?Failed");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>

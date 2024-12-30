<%-- 
    Document   : approve
    Created on : Jan 29, 2020, 3:09:02 PM
    Author     : java1
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DWMS.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String order_id = request.getParameter("order_id");
    String delivery_place = request.getParameter("delivery_place");
    String transporter_id = (String)session.getAttribute("tid");
    String uid = request.getParameter("uid");
    String veh_id = request.getParameter("veh_id");
    String start_time = request.getParameter("start_time");

   
    Connection con = null;
    Statement st = null;
    Statement st1 = null;
    Connection conn = SQLconnection.getconnection();
    Statement sto = conn.createStatement();
    st = conn.createStatement();

    try {
        int i = sto.executeUpdate("insert into transporter(transporter_id, delivery_place, starting_time, reaching_time, vehicle_id,order_id,statuss)values('"+transporter_id+"','"+delivery_place+"','"+start_time+"','Waiting','"+veh_id+"','"+order_id+"','Waiting')");
        System.out.println("test print==" + order_id);
        if (i != 0) {
            
                response.sendRedirect("trans_orders.jsp?Approved");
            } else {

                System.out.println("failed");
                response.sendRedirect("trans_orders.jsp?Failed");
            }
        }
     catch (Exception ex) {
        ex.printStackTrace();
    }

%>

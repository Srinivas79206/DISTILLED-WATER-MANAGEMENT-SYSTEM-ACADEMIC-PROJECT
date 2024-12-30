<%-- 
    Document   : confirm_del
    Created on : Feb 1, 2020, 11:41:28 AM
    Author     : java1
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DWMS.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String order_id = request.getParameter("oid");
    String reaching_time = request.getParameter("reaching_time");

   
    Connection con = null;
    Statement st = null;
    Statement st1 = null;
    Connection conn = SQLconnection.getconnection();
    Statement sto = conn.createStatement();
    st = conn.createStatement();

    try {
        int i = sto.executeUpdate("update transporter set reaching_time='"+reaching_time+"',statuss='Delivered'  where order_id='" + order_id + "'");
        System.out.println("test print==" + order_id);
        if (i != 0) {
            int j = st.executeUpdate("update orders set delivery_time='"+reaching_time+"'  where order_id='" + order_id + "'");
                response.sendRedirect("Delivery.jsp?Approved");
            } else {

                System.out.println("failed");
                response.sendRedirect("Delivery.jsp?Failed");
            }
        } catch (Exception ex) {
        ex.printStackTrace();
    }

%>
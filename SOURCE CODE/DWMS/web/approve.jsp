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
    String transporter_id = request.getParameter("transporter_id");
    String uid = request.getParameter("uid");

   
    Connection con = null;
    Statement st = null;
    Statement st1 = null;
    Connection conn = SQLconnection.getconnection();
    Statement sto = conn.createStatement();
    Statement st3 = conn.createStatement();
    st = conn.createStatement();
  String ch="Waiting For Delevery";
    try { 
    
    ResultSet rs1=st3.executeQuery(" SELECT * from orders where order_id = '" + order_id + "' ");
    rs1.next();
    String statuss = rs1.getString("statuss");
      System.out.println(statuss);
      System.out.println(ch);
      System.out.println(ch==statuss);
    if(statuss != ch)
    {
        int i = sto.executeUpdate("update orders set statuss='Waiting For Delivery',transporter_id='"+transporter_id+"' where order_id='" + order_id + "' ");
        System.out.println("test print==" + order_id);
        if (i != 0) {
            ResultSet rs = st.executeQuery(" SELECT * from user_reg where id = '" + uid + "' ");
            if (rs.next()) {
                String Username = rs.getString("Username");
                String mail = rs.getString("Username");
                String msggg = Username;
                System.out.println("success");
                response.sendRedirect("Orders.jsp?Approved");
            } else {

                System.out.println("failed");
                response.sendRedirect("Orders.jsp?Failed");
            }
        }
    }
    else{
    response.sendRedirect("Orders.jsp?Already_Approved");
    
    }
    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>
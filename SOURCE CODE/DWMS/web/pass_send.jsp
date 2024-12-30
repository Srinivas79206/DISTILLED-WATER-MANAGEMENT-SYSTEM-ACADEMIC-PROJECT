<%-- 
    Document   : pass_send
    Created on : Feb 1, 2020, 12:24:02 PM
    Author     : java1
--%>


<%@page import="DWMS.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.security.SecureRandom"%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Random"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String email = request.getParameter("email");
   
    
    System.out.println("Check User ID  " + email);
    Connection con = SQLconnection.getconnection();
    Statement st = con.createStatement();
    Statement st1 = con.createStatement();
    Statement sto = con.createStatement();
    try {
        
            ResultSet rs = st.executeQuery("SELECT * FROM user_reg where Email='" + email + "'");
            if (rs.next()) {
                String mail = rs.getString("Email");
                String pass = rs.getString("pass");
                response.sendRedirect("user.jsp?Pass_recovered");
            } 
         else {
            response.sendRedirect("user.jsp?Mail_not_Found");
        }

    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>

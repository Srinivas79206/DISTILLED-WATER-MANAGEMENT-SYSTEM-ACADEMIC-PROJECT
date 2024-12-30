<%-- 
    Document   : user_login
    Created on : Jan 27, 2020, 1:53:12 PM
    Author     : java1
--%>
<%@page import="java.security.SecureRandom"%>
<%@page import="DWMS.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String name = request.getParameter("name");
    String pass = request.getParameter("pass");
    String status = null;
    System.out.println("Check User name And Password : " + name + pass);
    Connection con = SQLconnection.getconnection();
    Connection conn = SQLconnection.getconnection();
    Statement st = con.createStatement();
    Statement sto = conn.createStatement();
    try {
        ResultSet rs = st.executeQuery("SELECT * FROM user_reg where Email='" + name + "' AND pass='" + pass + "'");
        if (rs.next()) {
          session.setAttribute("uid", rs.getString("id"));
          session.setAttribute("Address", rs.getString("Address"));
          session.setAttribute("Username", rs.getString("Username"));
          session.setAttribute("Email", rs.getString("Email"));
          session.setAttribute("Qualification", rs.getString("Qualification"));
           String mail = rs.getString("Email");
            response.sendRedirect("user_home.jsp?success");
        }
        else{
                response.sendRedirect("user.jsp?Failed");
            }
        
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>

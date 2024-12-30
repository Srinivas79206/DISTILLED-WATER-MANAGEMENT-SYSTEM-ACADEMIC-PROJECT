<%-- 
    Document   : feed
    Created on : Feb 1, 2020, 12:33:51 PM
    Author     : java1
--%>

<%@page import="java.sql.Statement"%>
<%@page import="DWMS.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String des = request.getParameter("des");
    String oid = request.getParameter("oid");
    String tid = request.getParameter("tid");
    String uid = (String)session.getAttribute("uid");

    Connection connection = SQLconnection.getconnection();
    Statement statement = connection.createStatement();
    Statement statement1 = connection.createStatement();

    try {
        int j = statement1.executeUpdate("insert into feedback(user_id, transporter, des,oid)values('" + uid + "','" + tid + "','"+des+"','"+oid+"')");
        if (j != 0) {
            response.sendRedirect("my_orders.jsp?_Feedback_Added");
        } else {
            response.sendRedirect("my_orders.jsp?Feed_Failed");
        }
    } catch (Exception e) {
    }
%>
<%-- 
    Document   : add_vehicle1
    Created on : Jan 31, 2020, 6:54:22 PM
    Author     : java1
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Statement"%>
<%@page import="DWMS.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String vname = request.getParameter("vname");
    String v_size = request.getParameter("v_size");
    String tname = (String)session.getAttribute("tname");

    Connection connection = SQLconnection.getconnection();
    Statement statement = connection.createStatement();
    Statement statement1 = connection.createStatement();

    try {
        int j = statement1.executeUpdate("insert into vehicle(name, size, tname)values('" + vname + "','" + v_size + "','"+tname+"')");
        if (j != 0) {
            response.sendRedirect("add_vehicle.jsp?Added");
        } else {
            response.sendRedirect("add_vehicle.jsp?Failed");
        }
    } catch (Exception e) {
    }
%>

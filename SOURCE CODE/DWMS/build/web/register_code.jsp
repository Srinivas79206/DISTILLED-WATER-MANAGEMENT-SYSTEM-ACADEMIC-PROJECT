<%-- 
    Document   : register_code
    Created on : Jan 27, 2020, 1:03:02 PM
    Author     : java1
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DWMS.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String Username = fname + " " + lname;
    String Qualification = request.getParameter("qualification");
    String Number = request.getParameter("phone");
    String Email = request.getParameter("email");
    String user_type = request.getParameter("user_type");
    String Address = request.getParameter("address");
    String pass = request.getParameter("pass");
    String rpass = request.getParameter("rpass");
    
    String statuss = "Waiting";

    System.out.println("name : " + Username + "\n pass : " + pass + "\n email : " + Email + "\n phone : " + Number + " \n address : " + Address);
    Connection con = SQLconnection.getconnection();
    Statement st = con.createStatement();
    try {
        Statement st1 = con.createStatement();
            ResultSet rs = st1.executeQuery("select * from user_reg where Email='" + Email + "'");
            int count = 0;
            while (rs.next()) {

                count++;
            }
            if (count > 0) {
                response.sendRedirect("register.jsp?mailid_Already_Exist");
            } else {

        int in = st.executeUpdate("insert into user_reg(Username, Qualification, Number, Email, user_type, Address, pass, rpass, statuss)values('" + Username + "','" + Qualification + "','" + Number + "','" + Email + "','" + user_type + "','" + Address + "','" + pass + "','" + rpass + "','" + statuss + "')");
        if (in != 0) {
            response.sendRedirect("user.jsp?success");
        } else {
            response.sendRedirect("register.jsp?Failed");
        }
    }
    }catch (Exception ex) {
        ex.printStackTrace();
    }
%>

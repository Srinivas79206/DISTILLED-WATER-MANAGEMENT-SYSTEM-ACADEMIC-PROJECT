<%-- 
    Document   : con_approve
    Created on : Jan 31, 2020, 11:09:53 AM
    Author     : java1
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Statement"%>
<%@page import="DWMS.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String cs_id= request.getParameter("cs_id");

Connection connection =SQLconnection.getconnection();
Statement statement =connection.createStatement();
Statement statement1 =connection.createStatement();

try
{
int i =statement.executeUpdate("Update containers set statuss='Approved' where cs_id='"+cs_id+"'");
if(i !=0)
       {
    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date date = new Date();
            String time = dateFormat.format(date);
            System.out.println("Date and Time : " + time);
    int j=statement1.executeUpdate("insert into quality_tester(approvals, dis_approvals, cs_id,time)values('1','0','"+cs_id+"','"+time+"')");
    response.sendRedirect("Quality_Check.jsp?Approved");
}
else
       {
    response.sendRedirect("Quality_Check.jsp?Rejected");
}
}
catch(Exception e){
}




%>
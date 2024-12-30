<%-- 
    Document   : index
    Created on : Jan 24, 2020, 1:01:44 PM
    Author     : java1
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="DWMS.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>DISTILLED_WATER_MANAGEMENT_SYSTEM</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">

    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-gear"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">DISTILLED WATER MANAGEMENT</div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">


                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Interface
                </div>

                <li class="nav-item">
                    <a class="nav-link" href="user_home.jsp">
                        <i class="fas fa-user-shield"></i>
                        <span>User Home</span></a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="view_product.jsp">
                        <i class="fas fa-clipboard-check"></i>
                        <span>View Product</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="my_orders.jsp">
                        <i class="fas fa-truck-pickup"></i>
                        <span>My Orders</span></a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">
                        <i class="fas fa-truck-pickup"></i>
                        <span>Logout</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>

            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content">

                <!-- Begin Page Content -->
                <div class="container-fluid">


                    <div class="card shadow mb-4">
                       
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Products</h6>
                        </div>
                        <%
                            Connection con = SQLconnection.getconnection();
                            Statement st = con.createStatement();
                            try {
                                ResultSet rs = st.executeQuery("SELECT * FROM containers where statuss='Approved' ");
                                while (rs.next()) {
                        %>
                        <div class="card-body">
                            <div class="text-center">
                               <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;" src="picture.jsp?uid=<%=rs.getString("cs_id")%>" alt="">
                            </div>
                            <!--                  <a target="_blank" rel="nofollow" href="#">Buy &rarr;</a>-->
                        </div>
                        <form action="checkout.jsp" method="get">     
                    <div class="row">
                         
                         <div class="col-lg-4 mb-4">
                            <div class="card bg-success text-white shadow">
                                <div class="card-body">
                                    Weight  : <%=rs.getString("Weight")%> L
                                </div>
                            </div>
                        </div>
                         <div class="col-lg-4 mb-4">
                            <div class="card bg-success text-white shadow">
                                <div class="card-body">
                                    Expiry Date : <%=rs.getString("expiry_date")%>
                                </div>
                            </div>
                        </div>
                         <div class="col-lg-4 mb-4">
                            <div class="card bg-success text-white shadow">
                                <div class="card-body">
                                    Manufacture Date : <%=rs.getString("mfd")%>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 mb-4">
                            <div class="card bg-success text-white shadow">
                                <div class="card-body">
                                    Price : Rs <%=rs.getString("price")%> 
                                </div>
                            </div>
                        </div>
                       
                            <div class="col-lg-4 mb-4">
                                Select Quantity &nbsp;<input style="background-color: #bff0de" name="quantity" required="" type="number" value="1" min="1">
                                <input type="hidden" value="<%=rs.getString("cs_id")%>" name="id">
                            </div>
                              <div class="col-lg-4 mb-4">
                                  Delivery Time &nbsp;<input style="background-color: #bff0de" name="del_time" required="" type="datetime-local" >
                            </div>
                    </div>
                            <center> <button type="submit" class="btn btn-primary" >Buy</button></center>
                             </form>

                    <hr>
                    <%                                        }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                    %>

                    <!-- Footer -->
                    <footer class="sticky-footer bg-white">
                        <div class="container my-auto">
                            <div class="copyright text-center my-auto">
                                <span></span>
                            </div>
                        </div>
                    </footer>
                    <!-- End of Footer -->

                </div>
                <!-- End of Content Wrapper -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>



        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="vendor/chart.js/Chart.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="js/demo/chart-area-demo.js"></script>
        <script src="js/demo/chart-pie-demo.js"></script>

    </body>

</html>


    <%-- 
    Document   : index
    Created on : Jan 24, 2020, 1:01:44 PM
    Author     : java1
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DWMS.SQLconnection"%>
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
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="Tester.jsp">
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
                    <a class="nav-link" href="Trans_home.jsp">
                        <i class="fas fa-user-shield"></i>
                        <span>Transporter Home</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="add_vehicle.jsp">
                        <i class="fas fa-user-shield"></i>
                        <span>Add Vehicle</span></a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="trans_orders.jsp">
                        <i class="fas fa-clipboard-check"></i>
                        <span>Transport Orders</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Delivery.jsp">
                        <i class="fas fa-clipboard-check"></i>
                        <span>Delivery</span></a>
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
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    </nav>
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800">DISTILLED WATER MANAGEMENT SYSTEM</h1>
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Orders</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>order_id</th>
                                                <th>containers</th>
                                                <th>delivery_time</th>
                                                <th>delivery_place</th>
                                                <th>user_id</th>
                                                <th>transporter_id</th>
                                                <th>price</th>
                                                <th>status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                String tname=(String)session.getAttribute("tname");
                                                Connection con = SQLconnection.getconnection();
                                                Statement st = con.createStatement();
                                                try {
                                                    ResultSet rs = st.executeQuery("SELECT * FROM orders where transporter_id='"+tname+"' and statuss='Waiting For Delivery'");
                                                    while (rs.next()) {
                                            %>
                                            <tr>
                                                <td><%=rs.getString("order_id")%></td>
                                                <td><%=rs.getString("containers")%></td>
                                                <td><%=rs.getString("delivery_time")%></td>
                                                <td><%=rs.getString("delivery_place")%></td>
                                                <td><%=rs.getString("user_id")%></td>
                                                <td><%=rs.getString("transporter_id")%></td>
                                                <td><%=rs.getString("price")%></td>
                                                <td><%=rs.getString("statuss")%></td>
                                                <td><a href="add_v.jsp?order_id=<%=rs.getString("order_id")%>" class="btn btn-success">Add Vehicle</a></td>
                                            </tr>
                                             <%                                        }
                                        } catch (Exception ex) {
                                            ex.printStackTrace();
                                        }

                                    %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>



                </div>
                <!-- End of Main Content -->

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


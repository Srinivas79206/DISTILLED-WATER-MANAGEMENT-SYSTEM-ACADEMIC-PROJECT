<%-- 
    Document   : index
    Created on : Jan 24, 2020, 1:01:44 PM
    Author     : java1
--%>

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
<%
            if (request.getParameter("mailid_Already_Exist") != null) {%>
        <script>alert('Mail id Already Exist');</script>  
        <%}
        %>
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
        <a class="nav-link" href="user.jsp">
          <i class="fas fa-fw fa-user"></i>
          <span>Users</span></a>
      </li>

      
      <li class="nav-item">
        <a class="nav-link" href="Admin.jsp">
          <i class="fas fa-user-shield"></i>
          <span>Admin</span></a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="Tester.jsp">
          <i class="fas fa-clipboard-check"></i>
          <span>Tester</span></a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="Transporter.jsp">
          <i class="fas fa-truck-pickup"></i>
          <span>Transporter</span></a>
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

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800"></h1>
            <!--<a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i>Generate Report</a>-->
          </div>
          <div class="row">
          <div class="col-lg-3 d-none d-lg-block"></div>
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
              </div>
                <form class="user" action="register_code.jsp" method="get" >
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                      <input type="text" required="" class="form-control form-control-user" id="exampleFirstName" name="fname" placeholder="First Name">
                  </div>
                  <div class="col-sm-6">
                      <input type="text" required="" class="form-control form-control-user" id="exampleLastName" name="lname" placeholder="Last Name">
                  </div>
                </div>
                <div class="form-group">
                    <input type="text" required="" class="form-control form-control-user" id="exampleInputEmail" name="qualification" placeholder="Qualification">
                </div>
                
                <div class="form-group">
                    <input type="text" required="" class="form-control form-control-user" id="exampleInputEmail" name="phone" placeholder="Phone Number">
                </div>
                <div class="form-group">
                    <input type="email" required="" class="form-control form-control-user" id="exampleInputEmail" name="email"placeholder="Email Address">
                </div>
                    <div class="form-group">
                    <label class="btn btn-primary btn-icon-split">Select User Type</label>
                    </div>
                <div class="form-group" >
                    <Select class="form-control"  name="user_type" required="" >
                        <option value="Student">Student</option>
                        <option value="Teacher">Teacher</option>
                        <option value="Vendor">Vendor</option>
                    </select>
                </div>
                    <div class="form-group">
                        <textarea class="form-control" name="address" placeholder="Communication Address" required=""></textarea>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                      <input type="password" id="password" class="form-control form-control-user" id="exampleInputPassword" name="pass" placeholder="Password" required="">
                  </div>
                  <div class="col-sm-6">
                      <input type="password" id="confirm_password" class="form-control form-control-user" id="exampleRepeatPassword" name="rpass" placeholder="Repeat Password" required="" >
                  </div>
                </div>
                    <button type="submit" class="btn btn-primary btn-user btn-block">
                  Register Account
                </button>
                     </form>
                <hr>
              <div class="text-center">
                  <a class="small" href="user.jsp">Already have an account? Login!</a>
              </div>
            </div>
          </div>
        </div>
        </div>
        <!-- /.container-fluid -->

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
  <script>
      var password = document.getElementById("password")
  , confirm_password = document.getElementById("confirm_password");

function validatePassword(){
  if(password.value != confirm_password.value) {
    confirm_password.setCustomValidity("Passwords Don't Match");
  } else {
    confirm_password.setCustomValidity('');
  }
}

password.onchange = validatePassword;
confirm_password.onkeyup = validatePassword;
  </script>
</body>

</html>


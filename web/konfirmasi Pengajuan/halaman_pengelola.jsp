<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%    String host = "jdbc:mysql://localhost:3306/projek_sistemkeuanganlab";
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(host, "root", "");
        String query = "select id,id_ail,nama_barang,jumlah_barang,deskripsi,ket,DATE_FORMAT(tanggal_pengajuan,'%d %M %Y') as tanggal,status from form_pengajuan ORDER by CASE WHEN ket = 'penting' THEN 1 WHEN ket = 'segera' THEN 2 ELSE 3 END;";
        Statement stmt = conn.createStatement();
        ResultSet rs = null;
        rs = stmt.executeQuery(query);
%>   
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Konfirmasi Pengajuan</title>
        <link href="../Assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
        <link href="../Assets/css/sb-admin-2.min.css" rel="stylesheet">
        <link rel="icon" type="image/png" href="../Assets/img/file.svg" />
        <link href=" ../Assets/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    </head>
     <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="../Memvalidasi Laporan/halaman_validasi.jsp">
                    <div class="sidebar-brand-icon">
                        <img width="70" style="filter: gray-scale(100%);" src="http://localhost:8080/SIKEL_Ganjil/Assets/img/icon.png" alt="icon"/>
                    </div>
                    <div class="sidebar-brand-text mx-3">SIKEL PCR </div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="../Memvalidasi Laporan/halaman_validasi.jsp">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Nav Item -->

                <li class="nav-item">
                    <a class="nav-link" href="../konfirmasi Pengajuan/halaman_pengelola.jsp">
                        <i class="fas fa-fw fa-clipboard-list"></i>
                        <span>Konfirmasi Pengajuan</span></a>
                </li>
                <hr class="sidebar-divider">

                <li class="nav-item">
                    <a class="nav-link" href="../Memvalidasi Laporan/halaman_validasi.jsp">
                        <i class="fas fa-fw fa-archive"></i>
                        <span>Validasi LPJ</span></a>
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

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>

                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">
                            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                            <li class="nav-item dropdown no-arrow d-sm-none">
                                <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-search fa-fw"></i>
                                </a>
                                <!-- Dropdown - Messages -->
                                <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                     aria-labelledby="searchDropdown">
                                    <form class="form-inline mr-auto w-100 navbar-search">
                                        <div class="input-group">
                                            <input type="text" class="form-control bg-light border-0 small"
                                                   placeholder="Search for..." aria-label="Search"
                                                   aria-describedby="basic-addon2">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary" type="button">
                                                    <i class="fas fa-search fa-sm"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </li>

                            <div class="topbar-divider d-none d-sm-block"></div>

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%= (String) session.getAttribute("First Name")%></span><br>
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%= (String) session.getAttribute("Hak_Akses")%></span>

                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                     aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Profile
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Settings
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Activity Log
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>

                        </ul>

                    </nav>
                    <!-- End of Topbar -->

                    <div style="margin: 60px">
                        <!-- Begin Page Content -->
                        <div class="container-fluid">
                            <!-- Page Heading -->
                            <h1 class="h3 mb-2 text-gray-800"><b>Konfirmasi Pengajuan</b></h1>

                            <!-- DataTales  -->
                            <div style="padding: 30px">
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                                <thead>
                                                    <tr  style="background-color: #007bff; color: white">
                                                        <th style="width: 30px">No</th>
                                                        <th style="width: 200px" >Nama KaLab</th>
                                                        <th>Nama Barang</th>
                                                        <th style="width: 120px">Jumlah Barang</th>
                                                        <th style="width: 150px">Tanggal Pengajuan</th>
                                                        <th style="width: 200px">Deskripsi</th>
                                                        <th>Status</th>
                                                        <th>Aksi</th>
                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                    <tr>
                                                        <th style="width: 30px">No</th>
                                                        <th>Nama Kalab</th>
                                                        <th>Nama Barang</th>
                                                        <th>Jumlah Barang</th>
                                                        <th>Tanggal Pengajuan</th>
                                                        <th>Deskripsi</th>
                                                        <th>Status</th>
                                                        <th>Aksi</th>
                                                    </tr>
                                                </tfoot>
                                                <tbody>
                                                    <% int i = 1;
                                                        while (rs.next()) {
                                                            if (rs.getString("status").equalsIgnoreCase("menunggu")) {
                                                    %>
                                                    <tr>
                                                        <td style="text-align: center"><%=i%><% i++;%></td>
                                                        <td>
                                                            <%
                                                                String query2 = "select nama_ail from ail where id_ail='" + rs.getString("id_ail") + "'";
                                                                Statement stmt2 = conn.createStatement();
                                                                ResultSet rs2 = null;
                                                                rs2 = stmt2.executeQuery(query2);
                                                                while (rs2.next()) {
                                                            %>
                                                            <%=rs2.getString("nama_ail")%>
                                                            <%
                                                                }
                                                                rs2.close();
                                                                stmt2.close();
                                                            %>
                                                        </td>
                                                        <td> <%=rs.getString("nama_barang")%></td>
                                                        <td> <%=rs.getString("jumlah_barang")%></td>
                                                        <td> <%=rs.getString("tanggal")%></td>
                                                        <td> <%=rs.getString("deskripsi")%></td>
                                                        <td><p style="color: 
                                                               <%
                                                                   if (rs.getString("ket").equalsIgnoreCase("penting")) {%>
                                                               RED; font-weight: bold
                                                               <%} else {%>
                                                               .bg-gray-800;
                                                               <%  }
                                                               %>
                                                               ">
                                                                <%=rs.getString("ket")%>

                                                            </p></td>
                                                        <td>
                                                            <form style="margin: 0; display: initial" action="../kelola" method="POST">
                                                                <input type="hidden" name="id" value="<%=rs.getString("id")%>">
                                                                <input type="hidden" name="nama" value="<%=rs.getString("nama_barang")%>">
                                                                <input type="hidden" name="id_ail" value="<%=rs.getString("id_ail")%>">
                                                                <input type="hidden" name="komentar" value="--">
                                                                <input type="hidden" name="status" value="terima">
                                                                <button type="submit" class="btn btn-primary">Terima</button>
                                                            </form>
                                                            <a  style="margin-left: 10px;color: white" class="btn btn-danger" data-toggle="modal" data-target="#<%=rs.getString("id")%>">Tolak</a>
                                                        </td>
                                                    </tr>
                                                <div class="modal fade" id="<%=rs.getString("id")%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <form action="../kelola" method="POST" >
                                                                    <h5 class="modal-title" id="exampleModalLabel">Komentar</h5>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <input type="hidden" name="id" value="<%=rs.getString("id")%>">
                                                                <input type="hidden" name="id_ail" value="<%=rs.getString("id_ail")%>">
                                                                <input type="hidden" name="nama" value="<%=rs.getString("nama_barang")%>">
                                                                <input type="hidden" name="status" value="tolak">
                                                                <textarea type="text" style="width: 100%; height: 150px" name="komentar"></textarea>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button value="submit" type="submit" class="btn btn-primary">Submit</button>
                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                </form>
                                                <%
                                                        }
                                                    }
                                                %>
                                                </tbody>
                                            </table>
                                        </div>
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
                                <span>Sistem Keuangan Lab | Kemlompok 3</span>
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

            <!-- Logout Modal-->
            <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                            <a class="btn btn-primary" href="../AksesLogin/Login.jsp">Logout</a>
                        </div>
                    </div>
                </div>
            </div>
            <script src=" ../Assets/vendor/jquery/jquery.min.js"></script>
            <script src=" ../Assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <!-- Core plugin JavaScript-->
            <script src=" ../Assets/vendor/jquery-easing/jquery.easing.min.js"></script>
            <!-- Custom scripts for all pages-->
            <script src="js/sb-admin-2.min.js"></script>
            <!-- Page level plugins -->
            <script src=" ../Assets/vendor/datatables/jquery.dataTables.min.js"></script>
            <script src=" ../Assets/vendor/datatables/dataTables.bootstrap4.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="../Assets/js/demo/datatables-demo.js"></script>
            <!--<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>--> 
            <%
                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (SQLException ex) {
                    out.print("Gagal Koneksi" + ex);
                } catch (Exception ex) {
                    out.print(ex.getMessage());
                }
            %>
    </body>
</html>
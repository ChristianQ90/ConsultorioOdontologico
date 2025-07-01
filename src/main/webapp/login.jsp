

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Login Clínica Odontológica</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<%
    Boolean adminVerificado = (Boolean) session.getAttribute("adminVerificado");
    if (adminVerificado == null || !adminVerificado) {
%>
    <body class="bg-gradient-primary" onload="document.getElementById('autoForm').submit();">
    <form id="autoForm" action="SvUsuAdmin" method="POST">
        <input type="hidden" name="rol" value="Admin">
    </form>
<%
    } else {
%>
    <body class="bg-gradient-primary">
<%
    }
%>
 
    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Ingreso Clínica</h1>
                                    </div>
                                    <form class="user" action="SvLogin" method="POST">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                   id="usuario" name="usuario"
                                                placeholder="Usuario">
                                        </div>
                                        <div class="form-group position-relative">
                                            <input type="password" class="form-control form-control-user" 
                                                   id="contrasenia" name="contrasenia" placeholder="Contraseña">
                                            <span onclick="togglePassword()" 
                                                style="position: absolute; top: 50%; right: 20px; transform: translateY(-50%); cursor: pointer;">
                                                <i class="fas fa-eye" id="toggleIcon"></i>
                                            </span>
                                        </div>
                                       
                                        <button class="btn btn-primary btn-user btn-block" type="submit" >
                                            Ingresar
                                        </button>
                                        
                                        
                                    </form>
                                    
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Para mostrar contraseña -->
    <script>
       function togglePassword() {
           const password = document.getElementById("contrasenia");
           const icon = document.getElementById("toggleIcon");

           if (password.type === "password") {
               password.type = "text";
               icon.classList.remove("fa-eye");
               icon.classList.add("fa-eye-slash");
           } else {
               password.type = "password";
               icon.classList.remove("fa-eye-slash");
               icon.classList.add("fa-eye");
           }
       }
   </script>
    
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>
    
</body>
</html>

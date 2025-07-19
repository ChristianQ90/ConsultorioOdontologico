<%@page import="logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/header.jsp"%>
<%@include file="components/bodyprimeraparte.jsp"%>

<h1>Edición de Usuarios</h1>
<p>Este es el apartado para modificar un usuario del sistema.</p>

<%Usuario usu = (Usuario)request.getSession().getAttribute("usuEditar"); %>

<form class="user" action="SvEditarUsuarios" method="POST">
                                <div class="form-group col">
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" id="nombreusu" name="nombreusu"
                                            value="<%=usu.getNombreUsuario() %>" placeholder="Nombre Usuario">
                                    </div>
                                    <div class="col-sm-6 mb-3 position-relative">
                                        <input type="password" class="form-control form-control-user" id="contrasenia" name="contrasenia"
                                            value="<%=usu.getContrasenia() %>" placeholder="Contraseña">
                                            <span onclick="togglePassword()" 
                                                style="position: absolute; top: 50%; right: 30px; transform: translateY(-50%); cursor: pointer;">
                                                <i class="fas fa-eye" id="toggleIcon"></i>
                                            </span>
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <select class="form-control form-control" id="rol" name="rol" style="border-radius: 2rem; height: 3rem; font-size: 14;" required>
                                            <option value="<%=usu.getRol()%>"><%=usu.getRol()%> ( rol actual )</option>
                                            <option value="Secretario/a">Secretario/a</option>
                                            <option value="Odontologo/a">Odontólogo/a</option>
                                        </select>
                                    </div>
                                    
                                <button class="btn btn-primary btn-user btn-block" type="submit" >
                                    Guardar Modificación
                                </button>
                            </form>
                                            
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
    
<%@include file="components/bodyfinal.jsp"%>


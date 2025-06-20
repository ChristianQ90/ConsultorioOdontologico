<%@page import="logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/header.jsp"%>
<%@include file="components/bodyprimeraparte.jsp"%>

<h1>Edición de Usuarios</h1>
<p>Este es el apartado para modificar un usuarios del sistema.</p>

<%Usuario usu = (Usuario)request.getSession().getAttribute("usuEditar"); %>

<form class="user" action="SvEditarUsuarios" method="POST">
                                <div class="form-group col">
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" id="nombreusu" name="nombreusu"
                                            value="<%=usu.getNombreUsuario() %>" placeholder="Nombre Usuario">
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <input type="password" class="form-control form-control-user" id="contrasenia" name="contrasenia"
                                            value="<%=usu.getContrasenia() %>" placeholder="Contraseña">
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" id="rol" name="rol"
                                            value="<%=usu.getRol() %>" placeholder="Rol">
                                    </div>
                                    
                                <button class="btn btn-primary btn-user btn-block" type="submit" >
                                    Guardar Modificación
                                </button>
                            </form>
<%@include file="components/bodyfinal.jsp"%>


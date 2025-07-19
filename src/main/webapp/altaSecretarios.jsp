
<%@page import="logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/header.jsp"%>
<%@include file="components/bodyprimeraparte.jsp"%>

<h1>Alta Secretarios</h1>
<p>Recuerde que antes de crear un Secretario es necesario crear un <b>Usuario</b> con su contraseña al cuál será vinculado.</p>
<form class="user" action="SvSecretario" method="POST">
                                <div class="form-group col">
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" id="dni" name="dni"
                                               placeholder="DNI" required>
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" id="nombre" name="nombre"
                                               placeholder="Nombre" required>
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" id="apellido" name="apellido"
                                               placeholder="Apellido" required>
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" id="telefono" name="telefono"
                                               placeholder="Teléfono" required>
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" id="direccion" name="direccion"
                                               placeholder="Dirección" required>
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <label class="form-check-label" for="fechanac" >Fecha de Nacimiento: </label>
                                        <input type="date" class="form-control form-control-user" id="fechanac" name="fechanac"
                                               placeholder="Fecha Nac" required>
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <label class="form-check-label" for="sector">Sector:</label>
                                        <select class="form-control form-control" id="sector" name="sector" style="border-radius: 2rem; height: 3rem; font-size: 14px;" required>
                                            <option value="" disabled selected>Seleccione sector</option>
                                            <option value="Recepcion y Gestion de Turnos">Recepción y Gestión de Turnos</option>
                                            <option value="Administracion">Administración</option>
                                            <option value="Caja">Caja</option>
                                            <option value="Atencion telefonica y Autorizaciones">Atención telefónica y Autorizaciones</option>
                                        </select>
                                    </div>
                                </div>

                                <% 
                                    List<Usuario> listaUsuarios =(List) request.getSession().getAttribute("listaUsuSecreSinAsignar");
                                %>
                                <div class="form-group row" style="margin-left: 1rem">
                                    <div class="col-sm-6 mb-3">
                                        <label class="form-check-label" for="usuario">Usuario asociado al Secretario:</label>
                                        <select class="form-control form-control" id="usuario" name="usuario" style="border-radius: 2rem; height: 3rem; font-size: 14;" required>
                                            <% for (Usuario usu : listaUsuarios){%>
                                            <option value="<%=usu.getId_usuario()%>"><%=usu.getNombreUsuario()%></option>
                                            <%}%>
                                        </select>
                                   </div>
                                </div>

                                <button class="btn btn-primary btn-user btn-block" type="submit" >
                                    Crear Secretario
                                </button>
                            </form>

                                      
<%@include file="components/bodyfinal.jsp"%>


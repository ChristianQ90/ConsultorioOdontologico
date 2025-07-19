<%@page import="logica.Secretario"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/header.jsp"%>
<%@include file="components/bodyprimeraparte.jsp"%>

<h1>Edición de Secrectarios</h1>
<p>Este es el apartado para modificar un Secretario del sistema.</p>
<% Secretario secreEditar = (Secretario)request.getSession().getAttribute("secreEditar");%>
<form class="user" action="SvEditarSecretarios" method="POST">
                                <div class="form-group col">
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" id="dni" name="dni"
                                               placeholder="DNI" value="<%=secreEditar.getDni() %>" required>
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" id="nombre" name="nombre"
                                               placeholder="Nombre" value="<%=secreEditar.getNombre() %>" required>
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" id="apellido" name="apellido"
                                               placeholder="Apellido" value="<%=secreEditar.getApellido() %>" required>
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" id="telefono" name="telefono"
                                               placeholder="Teléfono" value="<%=secreEditar.getTelefono() %>" required>
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" id="direccion" name="direccion"
                                               placeholder="Dirección" value="<%=secreEditar.getDireccion() %>" required>
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <%  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                            String fechaFormateada = sdf.format(secreEditar.getFecha_nacimiento() ); %>
                                        <label class="form-check-label" for="fechanac" >Fecha de Nacimiento: </label>
                                        <input type="date" class="form-control form-control-user" id="fechaNac" name="fechaNac"
                                               placeholder="Fecha Nac" value="<%=fechaFormateada %>" required>
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <label class="form-check-label" for="sector">Sector:</label>
                                        <select class="form-control form-control" id="sector" name="sector" style="border-radius: 2rem; height: 3rem; font-size: 14;" required>
                                            <option value="<%=secreEditar.getSector() %>"><%=secreEditar.getSector() %> (Sector actual)</option>
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
                                        <select class="form-control form-control" id="usuario" name="usuario" style="border-radius: 2rem; height: 3rem; font-size: 14px;" required>
                                            <option value="<%=secreEditar.getUnUsuario().getId_usuario() %>"><%=secreEditar.getUnUsuario().getNombreUsuario() %> (Usuario asignado actual)</option>
                                            <% for (Usuario usu : listaUsuarios){%>
                                            <option value="<%=usu.getId_usuario()%>"><%=usu.getNombreUsuario()%></option>
                                            <%}%>
                                        </select>
                                   </div>
                                </div>

                                <button class="btn btn-primary btn-user btn-block" type="submit" >
                                    Guardar Modificación
                                </button>
                            </form>

    
                                            
                                            
    <%@include file="components/bodyfinal.jsp"%>

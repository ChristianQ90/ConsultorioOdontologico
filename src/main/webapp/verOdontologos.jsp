<%@page import="logica.Horario"%>
<%@page import="logica.Odontologo"%>
<%@page import="logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/header.jsp"%>
<%@include file="components/bodyprimeraparte.jsp"%>


                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Ver Odontólogos</h1>
                    <p class="mb-4">A continuación podrá visualizar la lista completa de odontólogos.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Odontólogos</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Nombre</th>
                                            <th>Apellido</th>
                                            <th>Especialidad</th>
                                            <th>Teléfono</th>
                                            <th>Días de Atención</th>
                                            <th>Hora Inicio</th>
                                            <th>Hora Fin</th>
                                            <th>Nombre de Usuario</th>
                                            <th style="width: 210px">Acción</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Id</th>
                                            <th>Nombre</th>
                                            <th>Apellido</th>
                                            <th>Especialidad</th>
                                            <th>Teléfono</th>
                                            <th>Días de Atención</th>
                                            <th>Hora Inicio</th>
                                            <th>Hora Fin</th>
                                            <th>Nombre de Usuario</th>
                                            <th style="width: 210px">Acción</th>
                                        </tr>
                                    </tfoot>
                                    <% 
                                    List<Odontologo> listaOdontologos =(List) request.getSession().getAttribute("listaOdontologos");
                                    List<Horario> listaHorarios =(List) request.getSession().getAttribute("listaHorarios");
                                    List<Usuario> listaUsuariosOdonto =(List) request.getSession().getAttribute("listaUsuariosOdonto");
                                    %>
                                    <tbody>
                                        <% for (Odontologo odonto : listaOdontologos){%>
                                        <tr>
                                            <td id="id_odonto<%=odonto.getId() %>"><%=odonto.getId() %></td>
                                            <td><%=odonto.getNombre() %></td>
                                            <td><%=odonto.getApellido() %></td>
                                            <td><%=odonto.getEspecialidad() %></td>
                                            <td><%=odonto.getTelefono() %></td>
                                            <% for (Horario horario : listaHorarios){
                                                if(horario.getId_horario() == odonto.getUnHorario().getId_horario()){ %>
                                                <td><%=horario.getDias_atencion() %></td>
                                                <td><%=horario.getHorario_incio() %></td>
                                                <td><%=horario.getHorario_fin() %></td>
                                                <% } %>
                                            <%}%>
                                            <% for (Usuario usu : listaUsuariosOdonto){
                                                if(usu.getId_usuario() == odonto.getUnUsuario().getId_usuario()){ %>
                                                <td><%=usu.getNombreUsuario() %></td>
                                                <% } %>
                                            <%}%>
                                            <td style="display: flex; width: 230px;">
                                                <form name="eliminar" action="SvEliminarOdontologos" method="POST"><!-- Enviamos a este servlet mediante POST-->
                                                    <button class="btn btn-primary btn-user btn-block" type="submit" style="background-color: red; margin-right: 5px;" >
                                                        <i class="fas fa-trash-alt"></i> Eliminar
                                                    </button>
                                                    <input type="hidden" name="id" value="<%=odonto.getId() %>"> <!-- Esto es para mandar el código al servlet -->
                                                </form>
                                                
                                                <form name="editar" action="SvEditarOdontologos" method="GET"><!-- Enviamos a este servlet mediante POST-->
                                                    <button class="btn btn-primary btn-user btn-block" type="submit" style="margin-left: 5px;" >
                                                        <i class="fas fa-pencil-alt"></i> Editar
                                                    </button>
                                                    <input type="hidden" name="id" value="<%=odonto.getId() %>"> <!-- Esto es para mandar el código al servlet -->
                                                </form>
                                            </td>
                                        </tr>   
                                        <%}%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>


<%@include file="components/bodyfinal.jsp"%>


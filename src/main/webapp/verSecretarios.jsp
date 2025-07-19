<%@page import="logica.Secretario"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Responsable"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/header.jsp"%>
<%@include file="components/bodyprimeraparte.jsp"%>


                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Ver Secretarios</h1>
                    <p class="mb-4">A continuación podrá visualizar la lista completa de secretarios.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Secretarios</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Nombre</th>
                                            <th>Apellido</th>
                                            <th>Teléfono</th>
                                            <th>Fecha de Nacimiento</th>
                                            <th>Sector</th>
                                            <th>Usuario</th>
                                            <th style="width: 210px">Acción</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Id</th>
                                            <th>Nombre</th>
                                            <th>Apellido</th>
                                            <th>Teléfono</th>
                                            <th>Fecha de Nacimiento</th>
                                            <th>Sector</th>
                                            <th>Usuario</th>
                                            <th style="width: 210px">Acción</th>
                                        </tr>
                                    </tfoot>
                                    <% 
                                    List<Secretario> listaSecretarios =(List) request.getSession().getAttribute("listaSecretarios");
                                    %>
                                    <tbody>
                                        <% for (Secretario secre : listaSecretarios){%>
                                        <tr>
                                            <td id="id_resp <%=secre.getId() %>"><%=secre.getId() %></td>
                                            <td><%=secre.getNombre() %></td>
                                            <td><%=secre.getApellido() %></td>
                                            <td><%=secre.getTelefono() %></td>
                                            <%  SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                                            String fechaFormateada = sdf.format(secre.getFecha_nacimiento()); %>
                                            <td><%=fechaFormateada %></td>
                                            <td><%=secre.getSector() %></td>
                                            <td><%=secre.getUnUsuario().getNombreUsuario() %></td>
                                            
                                            <td style="display: flex; width: 230px;">
                                                <form name="eliminar" action="SvEliminarSecretarios" method="POST"><!-- Enviamos a este servlet mediante POST-->
                                                    <button class="btn btn-primary btn-user btn-block" type="submit" style="background-color: red; margin-right: 5px;" >
                                                        <i class="fas fa-trash-alt"></i> Eliminar
                                                    </button>
                                                    <input type="hidden" name="id" value="<%=secre.getId() %>"> <!-- Enviamos el id al servlet -->
                                                </form>
                                                
                                                <form name="editar" action="SvEditarSecretarios" method="GET">
                                                    <button class="btn btn-primary btn-user btn-block" type="submit" style="margin-left: 5px;" >
                                                        <i class="fas fa-pencil-alt"></i> Editar
                                                    </button>
                                                    <input type="hidden" name="id" value="<%=secre.getId() %>"> <!-- Enviamos el id al servlet -->
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

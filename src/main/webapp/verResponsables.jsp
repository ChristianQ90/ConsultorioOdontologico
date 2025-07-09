<%@page import="logica.Responsable"%>
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
                                            <th>DNI</th>
                                            <th>Teléfono</th>
                                            <th>Dirección</th>
                                            <th>Tipo de Responsabilidad</th>
                                            <th style="width: 210px">Acción</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Id</th>
                                            <th>Nombre</th>
                                            <th>Apellido</th>
                                            <th>DNI</th>
                                            <th>Teléfono</th>
                                            <th>Dirección</th>
                                            <th>Tipo de Responsabilidad</th>
                                            <th style="width: 210px">Acción</th>
                                        </tr>
                                    </tfoot>
                                    <% 
                                    List<Responsable> listaResponsables =(List) request.getSession().getAttribute("listaResponsables");
                                    %>
                                    <tbody>
                                        <% for (Responsable resp : listaResponsables){%>
                                        <tr>
                                            <td id="id_resp <%=resp.getId() %>"><%=resp.getId() %></td>
                                            <td><%=resp.getNombre() %></td>
                                            <td><%=resp.getApellido() %></td>
                                            <td><%=resp.getDni() %></td>
                                            <td><%=resp.getTelefono() %></td>
                                            <td><%=resp.getDireccion() %></td>
                                            <td><%=resp.getTipo_responsabilidad() %></td>
                                            
                                            <td style="display: flex; width: 230px;">
                                                <form name="eliminar" action="SvEliminarResponsables" method="POST"><!-- Enviamos a este servlet mediante POST-->
                                                    <button class="btn btn-primary btn-user btn-block" type="submit" style="background-color: red; margin-right: 5px;" >
                                                        <i class="fas fa-trash-alt"></i> Eliminar
                                                    </button>
                                                    <input type="hidden" name="id" value="<%=resp.getId() %>"> <!-- Esto es para mandar el código al servlet -->
                                                </form>
                                                
                                                <form name="editar" action="SvEditarResponsables" method="GET"><!-- Enviamos a este servlet mediante POST-->
                                                    <button class="btn btn-primary btn-user btn-block" type="submit" style="margin-left: 5px;" >
                                                        <i class="fas fa-pencil-alt"></i> Editar
                                                    </button>
                                                    <input type="hidden" name="id" value="<%=resp.getId() %>"> <!-- Esto es para mandar el código al servlet -->
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

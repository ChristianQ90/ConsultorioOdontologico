<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Paciente"%>
<%@page import="logica.Responsable"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/header.jsp"%>
<%@include file="components/bodyprimeraparte.jsp"%>


                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Ver Pacientes</h1>
                    <p class="mb-4">A continuación podrá visualizar la lista completa de pacientes.</p>

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
                                            <th>Fecha de Nacimiento</th>
                                            <th>Tiene Seg. Méd.</th>
                                            <th>Grupo Sanguíneo</th>
                                            <th>Responsable</th>
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
                                            <th>Fecha de Nacimiento</th>
                                            <th>Tiene Seg. Méd.</th>
                                            <th>Grupo Sanguíneo</th>
                                            <th>Responsable</th>
                                            <th style="width: 210px">Acción</th>
                                        </tr>
                                    </tfoot>
                                    <% 
                                    List<Paciente> listaPacientes =(List) request.getSession().getAttribute("listaPacientes");
                                    %>
                                    <tbody>
                                        <% for (Paciente pacien : listaPacientes){%>
                                        <tr>
                                            <td id="id_resp <%=pacien.getId() %>"><%=pacien.getId() %></td>
                                            <td><%=pacien.getNombre() %></td>
                                            <td><%=pacien.getApellido() %></td>
                                            <td><%=pacien.getDni() %></td>
                                            <td><%=pacien.getTelefono() %></td>
                                            <td><%=pacien.getDireccion() %></td>
                                            <%  SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                                            String fechaFormateada = sdf.format(pacien.getFecha_nacimiento()); %>
                                            <td><%=fechaFormateada %></td>
                                            <% if (pacien.isTieneSM()){ %>
                                                <td>Tiene</td>
                                            <%}else{ %>
                                                <td>No tiene</td>
                                            <%} %>
                                            <td><%=pacien.getTipoSangre() %></td>
                                            <% if (pacien.getResponsable()!= null){ %>
                                                <td><%=pacien.getResponsable().getNombre()+" "+ pacien.getResponsable().getApellido()+".\nDNI: "+pacien.getResponsable().getDni()+".\n("+pacien.getResponsable().getTipo_responsabilidad()+")" %></td>
                                            <%}else{ %>
                                                <td>Sin responsable</td>
                                            <%} %>
                                            
                                            <td style="display: flex; width: 230px;">
                                                <form name="eliminar" action="SvEliminarPacientes" method="POST"><!-- Enviamos a este servlet mediante POST-->
                                                    <button class="btn btn-primary btn-user btn-block" type="submit" style="background-color: red; margin-right: 5px;" >
                                                        <i class="fas fa-trash-alt"></i> Eliminar
                                                    </button>
                                                    <input type="hidden" name="id" value="<%=pacien.getId() %>"> <!-- Enviamos el id al servlet -->
                                                </form>
                                                
                                                <form name="editar" action="SvEditarPacientes" method="GET">
                                                    <button class="btn btn-primary btn-user btn-block" type="submit" style="margin-left: 5px;" >
                                                        <i class="fas fa-pencil-alt"></i> Editar
                                                    </button>
                                                    <input type="hidden" name="id" value="<%=pacien.getId() %>"> <!-- Enviamos el id al servlet -->
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

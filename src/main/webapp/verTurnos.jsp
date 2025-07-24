<%@page import="logica.Turno"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="logica.Horario"%>
<%@page import="logica.Odontologo"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/header.jsp"%>
<%@include file="components/bodyprimeraparte.jsp"%>

<%  Odontologo odontoTurnos = (Odontologo) request.getSession().getAttribute("odontoTurnos");
    List<Turno> listaTurnos = (List<Turno>)request.getSession().getAttribute("listaTurnos"); %>
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Ver Turnos</h1>
                    <p class="mb-4">A continuación podrá visualizar la lista completa de odontólogos. Seleccione la fecha a consultar y presione el botón <b>"Consultar Turnos"</b> para visualizar los mismos en la sección inferior. </p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Odontólogos y campo de fecha para consultar turnos</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="50%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Nombre</th>
                                            <th>Apellido</th>
                                            <th>Especialidad</th>
                                            <th>Días de Atención</th>
                                            <th>Horario de Atención</th>
                                            <th>Fecha a consultar</th>
                                            <th style="width: 210px">Acción</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Id</th>
                                            <th>Nombre</th>
                                            <th>Apellido</th>
                                            <th>Especialidad</th>
                                            <th>Días de Atención</th>
                                            <th>Horario de Atención</th>
                                            <th>Fecha a consultar</th>
                                            <th style="width: 190px">Acción</th>
                                        </tr>
                                    </tfoot>
                                    <% 
                                    List<Odontologo> listaOdontologos =(List) request.getSession().getAttribute("listaOdontoCompleta");
                                    List<Horario> listaHorarios =(List) request.getSession().getAttribute("listaHorarios");
                                    Date fechaTurno =(Date) request.getSession().getAttribute("fechaTurno");
                                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                    String fechaFormateada = sdf.format(fechaTurno );
                                    %>
                                    <tbody>
                                        <% for (Odontologo odonto : listaOdontologos){%>
                                        <tr>
                                            <td id="id_odonto<%=odonto.getId() %>"><%=odonto.getId() %></td>
                                            <td><%=odonto.getNombre() %></td>
                                            <td><%=odonto.getApellido() %></td>
                                            <td><%=odonto.getEspecialidad() %></td>
                                            <% for (Horario horario : listaHorarios){
                                                if(horario.getId_horario() == odonto.getUnHorario().getId_horario()){ %>
                                                <td><%=horario.getDias_atencion() %></td>
                                                <td><%=horario.getHorario_incio()+" - "+horario.getHorario_fin() %></td>
                                                <% } %>
                                            <%}%>
                                            <form name="visualizar" action="SvProcesarConsultaTurnos" method="GET">
                                            <td><input type="date" class="form-control" id="fechaTurno" name="fechaTurno"
                                                placeholder="Fecha Turno" value="<%=fechaFormateada %>" required></td>

                                            <td style="display: flex; width: 190px;">                                            
                                                
                                                    <button class="btn btn-primary btn-user btn-block" type="submit">
                                                        <i class="fas fa-solid fa-search"></i> Consultar Turnos
                                                    </button>
                                                    <input type="hidden" name="id" value="<%=odonto.getId() %>"> <!-- Enviamos el id al servlet -->
                                                </form>
                                            </td>
                                        </tr>   
                                        <%}%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
        <%if (odontoTurnos != null){ 
            String nombreApe = odontoTurnos.getNombre()+" "+odontoTurnos.getApellido();
            String especialidad = odontoTurnos.getEspecialidad();
            SimpleDateFormat sdf2 = new SimpleDateFormat("dd/MM/yyyy");
            String fechaFormateada2 = sdf2.format(fechaTurno );%>                        
            <p class="mb-4"><b>Odontólogo seleccionado:</b> <%=nombreApe%>. <b>Especialidad:</b> <%=especialidad%>. <b>Fecha consultada:</b> <%=fechaFormateada2 %>. </p>

            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Turnos con datos de Pacientes</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Horario</th>
                                    <th>Nombre</th>
                                    <th>Apellido</th>
                                    <th>DNI</th>
                                    <th>Teléfono</th>
                                    <th>Fecha Turno</th>
                                    <th>Afección</th>
                                    <th style="width: 210px">Acción</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>Horario</th>
                                    <th>Nombre</th>
                                    <th>Apellido</th>
                                    <th>DNI</th>
                                    <th>Teléfono</th>
                                    <th>Fecha Turno</th>
                                    <th>Afección</th>
                                    <th style="width: 210px">Acción</th>
                                </tr>
                            </tfoot>

                            <tbody>

                                <% for (Turno turno : listaTurnos) { %>
                                <tr>
                                    <td><%=turno.getHora_turno()%></td>
                                    <td><%=turno.getPacien().getNombre() %></td>
                                    <td><%=turno.getPacien().getApellido() %></td>
                                    <td><%=turno.getPacien().getDni() %></td>
                                    <td><%=turno.getPacien().getTelefono() %></td>
                                    <td><%=sdf2.format(turno.getFecha_turno() )%> </td>
                                    <td>  
                                        <div class="overflow-auto" style="max-height: 50px;">
                                         <%= turno.getAfeccion() %>
                                        </div>
                                    </td>
                                    
                                            <td style="display: flex; width: 230px;">
                                                <form name="eliminar" action="SvEliminarTurnos" method="POST">
                                                    <button class="btn btn-primary btn-user btn-block" type="submit" style="background-color: red; margin-right: 5px;" >
                                                        <i class="fas fa-trash-alt"></i> Eliminar
                                                    </button>
                                                    <input type="hidden" name="id" value="<%=turno.getId_turno() %>"> 
                                                </form>
                                                
                                                <form name="editar" action="SvEditarTurnos" method="GET">
                                                    <button class="btn btn-primary btn-user btn-block" type="submit" style="margin-left: 5px;" >
                                                        <i class="fas fa-pencil-alt"></i> Editar
                                                    </button>
                                                    <input type="hidden" name="id" value="<%=turno.getId_turno() %>"> 
                                                </form>
                                            </td>
                                    </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
         <%}%>
    </div>

<%@include file="components/bodyfinal.jsp"%>

<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Horario"%>
<%@page import="logica.Odontologo"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/header.jsp"%>
<%@include file="components/bodyprimeraparte.jsp"%>


<div class="container-fluid">

    <h1 class="h3 mb-2 text-gray-800">Filtrar Odontólogos</h1>
    <p class="mb-4">A continuación podrá filtrar para visualizar odontólogos según su especialidad y fecha solicitada.</p>
    <p class="mb-4">Para facilitar la asignación del nuevo Turno.</p>

    <%String especialidad =(String) request.getSession().getAttribute("especialidad");
      Date fechaTurno =(Date) request.getSession().getAttribute("fechaTurno");
      String diaTurno =(String) request.getSession().getAttribute("diaTurno");%>
    
    <%if (especialidad.isEmpty() || diaTurno.isEmpty()){%>
      <form class="user" action="SvFiltrarOdontologos" method="GET">
        <div class="col-sm-6 mb-3">
            <label class="form-check-label" for="especialidad" >Especialidad: </label>
            <select class="form-control form-control" id="especialidad" name="especialidad" style="border-radius: 2rem; height: 3rem; font-size: 14;" required>
                <option value="" disabled selected>Seleccione especialidad</option>
                <option value="Ortodoncia">Ortodoncia</option>
                <option value="Endodoncia">Endodoncia</option>
                <option value="Odontopediatria">Odontopediatría</option>
                <option value="Implantologia">Implantología</option>
                <option value="Periodoncia">Periodoncia</option>
                <option value="Cirugia bucal">Cirugía bucal</option>
                <option value="Rehabilitacion oral">Rehabilitación oral</option>
            </select>
        </div>
        <%  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String fechaFormateada = sdf.format(fechaTurno ); %>
        <div class="col-sm-6 mb-3">
            <label class="form-check-label" for="fechaTurno" >Fecha del Turno: </label>
            <input type="date" class="form-control form-control-user" id="fechaTurno" name="fechaTurno"
                placeholder="Fecha Turno" value="<%=fechaFormateada %>" required>
        </div>
        <button class="btn btn-primary btn-user btn-block" type="submit" >
            Consultar disponibilidad
        </button>
    </form>
    <%}else{%>
    <form class="user" action="SvFiltrarOdontologos" method="GET">
        <div class="col-sm-6 mb-3">
            <label class="form-check-label" for="especialidad" >Especialidad: </label>
            <select class="form-control form-control" id="especialidad" name="especialidad" style="border-radius: 2rem; height: 3rem; font-size: 14;" required>
                <option value="<%=especialidad %>"><%=especialidad %> (Especialidad consultada)</option>
                <option value="Ortodoncia">Ortodoncia</option>
                <option value="Endodoncia">Endodoncia</option>
                <option value="Odontopediatria">Odontopediatría</option>
                <option value="Implantologia">Implantología</option>
                <option value="Periodoncia">Periodoncia</option>
                <option value="Cirugia bucal">Cirugía bucal</option>
                <option value="Rehabilitacion oral">Rehabilitación oral</option>
            </select>
        </div>
        <%  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String fechaFormateada = sdf.format(fechaTurno ); %>
        <div class="col-sm-6 mb-3">
            <label class="form-check-label" for="fechaTurno" >Fecha del Turno: </label>
            <input type="date" class="form-control form-control-user" id="fechaTurno" name="fechaTurno"
                placeholder="Fecha Turno" value="<%=fechaFormateada %>" required>
        </div>
        <button class="btn btn-primary btn-user btn-block" type="submit" >
            Consultar disponibilidad
        </button>
    </form>
    <%  SimpleDateFormat sdf2 = new SimpleDateFormat("dd/MM/yyyy");
        String fechaFormateada2 = sdf2.format(fechaTurno ); %>
        <p class="mb-4" style="font-weight: bolder">Resultados para la consulta de Odontólogos con especialidad <%=especialidad%>, para el día <%=diaTurno %>, fecha <%=fechaFormateada2%>. </p>
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
                            <th style="width: 210px">Acción</th>
                        </tr>
                    </tfoot>
                    <% 
                    List<Odontologo> listaOdontologos =(List) request.getSession().getAttribute("listaOdontoFiltrada");
                    List<Horario> listaHorarios =(List) request.getSession().getAttribute("listaHorarioFiltrada");
                    if(!listaOdontologos.isEmpty()){ %>
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

                            <td style="display: flex; width: 190px;">
                                <form name="verDisponibilidad" action="SvVerDisponibilidadOdonto" method="GET">
                                    <button class="btn btn-primary btn-user btn-block" type="submit" style="background-color: green; margin-right: 5px;" >
                                        <i class="fas fa-calendar-plus"></i>  Ver disponibilidad
                                    </button>
                                    <input type="hidden" name="id" value="<%=odonto.getId() %>"> <!-- Enviamos el id al servlet -->
                                </form>
                                                
                            </td>
                        </tr>   
                        <%}%>
                    <%}%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <%}%>
</div>


<%@include file="components/bodyfinal.jsp"%>
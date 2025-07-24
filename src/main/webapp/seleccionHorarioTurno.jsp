<%@page import="java.time.LocalTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="logica.Turno"%>
<%@page import="logica.Odontologo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/header.jsp"%>
<%@include file="components/bodyprimeraparte.jsp"%>


<div class="container-fluid">

    <h1 class="h3 mb-2 text-gray-800">Selección de horarios para asignar turnos</h1>
    <p class="mb-4">A continuación podrá visualizar la agenda para asignar turnos a pacientes según lo seleccionado previamente:</p>

    <%String especialidad =(String) request.getSession().getAttribute("especialidad");
      Date fechaTurno =(Date) request.getSession().getAttribute("fechaTurno");
      String diaTurno =(String) request.getSession().getAttribute("diaTurno");
      SimpleDateFormat sdf2 = new SimpleDateFormat("dd/MM/yyyy");
      String fechaFormateada2 = sdf2.format(fechaTurno );  
      Odontologo odontoSeleccionado =(Odontologo) request.getSession().getAttribute("odontoSeleccionado");
      List<String>rangosHorarios =(List<String>) request.getSession().getAttribute("rangosHorarios");
      List<Turno>listaTurnos = (List<Turno>) request.getSession().getAttribute("listaTurnos"); %>
    
    <p class="mb-4"><b>Odontólogo seleccionado:</b> <%=odontoSeleccionado.getNombre()+" "+odontoSeleccionado.getApellido() %>.</p>
    <p class="mb-4"><b>Especialidad:</b> <%=especialidad%>.</p>
    <p class="mb-4"><b>Fecha seleccionada:</b> <%=fechaFormateada2%>. <b>Día:</b> <%=diaTurno %>. </p>

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
                        <%
                       DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HH:mm");

                       for (String rango : rangosHorarios) {
                           String[] partesRango = rango.split(" - ");
                           LocalTime inicioRango = LocalTime.parse(partesRango[0], dtf);
                           LocalTime finRango = LocalTime.parse(partesRango[1], dtf);

                           Turno turnoCoincidente = null;

                           for (Turno t : listaTurnos) {
                               String[] partesTurno = t.getHora_turno().split(" - ");
                               LocalTime inicioTurno = LocalTime.parse(partesTurno[0], dtf);
                               //LocalTime finTurno = LocalTime.parse(partesTurno[1], dtf);

                               // Verificamos si el turno empieza dentro del rango horario actual
                               if (!inicioTurno.isBefore(inicioRango) && inicioTurno.isBefore(finRango)) {
                                   turnoCoincidente = t;
                                   break;
                               }
                           }
                       %>
                       <tr>
                           <td><%=rango %></td>
                           <% if (turnoCoincidente != null) { %>
                               <td><%=turnoCoincidente.getPacien().getNombre() %></td>
                               <td><%=turnoCoincidente.getPacien().getApellido() %></td>
                               <td><%=turnoCoincidente.getPacien().getDni() %></td>
                               <td><%=turnoCoincidente.getPacien().getTelefono() %></td>
                               <td><%=sdf2.format(turnoCoincidente.getFecha_turno()) %></td>
                               <td>  
                                   <div class="overflow-auto" style="max-height: 70px;">
                                    <%= turnoCoincidente.getAfeccion() %>
                                   </div>
                               </td>
                               <td>
                                   <button class="btn btn-secondary btn-user btn-block" disabled>
                                       Turno ya asignado
                                   </button>
                               </td>
                           <% } else { %>
                               <td></td>
                               <td></td>
                               <td></td>
                               <td></td>
                               <td></td>
                               <td></td>
                               <td style="display: flex; width: 190px;">
                                   <form name="verDisponibilidad" action="SvRangoHorarioSeleccionado" method="GET">
                                       <button class="btn btn-primary btn-user btn-block" type="submit" style="background-color: green; margin-right: 5px;" >
                                           <i class="fas fa-calendar-plus"></i>  Asignar en este rango horario
                                       </button>
                                       <input type="hidden" name="rangoSeleccionado" value="<%=rango%>"> 
                                   </form>
                               </td>
                           <% } %>
                       </tr>
                       <% } %>
                    
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


<%@include file="components/bodyfinal.jsp"%>

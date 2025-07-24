<%@page import="logica.Paciente"%>
<%@page import="logica.Odontologo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/header.jsp"%>
<%@include file="components/bodyprimeraparte.jsp"%>


<div class="container-fluid">

    <h1 class="h3 mb-2 text-gray-800">Selección de paciente para asignar turno</h1>
    <p class="mb-4">A continuación podrá visualizar la lista de pacientes y filtrar en ella, por ejemplo a través de su DNI.</p>

    <p class="mb-4">Para de esta forma continuar con el proceso de asignación del turno según lo seleccionado previamente:</p>
    <%String especialidad =(String) request.getSession().getAttribute("especialidad");
      Date fechaTurno =(Date) request.getSession().getAttribute("fechaTurno");
      String diaTurno =(String) request.getSession().getAttribute("diaTurno");
      SimpleDateFormat sdf2 = new SimpleDateFormat("dd/MM/yyyy");
      String fechaFormateada2 = sdf2.format(fechaTurno );  
      Odontologo odontoSeleccionado =(Odontologo) request.getSession().getAttribute("odontoSeleccionado");

      String rangoSeleccionado = (String)request.getSession().getAttribute("rangoSeleccionado");
      List<Paciente> listaPacientes = (List<Paciente>)request.getSession().getAttribute("listaPacientes");
    %>
    
    <p class="mb-4"><b>Odontólogo seleccionado:</b> <%=odontoSeleccionado.getNombre()+" "+odontoSeleccionado.getApellido() %>.</p>
    <p class="mb-4"><b>Especialidad:</b> <%=especialidad%>.</p>
    <p class="mb-4"><b>Fecha seleccionada:</b> <%=fechaFormateada2%>. <b>Día:</b> <%=diaTurno %>. </p>
    <p class="mb-4"><b>Rango horario seleccionado:</b> <%=rangoSeleccionado%>.

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Pacientes</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="60%" cellspacing="0">
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
                                <form name="seleccionar" action="SvConfirmarTurno" method="GET">
                                    <button class="btn btn-primary btn-user btn-block" type="submit" style="background-color: green; margin-right: 5px;" >
                                        <i class="fas fa-calendar-plus"></i>  Seleccionar Paciente
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

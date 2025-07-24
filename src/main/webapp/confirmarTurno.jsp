<%@page import="logica.Paciente"%>
<%@page import="java.util.List"%>
<%@page import="logica.Odontologo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/header.jsp"%>
<%@include file="components/bodyprimeraparte.jsp"%>


<div class="container-fluid">

    <h1 class="h3 mb-2 text-gray-800">Confirmar Turno</h1>
    <p class="mb-4">A continuación verifique los datos ingresados anteriormente e indique la afección del paciente para concluir con el proceso de asignación de turno :</p>

    <%String especialidad =(String) request.getSession().getAttribute("especialidad");
      Date fechaTurno =(Date) request.getSession().getAttribute("fechaTurno");
      String diaTurno =(String) request.getSession().getAttribute("diaTurno");
      SimpleDateFormat sdf2 = new SimpleDateFormat("dd/MM/yyyy");
      String fechaFormateada2 = sdf2.format(fechaTurno );  
      Odontologo odontoSeleccionado =(Odontologo) request.getSession().getAttribute("odontoSeleccionado");

      String rangoSeleccionado = (String)request.getSession().getAttribute("rangoSeleccionado");
      Paciente pacienteSeleccionado = (Paciente) request.getSession().getAttribute("pacienteSeleccionado");
      String datosPaciente = pacienteSeleccionado.getNombre()+" "+pacienteSeleccionado.getApellido()+". DNI: "+pacienteSeleccionado.getDni();
    %>
    
    <p class="mb-4"><b>Odontólogo seleccionado:</b> <%=odontoSeleccionado.getNombre()+" "+odontoSeleccionado.getApellido() %>.</p>
    <p class="mb-4"><b>Especialidad:</b> <%=especialidad%>.</p>
    <p class="mb-4"><b>Fecha seleccionada:</b> <%=fechaFormateada2%>. <b>Día:</b> <%=diaTurno %>. </p>
    <p class="mb-4"><b>Rango horario seleccionado:</b> <%=rangoSeleccionado%>.
    <p class="mb-4"><b>Paciente seleccionado:</b> <%=datosPaciente%>.
        
    <form class="user" action="SvConfirmarTurno" method="POST">
        <div class="col-sm-6 mb-3">
            <label class="form-check-label" for="afeccion" >Afección: </label>
            <input type="text" class="form-control form-control-user" id="afeccion" name="afeccion"
                   placeholder="Describe brevemente la afección que padece el paciente" maxlength="80" required>
        </div>  
        <button class="btn btn-primary btn-user btn-block" type="submit" style="background-color: green;" >
            <i class="fas fa-calendar-plus"></i>  Confirmar Turno
        </button>
    </form>   
</div>


<%@include file="components/bodyfinal.jsp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Paciente"%>
<%@page import="logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/header.jsp"%>
<%@include file="components/bodyprimeraparte.jsp"%>

<h1>Edición de Pacientes</h1>
<p>Para acceder al formulario de edición de pacientes previamente compruebe si la fecha de nacimiento del mismo es correcta.</p>
<p>Recuérde que si el mismo es menor de edad deberá asignarle un <b>responsable</b>, puede dar de alta un responsable en la sección correspondiente.</p>
<% Paciente pacienteEditar = (Paciente)request.getSession().getAttribute("pacienteEditar");%>
    <form class="user" action="SvPacienteFechaNac" method="POST">
        <div class="form-group col">
            <div class="col-sm-6 mb-3">
            <%  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String fechaFormateada = sdf.format(pacienteEditar.getFecha_nacimiento()); %>
                <label class="form-check-label" for="fechanac" style="margin-left: 1rem;">Fecha de Nacimiento del Paciente: </label>
                <input type="date" class="form-control form-control-user" id="fechanac" name="fechanac"
                       placeholder="Fecha de Nacimiento " value="<%=fechaFormateada %>" required>
            </div>
        </div>
    
        <button class="btn btn-primary btn-user btn-block" type="submit" >
        Comprobar fecha y acceder al formulario
        </button>
    </form>

<%@include file="components/bodyfinal.jsp"%>

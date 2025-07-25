<%@page import="logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/header.jsp"%>
<%@include file="components/bodyprimeraparte.jsp"%>

<h1>Alta Pacientes</h1>
<p>Para acceder al formulario de alta de pacientes previamente indique la fecha de nacimiento del mismo.</p>
<p>Recuerde que si el mismo es menor de edad deberá asignarle un <b>responsable</b>, puede dar de alta un responsable en la sección correspondiente.</p>
    <form class="user" action="SvPacienteFechaNac" method="GET">
        <div class="form-group col">
            <div class="col-sm-6 mb-3">
                <label class="form-check-label" for="fechanac" style="margin-left: 1rem;">Fecha de Nacimiento del Paciente: </label>
                <input type="date" class="form-control form-control-user" id="fechanac" name="fechanac"
                placeholder="Fecha de Nacimiento " required>
            </div>
        </div>
    
        <button class="btn btn-primary btn-user btn-block" type="submit" >
        Comprobar fecha y acceder al formulario
        </button>
    </form>

<%@include file="components/bodyfinal.jsp"%>
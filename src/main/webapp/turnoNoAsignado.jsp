<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/header.jsp"%>
<%@include file="components/bodyprimeraparte.jsp"%>

<h1>Turno no asignado</h1>
<p>No fue posible asignar el turno solicitado, por favor intente nuevamente.</p>
<form class="user" action="SvLimpiarBusquedaOdonto" method="GET">
    <button class="btn btn-primary btn-user btn-block" type="submit" >
        Intentar nuevamente
    </button>
</form>
<%@include file="components/bodyfinal.jsp"%>

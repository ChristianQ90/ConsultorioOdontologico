<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Responsable"%>
<%@page import="logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/header.jsp"%>
<%@include file="components/bodyprimeraparte.jsp"%>

<h1>Edición de Responsables</h1>
<p>Este es el apartado para modificar un Responsable del sistema.</p>
<% Responsable resp = (Responsable) request.getSession().getAttribute("respEditar");%>
<form class="user" action="SvEditarResponsables" method="POST">
                                <div class="form-group col">
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" id="dni" name="dni"
                                               placeholder="DNI" value="<%=resp.getDni() %>" required>
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" id="nombre" name="nombre"
                                               placeholder="Nombre" value="<%=resp.getNombre() %>" required>
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" id="apellido" name="apellido"
                                               placeholder="Apellido" value="<%=resp.getApellido() %>" required>
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" id="telefono" name="telefono"
                                               placeholder="Teléfono" value="<%=resp.getTelefono() %>" required>
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" id="direccion" name="direccion"
                                               placeholder="Dirección" value="<%=resp.getDireccion() %>" required>
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <label class="form-check-label" for="fechanac" style="margin-left: 1rem;">Fecha de Nacimiento: </label>
                                        <%  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                            String fechaFormateada = sdf.format(resp.getFecha_nacimiento()); %>
                                        <input type="date" class="form-control form-control-user" id="fechanac" name="fechanac"
                                               placeholder="Fecha de Nacimiento " value="<%=fechaFormateada %>" required>
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" id="tipo_responsabilidad" name="tipo_responsabilidad"
                                               placeholder="Tipo de responsabilidad" value="<%=resp.getTipo_responsabilidad() %>" required>
                                    </div>
                                </div>
    
                                <button class="btn btn-primary btn-user btn-block" type="submit" >
                                    Guardar Modificación
                                </button>
                            </form>

<%@include file="components/bodyfinal.jsp"%>

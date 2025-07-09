<%@page import="logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/header.jsp"%>
<%@include file="components/bodyprimeraparte.jsp"%>

<h1>Alta Responsables</h1>
<p>Este es el apartado para dar de alta los responsables de pacientes menores de edad en el sistema.</p>
<form class="user" action="SvResponsables" method="POST">
                                <div class="form-group col">
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" id="dni" name="dni"
                                               placeholder="DNI" required>
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" id="nombre" name="nombre"
                                               placeholder="Nombre" required>
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" id="apellido" name="apellido"
                                               placeholder="Apellido" required>
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" id="telefono" name="telefono"
                                               placeholder="Teléfono" required>
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" id="direccion" name="direccion"
                                               placeholder="Dirección" required>
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <label class="form-check-label" for="fechanac" style="margin-left: 1rem;">Fecha de Nacimiento: </label>
                                        <input type="date" class="form-control form-control-user" id="fechanac" name="fechanac"
                                               placeholder="Fecha de Nacimiento " required>
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" id="tipo_responsabilidad" name="tipo_responsabilidad"
                                               placeholder="Tipo de responsabilidad" required>
                                    </div>
                                </div>
    
                                <button class="btn btn-primary btn-user btn-block" type="submit" >
                                    Crear Responsable
                                </button>
                            </form>

<%@include file="components/bodyfinal.jsp"%>
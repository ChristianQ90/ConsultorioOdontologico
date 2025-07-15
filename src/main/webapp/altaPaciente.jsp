<%@page import="logica.Responsable"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/header.jsp"%>
<%@include file="components/bodyprimeraparte.jsp"%>

<h1>Alta Pacientes</h1>
<p>Este es el apartado para dar de alta a los pacientes en el sistema.</p>
<% Date fechaNac = (Date) request.getSession().getAttribute("fechaNac");
   Long edadPaciente = (Long) request.getSession().getAttribute("edadPaciente"); %>
<form class="user" action="SvPaciente" method="POST">
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
                                        <label class="form-check-label" for="fechanac" style="margin-left: 0.4rem;">Fecha de Nacimiento: </label>
                                        <%  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                            String fechaFormateada = sdf.format(fechaNac); %>
                                        <input type="date" class="form-control form-control-user" id="fechanac" name="fechanac"
                                               placeholder="Fecha de Nacimiento " value="<%=fechaFormateada %>" disabled required>
                                    </div>
                                    <div class="form-group row" id="tieneSM" style="margin-left: 1.6rem;">
                                        <div class="form-check form-check-inline">
                                            <input type="checkbox" class="form-check-input" id="tieneSM" name="tieneSM" value="true">
                                            <label class="form-check-label" >Cuenta con Seguro Médico</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 mb-3" style="margin-left: 1rem;">    
                                    <label for="grupoSang" >Grupo Sanguíneo:</label>
                                    <select id="grupoSang" name="grupoSang" class="form-control" style="border-radius: 2rem; height: 3rem; font-size: 14;" required>
                                      <option value="">Seleccione una opción</option>
                                      <option value="A+">A+</option>
                                      <option value="A-">A−</option>
                                      <option value="B+">B+</option>
                                      <option value="B-">B−</option>
                                      <option value="AB+">AB+</option>
                                      <option value="AB-">AB−</option>
                                      <option value="O+">O+</option>
                                      <option value="O-">O−</option>
                                    </select>
                                </div>
                                
                                <%if(edadPaciente>=0 && edadPaciente<18){%>
                                     
                                <label style="margin-left: 1.9rem">Responsable asociado al Paciente menor de edad:</label>
                                <% 
                                    List<Responsable> listaResponsables =(List) request.getSession().getAttribute("listaResponsables");
                                %>
                                <div class="form-group row" style="margin-left: 1rem">
                                    <div class="col-sm-6 mb-3">
                                        <select class="form-control form-control" id="responsable" name="responsable" style="border-radius: 2rem; height: 3rem; font-size: 14;" required>
                                            <% for (Responsable resp : listaResponsables){%>
                                            <option value="<%=resp.getId()%>"><%=resp.getNombre()+" "+resp.getApellido()+". DNI( "+resp.getDni()+" ). Tipo de responsable: "+resp.getTipo_responsabilidad() %></option>
                                            <%}%>
                                        </select>
                                   </div>
                                </div>
                                <% }%>
    
                                <button class="btn btn-primary btn-user btn-block" type="submit" >
                                    Crear Paciente
                                </button>
                            </form>

<%@include file="components/bodyfinal.jsp"%>

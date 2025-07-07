<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Odontologo"%>
<%@page import="logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/header.jsp"%>
<%@include file="components/bodyprimeraparte.jsp"%>

<h1>Edición de Odontólogos</h1>
<p>Este es el apartado para modificar un Odontólogo del sistema.</p>
<% Odontologo odontoEditar = (Odontologo)request.getSession().getAttribute("odontoEditar");%>
<form class="user" action="SvEditarOdontologos" method="POST">
                                <div class="form-group col">
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" id="dni" name="dni"
                                               placeholder="DNI" value="<%=odontoEditar.getDni() %>" required>
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" id="nombre" name="nombre"
                                               placeholder="Nombre" value="<%=odontoEditar.getNombre() %>" required>
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" id="apellido" name="apellido"
                                               placeholder="Apellido" value="<%=odontoEditar.getApellido() %>" required>
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" id="telefono" name="telefono"
                                               placeholder="Teléfono" value="<%=odontoEditar.getTelefono() %>" required>
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" id="direccion" name="direccion"
                                               placeholder="Dirección" value="<%=odontoEditar.getDireccion() %>" required>
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <%  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                            String fechaFormateada = sdf.format(odontoEditar.getFecha_nacimiento()); %>
                                        <input type="date" class="form-control form-control-user" id="fechanac" name="fechanac"
                                               placeholder="Fecha Nac" value="<%=fechaFormateada %>" required>
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <select class="form-control form-control" id="especialidad" name="especialidad" style="border-radius: 2rem; height: 3rem; font-size: 14;" required>
                                            <option value="<%=odontoEditar.getEspecialidad() %>"><%=odontoEditar.getEspecialidad() %> (Especialidad actual)</option>
                                            <option value="Ortodoncia">Ortodoncia</option>
                                            <option value="Endodoncia">Endodoncia</option>
                                            <option value="Odontopediatria">Odontopediatría</option>
                                            <option value="Implantologia">Implantología</option>
                                            <option value="Periodoncia">Periodoncia</option>
                                            <option value="Cirugia bucal">Cirugía bucal</option>
                                            <option value="Rehabilitacion oral">Rehabilitación oral</option>
                                        </select>
                                    </div>
                                </div>
    
                                <!-- Acá va a ir todo lo que respecta a horarios y usuarios -->
                                <label>Horarios de atención :</label>
                                <div class="form-group row" >
                                    <div class="col-sm-0 mb-3 mb-sm-0">
                                        <label style="margin-top: 0.7rem; margin-left: 2.5rem;">Inicio :</label>
                                    </div>
                                    <div class="col-sm-2 ">
                                        <input type="time" class="form-control form-control-user" id="horaInicio" name="horaInicio" value="<%=odontoEditar.getUnHorario().getHorario_incio() %>" required>                                       
                                    </div>
                                    <div class="col-sm-0">
                                        <label style="margin-top: 0.7rem; margin-left: 2.5rem;">Fin :</label>
                                    </div>
                                    <div class="col-sm-2 ">
                                        <input type="time" class="form-control form-control-user" id="horaFin" name="horaFin" value="<%=odontoEditar.getUnHorario().getHorario_fin() %>" required>                                       
                                    </div>
                                </div>
                                
                                <label>Días de atención:</label>
                                <%  String diasAtencion = odontoEditar.getUnHorario().getDias_atencion();
                                    String[] diasSeleccionados = diasAtencion.split(" ");
                                    List<String> listaDias = java.util.Arrays.asList(diasSeleccionados);%>
                                    
                                <div class="form-group row" id="diasCheckboxes" style="margin-left: 1.6rem;">
                                  <div class="form-check form-check-inline">
                                    <input type="checkbox" class="form-check-input" id="lunes" name="diasAtencion" value="Lunes"
                                           <%if(listaDias.contains("Lunes")) { %> checked <% } %>>
                                    <label class="form-check-label" for="lunes">Lunes</label>
                                  </div>
                                  <div class="form-check form-check-inline">
                                    <input type="checkbox" class="form-check-input" id="martes" name="diasAtencion" value="Martes"
                                           <%if(listaDias.contains("Martes")) { %> checked <% } %>>
                                    <label class="form-check-label" for="martes">Martes</label>
                                  </div>
                                  <div class="form-check form-check-inline">
                                    <input type="checkbox" class="form-check-input" id="miercoles" name="diasAtencion" value="Miercoles"
                                           <%if(listaDias.contains("Miercoles")) { %> checked <% } %>>
                                    <label class="form-check-label" for="miercoles">Miércoles</label>
                                  </div>
                                  <div class="form-check form-check-inline">
                                    <input type="checkbox" class="form-check-input" id="jueves" name="diasAtencion" value="Jueves"
                                           <%if(listaDias.contains("Jueves")) { %> checked <% } %>>
                                    <label class="form-check-label" for="jueves">Jueves</label>
                                  </div>
                                  <div class="form-check form-check-inline">
                                    <input type="checkbox" class="form-check-input" id="viernes" name="diasAtencion" value="Viernes"
                                           <%if(listaDias.contains("Viernes")) { %> checked <% } %>>
                                    <label class="form-check-label" for="viernes">Viernes</label>
                                  </div>
                                  <div class="form-check form-check-inline">
                                    <input type="checkbox" class="form-check-input" id="sabado" name="diasAtencion" value="Sabado"
                                           <%if(listaDias.contains("Sabado")) { %> checked <% } %>>
                                    <label class="form-check-label" for="sabado">Sábado</label>
                                  </div>
                                  <div class="form-check form-check-inline">
                                    <input type="checkbox" class="form-check-input" id="domingo" name="diasAtencion" value="Domingo"
                                           <%if(listaDias.contains("Domingo")) { %> checked <% } %>>
                                    <label class="form-check-label" for="domingo">Domingo</label>
                                  </div>
                                </div>
                                
                                <label>Usuario asociado al Odontólogo:</label>
                                <% 
                                    List<Usuario> listaUsuarios =(List) request.getSession().getAttribute("listaUsuOdontoSinAsignar");
                                %>
                                <div class="form-group row" style="margin-left: 1rem">
                                    <div class="col-sm-6 mb-3">
                                        <select class="form-control form-control" id="usuario" name="usuario" style="border-radius: 2rem; height: 3rem; font-size: 14;" required>
                                            <option value="<%=odontoEditar.getUnUsuario().getId_usuario() %>"><%=odontoEditar.getUnUsuario().getNombreUsuario() %> (Usuario asignado actual)</option>
                                            <% for (Usuario usu : listaUsuarios){%>
                                            <option value="<%=usu.getId_usuario()%>"><%=usu.getNombreUsuario()%></option>
                                            <%}%>
                                        </select>
                                   </div>
                                </div>

                                <button class="btn btn-primary btn-user btn-block" type="submit" >
                                    Guardar Modificación
                                </button>
                            </form>

    
                                            
                                            
    <%@include file="components/bodyfinal.jsp"%>
    <script>
    document.querySelector("form").addEventListener("submit", function(event) {
        const checkboxes = document.querySelectorAll("input[name='diasAtencion']:checked");
        if (checkboxes.length === 0) {
            event.preventDefault(); // Previene el submit
            alert("Por favor, seleccione al menos un día de atención.");
        }
    });
    </script>

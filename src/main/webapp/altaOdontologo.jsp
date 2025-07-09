
<%@page import="logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/header.jsp"%>
<%@include file="components/bodyprimeraparte.jsp"%>

<h1>Alta Odontólogos</h1>
<p>Antes de crear un Odontólogo es necesario crear un <b>Usuario</b> con su contraseña al cuál será vinculado</p>
<form class="user" action="SvOdontologo" method="POST">
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
                                               placeholder="Fecha Nac" required>
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <select class="form-control form-control" id="especialidad" name="especialidad" style="border-radius: 2rem; height: 3rem; font-size: 14;" required>
                                            <option value="" disabled selected>Seleccione especialidad</option>
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
                                        <input type="time" class="form-control form-control-user" id="horaInicio" name="horaInicio" required>                                       
                                    </div>
                                    <div class="col-sm-0">
                                        <label style="margin-top: 0.7rem; margin-left: 2.5rem;">Fin :</label>
                                    </div>
                                    <div class="col-sm-2 ">
                                        <input type="time" class="form-control form-control-user" id="horaFin" name="horaFin" required>                                       
                                    </div>
                                </div>
                                
                                <label>Días de atención:</label>
                                <div class="form-group row" id="diasCheckboxes" style="margin-left: 1.6rem;">
                                  <div class="form-check form-check-inline">
                                    <input type="checkbox" class="form-check-input" id="lunes" name="diasAtencion" value="Lunes">
                                    <label class="form-check-label" for="lunes">Lunes</label>
                                  </div>
                                  <div class="form-check form-check-inline">
                                    <input type="checkbox" class="form-check-input" id="martes" name="diasAtencion" value="Martes">
                                    <label class="form-check-label" for="martes">Martes</label>
                                  </div>
                                  <div class="form-check form-check-inline">
                                    <input type="checkbox" class="form-check-input" id="miercoles" name="diasAtencion" value="Miercoles">
                                    <label class="form-check-label" for="miercoles">Miércoles</label>
                                  </div>
                                  <div class="form-check form-check-inline">
                                    <input type="checkbox" class="form-check-input" id="jueves" name="diasAtencion" value="Jueves">
                                    <label class="form-check-label" for="jueves">Jueves</label>
                                  </div>
                                  <div class="form-check form-check-inline">
                                    <input type="checkbox" class="form-check-input" id="viernes" name="diasAtencion" value="Viernes">
                                    <label class="form-check-label" for="viernes">Viernes</label>
                                  </div>
                                  <div class="form-check form-check-inline">
                                    <input type="checkbox" class="form-check-input" id="sabado" name="diasAtencion" value="Sabado">
                                    <label class="form-check-label" for="sabado">Sábado</label>
                                  </div>
                                  <div class="form-check form-check-inline">
                                    <input type="checkbox" class="form-check-input" id="domingo" name="diasAtencion" value="Domingo">
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
                                            <% for (Usuario usu : listaUsuarios){%>
                                            <option value="<%=usu.getId_usuario()%>"><%=usu.getNombreUsuario()%></option>
                                            <%}%>
                                        </select>
                                   </div>
                                </div>

                                <button class="btn btn-primary btn-user btn-block" type="submit" >
                                    Crear Odontólogo
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
                                            


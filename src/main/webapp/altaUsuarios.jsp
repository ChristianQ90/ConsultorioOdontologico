<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/header.jsp"%>
<%@include file="components/bodyprimeraparte.jsp"%>

<h1>Alta Usuarios</h1>
<p>Este es el apartado para dar de alta los diferentes usuarios del sistema.</p>
<form class="user" action="SvUsuarios" method="POST">
                                <div class="form-group col">
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" id="nombreusu" name="nombreusu"
                                            placeholder="Nombre Usuario">
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <input type="password" class="form-control form-control-user" id="contrasenia" name="contrasenia"
                                            placeholder="Contraseña">
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <select class="form-control form-control" id="rol" name="rol" style="border-radius: 2rem; height: 3rem; font-size: 14;" required>
                                            <option value="" disabled selected>Seleccione un rol</option>
                                            <option value="Secretario/a">Secretario/a</option>
                                            <option value="Odontologo/a">Odontólogo/a</option>
                                        </select>
                                    </div>
                                    
                                <button class="btn btn-primary btn-user btn-block" type="submit" >
                                    Crear Usuario
                                </button>
                            </form>
<%@include file="components/bodyfinal.jsp"%>


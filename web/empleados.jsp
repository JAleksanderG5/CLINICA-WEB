<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="Model.EmpleadoDao"%>
<%@page import="Model.IEmpleadoDao"%>
<%@page import="Model.IMenuDao"%>
<%@page import="Model.MenuDao"%>
<%@page import="Model.PuestoDao"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
    <head>
        <title>Empleados</title>
        <link rel="shortcut icon" href="https://www.crecepersonas.es/templates/yootheme/cache/employee-bcd31bcd.png" />
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!--stilo-->
        <link rel="stylesheet" href="css/style.css">

        <link rel="stylesheet" href="css/pacientes.css">

        <!--Iconos-->
        <link href = "https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css"  rel = "stylesheet" >


        <!--Google fonts-->

        <link href = "https://fonts.googleapis.com/css2? family = Roboto: wght @ 100 & display = swap" rel = "stylesheet">

        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


    </head>
    <body>

        <!--Header-->
        <header>

            <!--NavBar-->
            <nav class="navbar navbar-expand-lg navbar-light bg-dark">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <a class="navbar-brand" href="#"> <img src="https://www.crecepersonas.es/templates/yootheme/cache/employee-bcd31bcd.png" alt="citas" width="70" height="60">  </a>

                <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">

                        <li class="nav-item active">

                            <%

                                MenuDao menu = new MenuDao();

                                HashMap<String, String> drop1 = menu.ReadMEnu();

                                for (String i : drop1.keySet()) {

                                    out.println("<button class='btnmenu btn btn-info' type='submit'><a href=" + i + ">" + drop1.get(i) + "</a></button>");
                                }

                            %>  
                        </li>
                    </ul>

                    <form class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-4" type="search" placeholder="Buscar" aria-label="Search">
                        <button class="btn btn-success my-2 my-sm-0" type="submit"><a></a> <strong>Buscar</strong></button>
                    </form>

                </div>
            </nav>
        </header>


        <div class="container">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2> <b>Administracion de Empleados</b></h2>
                            </div>
                            <div class="col-sm-6">

                                <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i
                                        class="material-icons">&#xE147;</i> <span>Agregar Empleado</span></a>


                            </div>
                        </div>
                    </div>


                    <table class="table table-striped table-hover text-center">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Documento de identificacion</th>
                                <th>Direccion</th>
                                <th>Telefono</th>
                                <th>Fecha de Nacimiento</th>
                                <th>Puesto</th>

                            </tr>
                        </thead>
                        <tbody id="tbl_empleados">

                            <% IEmpleadoDao empleado = new EmpleadoDao();
                                DefaultTableModel tabla = new DefaultTableModel();

                                tabla = empleado.GetEmployee();

                                for (int t = 0; t < tabla.getRowCount(); t++) {

                                    out.println("<tr data-id=" + tabla.getValueAt(t, 0) + " data-id_tipo_empleado=" + tabla.getValueAt(t, 7) + ">");
                                    out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                                    out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                                    out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                                    out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                                    out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");
                                    out.println("<td>" + tabla.getValueAt(t, 6) + "</td>");
                                    out.println("</tr>");

                                }

                            %>





                        </tbody>
                    </table>



                </div>
            </div>
        </div>






        <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">


                    <form action="SrEmpleado" method="post" class="form-group">
                        <div class="modal-header">

                            <div>
                                <a class="navbar-brand" href="#"> <img src="images/empleados.png" alt="citas" width="70" height="60">  </a>
                            </div>

                            <h4 class="modal-title">Gestion de Empleados</h4>

                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="limpiar()">&times</button>
                        </div>

                        <div class="modal-body">

                            <label for="lbl_id" ><b>identificacion</b></label>
                            <input type="text" name="txt_id" id="txt_id" class="form-control" value="0"  readonly> 

                            <label for="lbl_nombres" class="control-label col-sm-2">Nombres:</label>
                            <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ingresar nombres" required>


                            <label for="lbl_direccion" class="control-label col-sm-2">Direccion:</label>
                            <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ingresar direccion" required>


                            <label for="lbl_telefono" class="control-label col-sm-2">Telefono:</label>
                            <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ingresar telefono" required>

                            <label for="lbl_fn" class="control-label col-sm-2">Fecha nacimiento:</label>
                            <input type="date" name="txt_fn" id="txt_fn" class="form-control" placeholder="Ingresar fecha" required>


                            <label for="lbl_cui" class="control-label col-sm-2">CUI:</label>
                            <input type="number" name="txt_cui" id="txt_cui" class="form-control" placeholder="Ingresar CUI" required>

                            <label for="lbl_puesto" class="control-label col-sm-2">Puesto:</label>
                            <select name="drop_puesto" id="drop_puesto" class="form-control">
                                <%                                    
                                    PuestoDao puesto = new PuestoDao();

                                    HashMap<String, String> drop = puesto.ReadPuesto();

                                    for (String i : drop.keySet()) {
                                        out.println("<option value='" + i + "'>" + drop.get(i) + "</option>");
                                    }
                                %>
                            </select>




                        </div>

                        <div class="modal-footer">



                            <button name="btn_agregar" id="btn_agregar"  value="agregar" class="btn btn-primary">Agregar</button>

                            <button name="btn_modificar" id="btn_modificar"  value="modificar" class="btn btn-success">Modificar</button>

                            <button name="btn_eliminar" id="btn_eliminar"  value="eliminar" class="btn btn-danger" onclick="javascript:if (!confirm('¿Desea Eliminar?'))
                                        return false" >Eliminar</button>

                        </div>

                    </form>

                </div>
            </div>
        </div>






        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    
        <script type="text/javascript">
            
            
            
          $('#tbl_empleados').on('click', 'tr td', function(evt){
              var target, id, nombre, dpi, direccion, telefono, fecha, puesto, idPuesto;
              
              target = $(event.target);
              
              id = target.parent().data("id");
              idPuesto = target.parent().data("id_tipo_empleado")
              nombre = target.parent("tr").find("td").eq(0).html();
              dpi = target.parent("tr").find("td").eq(1).html();
              direccion = target.parent("tr").find("td").eq(2).html();
              telefono = target.parent("tr").find("td").eq(3).html();
              fecha = target.parent("tr").find("td").eq(4).html();
              puesto = target.parent("tr").find("td").eq(5).html();
        
        
              $("#txt_id").val(id);
              $("#txt_nombres").val(nombre);
              $("#txt_direccion").val(direccion);
              $("#txt_telefono").val(telefono);
              $("#txt_fn").val(fecha);
              $("#txt_cui").val(dpi);
              $("#drop_puesto").val(idPuesto);
              
              
              
              
              $("#addEmployeeModal").modal('show');            
              
         })
         
         
         function limpiar(){
       $("#txt_id").val(0);
       $("#txt_nombres").val('');
       $("#txt_direccion").val('');
       $("#txt_telefono").val('');
       $("#txt_fn").val('');
       $("#txt_cui").val('');
       $("#drop_puesto").val(1);
        }
        
        
        </script>
    
    </body>
</html>
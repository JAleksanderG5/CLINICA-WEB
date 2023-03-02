<%@page import="Model.MenuDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="Model.PuestoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
    <head>
        <title>Inicio</title>
        <link rel="shortcut icon" href="images/Portada.png" />

        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <!--Stilos css-->
        <link rel="stylesheet" href="css/style.css">
        
        <style>
            
            html,body{
  overflow-x: hidden;
  color:black;
  font-family:'Opens Sans',helvetica;  
  margin: 0px;
  padding: 0px;
}
        </style>

    </head> 

    <body>

        <!--Header-->
        <header>

            <!--NavBar-->
            <nav class="navbar navbar-expand-lg navbar-light bg-dark">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <a class="navbar-brand" href="#"> <img src="images/Portada.png" alt="citas" width="70" height="60">  </a>

                <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">

                        <li class="nav-item active">

                            <%
                                MenuDao menu = new MenuDao();
                                HashMap<String, String> drop = menu.ReadMEnu();

                                for (String i : drop.keySet()) {
                                    out.println("<button class='btnmenu btn btn-info' type='submit'><a href=" + i + ">" + drop.get(i) + "</a></button>");
                                }
                            %>  

                        </li>

                    </ul>
                </div>
            </nav>
        </header>

        <section>

            <div class="row">

                <div class="col-sm-2 col-md-2 col-lg-2 col-xl-2">

                </div>

                <div class="col-sm-3 col-md-3 col-lg-3">

                    <img src="data:image/png;base64,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" class="img-fluid" alt="Responsive image">

                </div>

                <div class="col-sm-4">
                    <img src="https://www.guiamedicadeguatemala.com/wp-content/uploads/2020/07/doctores-en-guatemala.png" class="img-fluid" alt="Responsive image">
                </div>

            </div>

            <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12">



                </div>    

            </div>

            <div class="container">

                <div class="row">

                    <div class="col-sm-3 col-md-3 col-lg-3"></div>

                    <div class="text-center col-sm-6 col-md-6 col-lg-6">
                        <h2>Bienvenido</h2>

                        <hr>
                    </div>

                    <div class="col-sm-3 col-md-3 col-lg-3"></div>
                </div>

            </div>
        </section>


        <footer></footer>





        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
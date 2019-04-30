<%-- 
    Document   : accueilAdmin
    Created on : 21 avr. 2019, 09:21:02
    Author     : magat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aministration</title>
        <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
    </head>
    <body style="margin-right: 30px; margin-left: 30px;">

        <header class="main-header" style="">
            <nav class="navbar navbar-inverse" style="margin-right: 5px; margin-left: 5px;">
                <div class="container">
                    <div class="navbar-header">
                        <a href="user" class="navbar-brand"><b>Intro</b>JEE</a>
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
                            <i class="fa fa-bars"></i>
                        </button>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse pull-left" id="navbar-collapse">
                        <ul class="nav navbar-nav">
                            <!-- <li ><a href="user?action=inscription">Ajouter<span class="sr-only">(current)</span></a></li> -->
                            <li class="active"><a href="user?action=location">Location</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#">Action</a></li>
                                    <li><a href="#">Another action</a></li>
                                    <li><a href="#">Something else here</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">Separated link</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">One more separated link</a></li>
                                </ul>
                            </li>
                        </ul>
                        <form class="navbar-form navbar-left" role="search">
                            <div class="form-group">
                                <input type="text" class="form-control" id="navbar-search-input" placeholder="Search">
                            </div>
                        </form>
                    </div>
                    <!-- /.navbar-collapse -->
                    <!-- Navbar Right Menu -->
                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">

                            <!-- User Account Menu -->
                            <li class="dropdown user user-menu">
                                <!-- Menu Toggle Button -->
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <!-- The user image in the navbar-->
                                    <img src="images/${user.photo!=null?user.photo:'default.png'}" class="user-image" alt="User Image">
                                    <!-- hidden-xs hides the username on small devices so only the image appears. -->
                                    <span class="hidden-xs">${user.prenom}  ${user.nom}</span
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- The user image in the menu -->
                                    <li class="user-header">
                                        <img src="images/${user.photo!=null?user.photo:'default.png'}" class="img-circle" alt="User Image">

                                        <p>
                                            ${user.prenom}  ${user.nom} - Web Developer
                                            <small>Member since Nov. 2012</small>
                                        </p>
                                    </li>
                                    <!-- Menu Body -->
                                    <li class="user-body">
                                        <div class="row">
                                            <div class="col-xs-4 text-center">
                                                <a href="#">Followers</a>
                                            </div>
                                            <div class="col-xs-4 text-center">
                                                <a href="#">Sales</a>
                                            </div>
                                            <div class="col-xs-4 text-center">
                                                <a href="#">Friends</a>
                                            </div>
                                        </div>
                                        <!-- /.row -->
                                    </li>
                                    <!-- Menu Footer-->
                                    <li class="user-footer">
                                        <div class="pull-left">
                                            <a href="#" class="btn btn-success btn-flat">Profile</a>
                                        </div>
                                        <div class="pull-right">
                                            <a href="user?action=logout" class="btn btn-danger btn-flat">Sign out</a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <!-- /.navbar-custom-menu -->
                </div>
                <!-- /.container-fluid -->
            </nav>
        </header>

        <div class="container-fluid">
            <div class="row text-center">
                <div class="col-sm-4"></div>
                <div class="col-sm-4">
                    <form class="form-signin" action="" method="POST">
                        <h2 class="text-center">Location!</h2>
                        <input type="hidden" name="action" value="location" />
                        <br>
                        <input type="text" id="inputEmail" name="login" class="form-control" placeholder="Numero Piece" required autofocus>
                        <br>
                        <input type="text" id="inputPassword" name="nom" class="form-control" placeholder="Nom" required>
                        <br>
                        <label for="inputEmail" class="sr-only">Prenom</label>
                        <input type="text" id="inputEmail" name="prenom" class="form-control" placeholder="Prenom" required autofocus>
                        <br>
                        <label for="inputPassword" class="sr-only">Date Naissance</label>
                        <input type="date" id="inputPassword" name="datenaiss" class="form-control" placeholder="Date Naissance" required>
                        <br>
                        <label for="inputEmail" class="sr-only">Tel</label>
                        <input type="text" id="inputEmail" name="tel" class="form-control" placeholder="Tel" required autofocus>
                        <br>
                        <label for="inputPassword" class="sr-only">Email</label>
                        <input type="text" id="inputPassword" name="email" class="form-control" placeholder="Email" required>
                        <br>
                        <label for="inputEmail" class="sr-only">Tel</label>
                        <input type="text" id="inputEmail" name="tel" class="form-control" placeholder="Tel" required autofocus>
                        <br>
                        <label for="inputEmail" class="sr-only">Marque</label>
                        <select class="form-control" id="selectmarque" name="selectmarque">
                            <option value="" >Selectionner la marque</option>
                            <c:forEach items="${marques}" var="marque">
                                <option value="${marque.id}" >${marque.libelle}</option>
                            </c:forEach>
                        </select>
                        <br>
                        <label for="inputEmail" class="sr-only">Modele</label>
                        <select class="form-control" id="selectmodele" name="selectmodele">
                            <option value="" >Selectionner le Modele</option>
                        </select>
                        <br>
                        <label for="inputEmail" class="sr-only">Matricule</label>
                        <input type="text" id="inputEmail" name="matricule" class="form-control" placeholder="Matricule" required autofocus>
                        <br>
                        <label for="inputEmail" class="sr-only">Couleur</label>
                        <input type="text" id="inputEmail" name="couleur" class="form-control" placeholder="Couleur" required autofocus>
                        <br>
                        <label for="inputEmail" class="sr-only">Prix par jour </label>
                        <input type="text" id="inputEmail" name="prixjour" class="form-control" placeholder="Prix par jour" required autofocus>
                        <br>
                        <label for="inputEmail" class="sr-only">Nombre de jours</label>
                        <input type="text" id="inputEmail" name="nbjours" class="form-control" placeholder="Nombre de jours" required autofocus>
                        <br>
                        <label for="inputEmail" class="sr-only">Montant</label>
                        <input type="text" id="inputEmail" name="montant" class="form-control" placeholder="Montant" required autofocus>
                        <br>
                        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
                        <p class="mt-5 mb-3 text-muted">&copy; 2017-2019</p>
                    </form>
                    ${message}
                </div>
                <div class="col-sm-4"></div>
            </div>
        </div>
























        <!-- DataTables -->
        <script src="bower_components/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap 3.3.7 -->
        <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- FastClick -->
        <script src="bower_components/fastclick/lib/fastclick.js"></script>
        <!-- AdminLTE App -->
        <script src="dist/js/adminlte.min.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="dist/js/demo.js"></script>

        <script>
            $(function () {
                $("#selectmarque").change(function () {
                    //alert("Marque ..."); 
                    $("#selectmodele").empty();
                    $("#selectmodele").append("<option value='' >Selectionner le modele</option>");
                    $.ajax({
                        url: "user",
                        data: {
                            action: "getmodele",
                            idmarque: $("#selectmarque").val()
                        },
                        type: 'GET',
                        dataType: 'text',
                        success: function (data, textStatus, jqXHR) {
                           $("#selectmodele").append(data);
                        }
                    });
                });
            });
        </script>
    </body>
</html>

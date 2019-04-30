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
                            <!-- <li class="active"><a href="user?action=inscription">Ajouter<span class="sr-only">(current)</span></a></li> -->
                            <li><a href="user?action=location">Location</a></li>
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




        <div class="modal fade" id="modal-default" >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Update user</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-signin" action="" method="POST">
                            <input type="hidden" name="update" value="update" />
                            <br>
                            <input type="text" id="inputEmail" name="nom" class="form-control" placeholder="nom" required autofocus>
                            <br>
                            <input type="text" id="inputEmail" name="prenom" class="form-control" placeholder="prenom" required autofocus>
                            <br>
                            <input type="text" id="inputEmail" name="login" class="form-control" placeholder="login" required autofocus>
                            <br>
                            <select class="form-control" name="role" id="">
                                <c:forEach var="roless" items="${roles}">
                                    <option value="${roless.id}">${roless.libelle}</option>
                                </c:forEach>

                            </select>
                            <br>
                            <button class="btn btn-lg btn-primary btn-block" type="submit">Update</button>
                            <p class="mt-5 mb-3 text-muted">&copy; 2017-2019</p>
                        </form>
                    </div>
                    <!--
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div> -->
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->


        <div class="modal modal-info fade" id="modal-info">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Info Modal</h4>
                    </div>
                    <div class="modal-body">
                        <p>One fine body&hellip;</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-outline">Save changes</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->

        <!--<button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-default">defModal</button>
        -->
        <div class="container-fluid" style="margin-top: 30px">
            <table id="example1" class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Nom</th>
                        <th scope="col">Prenom</th>
                        <th scope="col">Login</th>
                        <th scope="col">Role</th>
                        <th scope="col">Delete</th>
                        <th scope="col">Lock</th>
                        <th scope="col">Update</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="utilisateurs" items="${users}">
                        <tr>
                            <td>${utilisateurs.id}</td>
                            <td>${utilisateurs.nom}</td>
                            <td>${utilisateurs.prenom}</td>
                            <td>${utilisateurs.login}</td>
                            <td>${utilisateurs.role.libelle}</td>
                            <td><a name="delete${utilisateurs.id}" id="delete${utilisateurs.id}" type="button" class="btn btn-danger" href="user?action=delete&id=${utilisateurs.id}">Delete</a></td>
                            <td><a name="lock${utilisateurs.id}" id="lock${utilisateurs.id}" type="button" class="btn btn-warning" href="user?action=lock&id=${utilisateurs.id}">Lock</a></td>
                            <td><button class="btn btn-success" data-toggle="modal" data-target="#modal-${utilisateurs.id}" >Update</button></td>
                    <div class="modal fade" id="modal-${utilisateurs.id}">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title">Update user</h4>
                                </div>
                                <div class="modal-body">
                                    <form class="form-signin" action="" method="POST">
                                        <input type="hidden" name="action" value="update" />
                                        <input type="hidden" name="id" value="${utilisateurs.id}" />
                                        <br>
                                        <label for="inputEmail">Nom</label>
                                        <input type="text" value="${utilisateurs.nom}" id="inputEmail" name="nom" class="form-control" placeholder="nom" required autofocus>
                                        <br>
                                        <label for="inputEmail" >Prenom</label>
                                        <input type="text" value="${utilisateurs.prenom}" id="inputEmail" name="prenom" class="form-control" placeholder="prenom" required autofocus>
                                        <br>
                                        <label for="inputEmail" >Login</label>
                                        <input type="text" value="${utilisateurs.login}" id="inputEmail" name="login" class="form-control" placeholder="login" required autofocus>
                                        <br>
                                        <label for="inputEmail">Role</label>
                                        <select class="form-control" name="role" id="">
                                            <c:forEach var="roless" items="${roles}">
                                                <option value="${roless.id}" ${roless.id.equals(utilisateurs.role.id)?'selected':''}>${roless.libelle}</option>
                                            </c:forEach>

                                        </select>
                                        <br>
                                        <button class="btn btn-lg btn-primary btn-block" type="submit">Update</button>
                                        <p class="mt-5 mb-3 text-muted">&copy; 2017-2019</p>
                                    </form>
                                </div>
                                <!--
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary">Save changes</button>
                                </div> -->
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>
                    <!-- /.modal -->
                    </tr>
                </c:forEach>
                </tbody>
                <tfoot>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Nom</th>
                        <th scope="col">Prenom</th>
                        <th scope="col">Login</th>
                        <th scope="col">Role</th>
                        <th scope="col">Delete</th>
                        <th scope="col">Lock</th>
                        <th scope="col">Update</th>
                    </tr>
                </tfoot>
            </table>
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
                //alert("test jq");
                $("[name^='delete']").click(function () {
                    //alert("deleting");
                    return confirm("Etes vous sure de vouloir Supprimer cet utilisateur ?");
                });
                $("[name^='lock']").click(function () {
                    return confirm("Etes vous sure de vouloir Bloquer cet utilisateur ?");
                });
                $("[name^='test']").click(function () {
                    //alert("deleting");
                    return confirm("Etes vous sure de vouloir Supprimer cet utilisateur ?");
                });
            });
        </script>
    </body>
</html>

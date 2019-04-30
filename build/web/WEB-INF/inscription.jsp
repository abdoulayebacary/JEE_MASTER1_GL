<%-- 
    Document   : inscription
    Created on : 9 avr. 2019, 18:23:49
    Author     : magat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ajout Utilisateur</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <body>
        <br/>
        <h2 style="text-align: center">Ajout Utilisateur</h2>
        <br/>
        <span style="margin-left: 50px" class="alert alert-danger" id="message" ></span>
        <br/>
        <br/>
        <p class="" >${message}</p>
        <form style="margin-left: 50px" class="form" action="" method="post" enctype="multipart/form-data" >

            <input type="hidden" name="action" value="inscription" />
            <div class="row">                
                <div class="col-md-7">
                    <div class="form-group">
                        <label for="control-label">Prenom</label>
                        <input type="text" name="prenom" placeholder="Prenom" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="control-label">Nom</label>
                        <input type="text" name="nom" placeholder="Nom" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="control-label">photo</label>
                        <input type="file" id="photo" name="photo" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="control-label">role</label>
                        <select name="role" class="form-control" required="true">
                            <option value="" >Selectionner le role</option>
                            <c:forEach items="${roles}" var="r">
                                <option value="${r.id}">${r.libelle}</option>
                            </c:forEach>
                        </select>
                    </div>

                </div>
                <div class="col-md-5">
                    <img style="text-align: right" src="images/default.png" alt="OOoops!!" id="image" sizes="" width="60%" srcset="">
                </div>
            </div>
            <button type="submit" class="btn btn-success btn-lg" >Valider</button>
        </form>
        <script src="js/jquery-3.3.1.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function () {
                $("#message").hide();
                function imageIsLoaded(e) {
                    //$("#file").css("color","green");
                    //$('#image_preview').css("display", "block");
                    $('#image').attr('src', e.target.result);
                    $('#image').attr('width', '300px');
                    $('#image').attr('height', '300px');
                }
                ;
                $('#photo').change(function () {
                    //alert('ok');
                    var assetsBaseDir = "images/";

                    $("#message").empty(); // To remove the previous error message
                    var file = this.files[0];

                    var imagefile = file.type;
                    //alert(imagefile);
                    var match = ["image/jpeg", "image/png", "image/jpg"];
                    if (!((imagefile == match[0]) || (imagefile == match[1]) || (imagefile == match[2]))) {
                        //alert('no match');
                        $('#image').attr('src', assetsBaseDir + 'default.png');
                        $("#message").show();
                        $("#message").html("Selectionnez une image valide, Note : Seules jpeg, jpg et png Images sont autorisés");
                        return false;
                    } else {
                        //alert('match');
                        var reader = new FileReader();
                        reader.onload = imageIsLoaded;
                        reader.readAsDataURL(this.files[0]);
                    }
                });
            });

        </script>
    </body>
</html>

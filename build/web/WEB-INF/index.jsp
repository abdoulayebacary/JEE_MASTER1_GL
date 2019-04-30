<%-- 
    Document   : index
    Created on : 19 mars 2019, 19:05:32
    Author     : magat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOGIN</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">

    </head>

    <body class="text-center">
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <form class="form-signin" action="" method="POST">
                    <input type="hidden" name="action" value="logon" />
                    <img class="mb-4" src="/docs/4.3/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
                    <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
                    <label for="inputEmail" class="sr-only">Your Login</label>
                    <input type="text" id="inputEmail" name="login" class="form-control" placeholder="Your Login" required autofocus>
                    <label for="inputPassword" class="sr-only">Password</label>
                    <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>

                    <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
                    <p class="mt-5 mb-3 text-muted">&copy; 2017-2019</p>
                </form>
                ${message}
            </div>
            <div class="col-sm-4"></div>
        </div>

    </body>

</html>

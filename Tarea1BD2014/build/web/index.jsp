<%@page import= "paquete.Coneccion" %>
<%@page contentType="text/html"%>
<!DOCTYPE html>
<html>
    <% Coneccion.ConnecttoDB(); %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log In</title>
    </head>
    <body>
        <h1>Porfavor ingrese su rut y su contraseña</h1>
        <form method='post' action ="checkusername.jsp" >
            <pre>
            Rut : <input type ="text" name="rut">
            Password : <input type ="password" name="password">
            </pre>
            <input type="submit" value="login">
        </form>

    </body>
</html>

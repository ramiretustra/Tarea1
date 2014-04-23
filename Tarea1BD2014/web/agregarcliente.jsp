
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript">
function validarForm(formulario) {
  if(formulario.nombre.value.length===0) { //¿Tiene 0 caracteres?
    formulario.nombre.focus();    // Damos el foco al control
    alert('No has escrito el nombre'); //Mostramos el mensaje
    return false; //devolvemos el foco
  }
   if(formulario.rut.value.length===0) { //¿Tiene 0 caracteres?
    formulario.rut.focus();    // Damos el foco al control
    alert('No has escrito el rut'); //Mostramos el mensaje
    return false; //devolvemos el foco
  }

 
  return true; //Si ha llegado hasta aquí, es que todo es correcto
}
</script>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post" action="checkingresocliente.jsp" onsubmit="return validarForm(this);">
            <pre>
                Nombre: <input type="text" name="nombre">
                Rut : <input type="text" name="rut">
                              
            </pre>
            <input type="submit" value="Ingresar">
        </form>
        
    </body>
</html>


<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
   if(formulario.password.value.length===0) { //¿Tiene 0 caracteres?
    formulario.password.focus();    // Damos el foco al control
    alert('No has escrito la contraseña'); //Mostramos el mensaje
    return false; //devolvemos el foco
  }
  if(formulario.rpassword.value.length===0) { //¿Tiene 0 caracteres?
    formulario.rpassword.focus();    // Damos el foco al control
    alert('No has repetido la contraseña'); //Mostramos el mensaje
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
         <%
            String driver = "oracle.jdbc.OracleDriver";
            String url = "jdbc:oracle:thin:@localhost:1521:XE";
            String username = "machi2";
            String password = "12345";
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url,username,password);
            Statement stm = conn.createStatement();
            
             HttpSession sesion=request.getSession();
             
             String nombre = (String)sesion.getAttribute("nombre");
             String tipo = (String)sesion.getAttribute("tipo");
             out.println("Nombre:"+nombre+" Tipo:"+tipo);
            %>
        <form method="post" action="checkingresovendedor.jsp" onsubmit="return validarForm(this);">
            <pre>
                Nombre: <input type="text" name="nombre">
                Rut : <input type="text" name="rut">
                Contraseña : <input type="password" name="password">
                Repetir Contraseña : <input type="password" name="rpassword"> 
                
            </pre>
            <input type="submit" value="Ingresar">
        </form>
        <a href="inicioadmin.jsp"><input type="submit" value="Cancelar"></a>
        
    </body>
</html>

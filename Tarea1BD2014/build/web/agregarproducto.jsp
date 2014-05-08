
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript">
function validarForm(formulario) {
  if(formulario.nombre.value.length===0) { //¿Tiene 0 caracteres?
    formulario.nombre.focus();    // Damos el foco al control
    alert('No has escrito el nombre'); //Mostramos el mensaje
    return false; //devolvemos el foco
  }
   if(formulario.codigo.value.length===0) { //¿Tiene 0 caracteres?
    formulario.codigo.focus();    // Damos el foco al control
    alert('No has escrito el rut'); //Mostramos el mensaje
    return false; //devolvemos el foco
  }
   if(formulario.descripcion.value.length===0) { //¿Tiene 0 caracteres?
    formulario.descripcion.focus();    // Damos el foco al control
    alert('No has escrito el rut'); //Mostramos el mensaje
    return false; //devolvemos el foco
  }
   if(formulario.categoria.value.length===0) { //¿Tiene 0 caracteres?
    formulario.categoria.focus();    // Damos el foco al control
    alert('No has escrito el rut'); //Mostramos el mensaje
    return false; //devolvemos el foco
  }
   if(formulario.cantidad.value.length===0) { //¿Tiene 0 caracteres?
    formulario.cantidad.focus();    // Damos el foco al control
    alert('No has escrito el rut'); //Mostramos el mensaje
    return false; //devolvemos el foco
  }
   if(formulario.precio.value.length===0) { //¿Tiene 0 caracteres?
    formulario.precio.focus();    // Damos el foco al control
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
        <form method="post" action="checkingresoproducto.jsp" onsubmit="return validarForm(this);">
            <pre>
                Codigo :<input type="text" name="codigo">
                Nombre : <input type="text" name="nombre">
                Descripcion : <input type="text" name="descripcion">
                Categoria : <input type="text" name="categoria">
                Stock : <input type="text" name="cantidad">
                Precio : <input type="text" name="precio">
                              
            </pre>
            <input type="submit" value="Ingresar">
        </form>
        <a href="iniciovendedor.jsp"><input type="submit" value="Cancelar"></a>
        
    </body>
</html>

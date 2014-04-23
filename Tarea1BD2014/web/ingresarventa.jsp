
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript">
function validarForm(formulario) {
  if(formulario.cantidad.value.length===0) { //¿Tiene 0 caracteres?
    formulario.cantidad.focus();    // Damos el foco al control
    alert('No has escrito el nombre'); //Mostramos el mensaje
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
        <form method="post" action="checkagregarprimeraventa.jsp" onsubmit="return validarForm(this);">
            <pre>
                Cliente: <%
                    String driver = "oracle.jdbc.OracleDriver";
                    String url = "jdbc:oracle:thin:@localhost:1521:XE";
                    String username = "machi";
                    String password = "12345";
                    Class.forName(driver);
                    Connection conn = DriverManager.getConnection(url,username,password);
                    
                    Statement stm_cliente = conn.createStatement();
                    String sql_clientes = "select * from cliente";
                    ResultSet clientes = stm_cliente.executeQuery(sql_clientes);
                    out.println("<select name='id_cliente'");
                    while(clientes.next()){
                        String nombre_cliente = clientes.getString("nombre");
                        int id_cliente = clientes.getInt("id_cliente");
                        out.println("<option value="+id_cliente+">"+nombre_cliente+"</option>");
                    }
                    out.println("</select>");
                    
                         %>
 
                Producto: <%
                   
                    
                    Statement stm = conn.createStatement();
                    String sql = "select * from producto";

                    ResultSet ciclo = stm.executeQuery(sql);
                    out.println("<select name='id_p'>");
                    while (ciclo.next()){
                        String nombre = ciclo.getString("nombre");
                        int id = ciclo.getInt("id_producto");
                        int precio = ciclo.getInt("precio");
                        out.println("<option value="+id+">"+nombre+" $"+precio+"</option>");  
                    }
                    out.println("</select>");
                    
                %>
                Fecha: <input type="text" name="fecha">
                Hora: <input type="text" name="hora">
                Cantidad: <input type="text" name="cantidad">                           
            </pre>
            <input type="submit" value="Agregar">
        </form>
        
        
    </body>
</html>

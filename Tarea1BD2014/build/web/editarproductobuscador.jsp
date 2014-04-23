<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       
    </head>
    <body>
       
<%
        
        String nombre = request.getParameter("nombre");
        
            
 
%>

    <form method="post" action="checkeditarproductobuscador.jsp">
            <pre>
                Codigo:<%
                    String driver = "oracle.jdbc.OracleDriver";
                    String url = "jdbc:oracle:thin:@localhost:1521:XE";
                    String username = "machi";
                    String password = "12345";
                    Class.forName(driver);
                    Connection conn = DriverManager.getConnection(url,username,password);
                    
                    Statement stm = conn.createStatement();
                    String sql = "select * from producto where nombre = '"+nombre+"'";
                    ResultSet datos = stm.executeQuery(sql);
                    datos.next();
                    int codigo = datos.getInt("codigo");
                    int cantidad = datos.getInt("stock");
                    int id_producto = datos.getInt("id_producto");
                    
                    HttpSession sesion=request.getSession();
 
                    sesion.setAttribute("idproducto",id_producto);
                    out.println(codigo);                    

                    %>
                Nombre: <% out.println(nombre); %>
                Stock: <% out.println(cantidad); %>
                Descripcion : <input type="text" name="descripcion">
                Categoria : <input type="text" name="categoria">
                Precio : <input type="text" name="precio"> 
                               
            </pre>
            <input type="submit" value="Editar"> 
       </form>
         
    </body>
</html>
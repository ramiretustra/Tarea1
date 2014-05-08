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
        
        String id_producto = request.getParameter("id_p");
        int int_id_producto = Integer.parseInt(id_producto);
    
       /*int id_p = Integer.parseInt(request.getParameter("id_p"));
       int idproducto = Integer.parseInt(request.getParameter("id_p"));*/
       HttpSession sesion=request.getSession();
 
       sesion.setAttribute("idproducto",int_id_producto);
            
 
%>

    <form method="post" action="checkeditarproductodrop.jsp">
            <pre>
                Codigo:<%
                    String driver = "oracle.jdbc.OracleDriver";
                    String url = "jdbc:oracle:thin:@localhost:1521:XE";
                    String username = "machi2";
                    String password = "12345";
                    Class.forName(driver);
                    Connection conn = DriverManager.getConnection(url,username,password);
                    
                    Statement stm = conn.createStatement();
                    String sql = "select * from producto where id_producto = "+int_id_producto+"";
                    ResultSet datos = stm.executeQuery(sql);
                    datos.next();
                    int codigo = datos.getInt("codigo");
                    String nombre = datos.getString("nombre");
                    int cantidad = datos.getInt("stock");
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
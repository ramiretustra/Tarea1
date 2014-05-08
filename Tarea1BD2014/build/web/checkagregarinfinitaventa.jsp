<%@page import="java.sql.Connection"%>
<%@page import = "java.sql.*" %>
<%@page import = "oracle.jdbc.driver.*" %>
<%@page contentType="text/html" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            String id_p = request.getParameter("id_p");
            int int_id_p = Integer.parseInt(id_p);
                        
            String cantidad = request.getParameter("cantidad");
            int int_cantidad = Integer.parseInt(cantidad);
                                                     
            String driver = "oracle.jdbc.OracleDriver";
            String url = "jdbc:oracle:thin:@localhost:1521:XE";
            String username = "machi2";
            String password = "12345";
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url,username,password);
            Statement stm = conn.createStatement();
            Statement stm2 = conn.createStatement();
            Statement stm3 = conn.createStatement();
            Statement stm4 = conn.createStatement();
                        
           
            String sql2 = "select * from producto where id_producto="+int_id_p;
            
            stm2.executeQuery(sql2);
            ResultSet producto = stm.executeQuery(sql2);
            producto.next();
            int precio = producto.getInt("precio");
            int precio_total_detalle = int_cantidad*precio;
            
            String sql4 = "select MAX(id_venta) from venta";
            ResultSet max_id_venta = stm4.executeQuery(sql4);
            max_id_venta.next();
            int id_venta = max_id_venta.getInt("max(id_venta)");            
            String sql3 = "insert into detalle_venta(id_venta, id_producto,cantidad,precio) values("+id_venta+","+int_id_p+","+int_cantidad+","+precio_total_detalle+")";
            
            stm3.executeQuery(sql3);
            %><script language="JavaScript">
                    alert("Producto vendido con exito");
                    location.href="ventainfinitoproducto.jsp";
                                </script>
            %>
    </body>
</html>

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
            String fecha = request.getParameter("fecha");
            //String hora = request.getParameter("hora");
            
            /*HttpSession sesion = request.getSession();
            
            int idproducto = (Integer)sesion.getAttribute("idproducto");*/
            
            String cantidad = request.getParameter("cantidad");
            int int_cantidad = Integer.parseInt(cantidad);
                                                     
            String driver = "oracle.jdbc.OracleDriver";
            String url = "jdbc:oracle:thin:@localhost:1521:XE";
            String username = "machi";
            String password = "12345";
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url,username,password);
            Statement stm = conn.createStatement();
            Statement stm2 = conn.createStatement();
            Statement stm3 = conn.createStatement();
            Statement stm4 = conn.createStatement();
                        
            String sql = "insert into compra(fecha) values('"+fecha+"')";
            String sql2 = "select * from producto where id_producto="+int_id_p;
            
            stm2.executeQuery(sql);
            ResultSet producto = stm.executeQuery(sql2);
            producto.next();
            int precio = producto.getInt("precio");
            int precio_total_detalle = int_cantidad*precio;
            
            String sql4 = "select MAX(id_compra) from compra";
            ResultSet max_id_compra = stm4.executeQuery(sql4);
            max_id_compra.next();
            int id_compra = max_id_compra.getInt("max(id_compra)");
            String sql3 = "insert into detalle_compra(id_compra, id_producto,cantidad,precio) values("+id_compra+","+int_id_p+","+int_cantidad+","+precio_total_detalle+")";
            
            stm3.executeQuery(sql3);
            %><script language="JavaScript">
                    alert("Producto comprado con exito");
                    location.href="comprainfinitoproducto.jsp";
                                </script>
            %>
    </body>
</html>

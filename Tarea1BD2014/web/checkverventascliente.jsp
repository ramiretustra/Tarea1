<%@page import="java.sql.DriverManager"%>
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
        Ventas: <%        
            String id_cliente = request.getParameter("id_c");
            int id_c = Integer.parseInt(id_cliente);
            
            
            String driver = "oracle.jdbc.OracleDriver";
            String url = "jdbc:oracle:thin:@localhost:1521:XE";
            String username = "machi2";
            String password = "12345";
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url,username,password);
            Statement stm = conn.createStatement();
            Statement stm2 = conn.createStatement();
            Statement stm3 = conn.createStatement();
            
            String sql = "select * from venta where id_cliente="+id_c;
                        
            ResultSet id_venta = stm.executeQuery(sql);
            id_venta.next();
            int id_v = id_venta.getInt("id_venta");
            
            String sql2 = "select * from detalle_venta where id_venta="+id_v;
            
            ResultSet id_detalle_venta = stm2.executeQuery(sql2);
            out.println("<select>");
            while(id_detalle_venta.next()){
                int id_p = id_detalle_venta.getInt("id_producto");
                String sql3 = "select * from producto where id_producto ="+id_p;
                ResultSet datos_producto = stm3.executeQuery(sql3);
                datos_producto.next();
                String nombre_p = datos_producto.getString("nombre");
                out.println("<option>"+nombre_p+"</option>");  
            }
            out.println("</select>");
                    
           
            %>
            <a href="inicioadmin.jsp"><input type="submit" value="Salir"></a>
    </body>
</html>

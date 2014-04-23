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
            String driver = "oracle.jdbc.OracleDriver";
            String url = "jdbc:oracle:thin:@localhost:1521:XE";
            String username = "machi";
            String password = "12345";
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url,username,password);
            Statement stm = conn.createStatement();
            Statement stm2 = conn.createStatement();
            Statement stm3 = conn.createStatement();
            
            String sql = "select MAX(id_venta) from venta";
            String sql2 = "select sum(precio) from detalle_venta";
            
            ResultSet max_id_venta = stm.executeQuery(sql);
            max_id_venta.next();
            int id_venta = max_id_venta.getInt("max(id_venta)");
            
            ResultSet monto = stm2.executeQuery(sql2);
            monto.next();
            int monto_total = monto.getInt("sum(precio)");
            String sql3 = "update venta set monto_total="+monto_total+" where id_venta = "+id_venta;
            
            stm3.executeQuery(sql3);
            
                      
           
            stm3.executeQuery(sql3);
            %><script language="JavaScript">
                    alert("Venta alizada con exito");
                    location.href="datosventa.jsp";
                                </script>
            %>
    </body>
</html>

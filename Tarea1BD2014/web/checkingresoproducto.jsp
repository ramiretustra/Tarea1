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
        <%  String nombre = request.getParameter("nombre");
            String codigo = request.getParameter("codigo");
            String descripcion = request.getParameter("descripcion");
            String categoria = request.getParameter("categoria");
            String cantidad = request.getParameter("cantidad");
            String precio = request.getParameter("precio");
            
            int cantidad_int = Integer.parseInt(cantidad);
            int precio_int = Integer.parseInt(precio);
            
                       
            String driver = "oracle.jdbc.OracleDriver";
            String url = "jdbc:oracle:thin:@localhost:1521:XE";
            String username = "machi2";
            String password2 = "12345";
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url,username,password2);
            Statement stm = conn.createStatement();
            
            String sql = "insert into producto(stock,descripcion,categoria,precio,codigo,nombre) values("+cantidad_int+",'"+descripcion+"','"+categoria+"',"+precio_int+",'"+codigo+"','"+nombre+"')";
            
            
            
            
            stm.executeUpdate(sql);
            %><script language="JavaScript">
                    alert("Producto agregado con exito");
                    location.href="iniciovendedor.jsp";
                                </script>
            %>
    </body>
</html>

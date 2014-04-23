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
            
            HttpSession sesion = request.getSession();
            
            int idproducto = (Integer)sesion.getAttribute("idproducto");
            
            String descripcion = request.getParameter("descripcion");
            String categoria = request.getParameter("categoria");
            String precio = request.getParameter("precio");
            
                                         
            String driver = "oracle.jdbc.OracleDriver";
            String url = "jdbc:oracle:thin:@localhost:1521:XE";
            String username = "machi";
            String password = "12345";
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url,username,password);
            Statement stm = conn.createStatement();
             
            if(descripcion != ""){
                String sql = "update producto set descripcion='"+descripcion+"' where id_producto="+idproducto;
                stm.executeUpdate(sql);
            }
            
            if(categoria != ""){
                String sql = "update producto set categoria='"+categoria+"' where id_producto="+idproducto;
                stm.executeUpdate(sql);                
            }
            if(precio != ""){
                String sql = "update producto set precio='"+precio+"' where id_producto="+idproducto;
                stm.executeUpdate(sql);
            }
                      
            
            %><script language="JavaScript">
                    alert("Producto editado con exito");
                    location.href="inicioadmin.jsp";
                                </script>
            %>
    </body>
</html>

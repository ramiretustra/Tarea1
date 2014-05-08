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
            String rut = request.getParameter("rut");
            String password = request.getParameter("password");
            String rpassword = request.getParameter("rpassword");
            String vendedor = "Vendedor";
            
            
           
            
            String driver = "oracle.jdbc.OracleDriver";
            String url = "jdbc:oracle:thin:@localhost:1521:XE";
            String username = "machi2";
            String password2 = "12345";
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url,username,password2);
            Statement stm = conn.createStatement();
            
            String sql = "insert into usuario(rut,contraseña,nombre,tipo) values('"+rut+"','"+password+"','"+nombre+"','"+vendedor+"')";
            
            
            
            
            stm.executeUpdate(sql);
            %><script language="JavaScript">
                    alert("Vendedor agregado con exito");
                    location.href="inicioadmin.jsp";
                                </script>
            %>
    </body>
</html>

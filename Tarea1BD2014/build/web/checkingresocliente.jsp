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
                       
            String driver = "oracle.jdbc.OracleDriver";
            String url = "jdbc:oracle:thin:@localhost:1521:XE";
            String username = "machi";
            String password2 = "12345";
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url,username,password2);
            Statement stm = conn.createStatement();
            
            String sql = "insert into cliente(rut,nombre) values('"+rut+"','"+nombre+"')";
            
            
            
            
            stm.executeUpdate(sql);
            %><script language="JavaScript">
                    alert("Cliente agregado con exito");
                    location.href="iniciovendedor.jsp";
                                </script>
            %>
    </body>
</html>

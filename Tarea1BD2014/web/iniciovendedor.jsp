<%-- 
    Document   : inicio
    Created on : 13-10-2013, 05:44:44 PM
    Author     : Machi
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
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
            String username = "machi2";
            String password = "12345";
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url,username,password);
            Statement stm = conn.createStatement();
            
             HttpSession sesion=request.getSession();
             
             String nombre = (String)sesion.getAttribute("nombre");
             String tipo = (String)sesion.getAttribute("tipo");
             out.println("Nombre:"+nombre+" Tipo:"+tipo);
            %>
        <a href="agregarcliente.jsp"><input type="submit" value="Agregar Cliente"></a>
        <a href="agregarproducto.jsp"><input type="submit" value="Agregar Producto"></a>
        <a href="ingresarventa.jsp"><input type="submit" value="Ingresar Venta"></a>
        <a href="misventas.jsp"><input type="submit" value="Ver mis Ventas"></a>
        <a href="index.jsp"><input type="submit" value="Log Out"></a>

    </body>
</html>

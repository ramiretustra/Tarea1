
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post" action="checkagregarinfinitaventa.jsp" onsubmit="return validarForm(this);">
            <pre>
                Rut Usuario: <%
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
                    
                    String sql = "select max(id_venta) from venta";
                    
                    
                    ResultSet max_id_venta = stm.executeQuery(sql);
                    max_id_venta.next();
                    int id_venta = max_id_venta.getInt("max(id_venta)");
                    
                    String sql2 = "select * from venta where id_venta="+id_venta;
                    ResultSet datos_venta = stm2.executeQuery(sql2);
                    datos_venta.next();
                    int id_usuario = datos_venta.getInt("id_usuario");
                    int id_cliente = datos_venta.getInt("id_cliente");
                    int monto_total = datos_venta.getInt("monto_total");
                    String fecha = datos_venta.getString("fecha");
                    //String hora = datos_venta.getString("hora");
                    
                    String sql3 = "select * from usuario";
                    String sql4 = "select * from cliente";
                    
                    ResultSet datos_usuario = stm3.executeQuery(sql3);
                    datos_usuario.next();
                    String nombre_usuario = datos_usuario.getString("nombre");
                    String rut_usuario = datos_usuario.getString("rut");
                    ResultSet datos_cliente = stm4.executeQuery(sql4);
                    datos_cliente.next();
                    String nombre_cliente = datos_cliente.getString("nombre");
                    String rut_cliente = datos_cliente.getString("rut");
                    
                    out.println(rut_usuario);         
                    

                    
                %>
                Nombre Usuario: <% out.println(nombre_usuario);%>
                Rut Cliente: <% out.println(rut_cliente);%>
                Nombre Cliente : <% out.println(nombre_cliente);%>
                Monto Total : <%out.println(monto_total);%>
                Fecha : <% out.println(fecha);%>
                
                                        
            </pre>
            
        </form>
                <a href="iniciovendedor.jsp"><input type="submit" value="Aceptar" ></a>
        
        
    </body>
</html>

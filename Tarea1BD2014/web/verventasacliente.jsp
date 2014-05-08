<%@page import = "java.sql.*" %>
<%@page import = "oracle.jdbc.driver.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar/Eliminar</title>
    </head>
    <body>
        <form method="post" action="checkverventascliente.jsp">
            <pre>
                Producto:<%
                    String driver = "oracle.jdbc.OracleDriver";
                    String url = "jdbc:oracle:thin:@localhost:1521:XE";
                    String username = "machi2";
                    String password = "12345";
                    Class.forName(driver);
                    Connection conn = DriverManager.getConnection(url,username,password);
                    
                    Statement stm = conn.createStatement();
                    String sql = "select * from cliente";

                    ResultSet ciclo = stm.executeQuery(sql);
                    out.println("<select name='id_c'>");
                    while (ciclo.next()){
                        String nombre = ciclo.getString("nombre");
                        int id = ciclo.getInt("id_cliente");
                        out.println("<option value="+id+">"+nombre+"</option>");  
                    }
                    out.println("</select>");
                    %>
            </pre>
            <input type="submit" value="Aceptar"> 
       </form>
            <%
            
            
             HttpSession sesion=request.getSession();
             
             String nombre = (String)sesion.getAttribute("nombre");
             String tipo = (String)sesion.getAttribute("tipo");
             out.println("Nombre:"+nombre+" Tipo:"+tipo);
            %>
                        <br><a href="inicioadmin.jsp"><input type="submit" value="Salir"></a>

             
    </body>
</html>
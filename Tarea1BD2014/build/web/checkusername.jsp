<%@page import = "java.sql.*" %>
<%@page import = "oracle.jdbc.driver.*" %>
<%@page contentType="text/html" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
                   
            String rut = request.getParameter("rut");
            String password2 = request.getParameter("password");
            
            String sql = "select * from usuario where rut='"+rut+"' and contraseña='"+password2+"'";
            String driver = "oracle.jdbc.OracleDriver";
            String url = "jdbc:oracle:thin:@localhost:1521:XE";
            String username = "machi";
            String password = "12345";
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url,username,password);
            Statement stm = conn.createStatement();
            
            ResultSet ciclo = stm.executeQuery(sql);
            ciclo.next();
            String tipo = ciclo.getString("tipo");
            int id_usuario = ciclo.getInt("id_ususario");
            
            HttpSession sesion=request.getSession();
 
            sesion.setAttribute("idusuario",id_usuario);
              
            if(tipo.equals("Administrador")){
                %><script language="JavaScript">
                        location.href="inicioadmin.jsp";
                                        </script><%
            }
            else if(tipo.equals("Vendedor")){
                 %><script language="JavaScript">
                            location.href="iniciovendedor.jsp";
                                                    </script><%
            }
           
            %>
      </body>
</html>


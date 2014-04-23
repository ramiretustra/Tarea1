package paquete;
import java.sql.*;
import static paquete.Coneccion.conexion;

public class Coneccion {
    static Connection conexion;
    static Statement sentencia;
    static ResultSet resultado;
    
   
    public static void ConnecttoDB(){
        String url = "oracle.jdbc.OracleDriver";
        String username = "machi";
        String password = "12345";
        try{
            Class.forName("oracle.jdbc.OracleDriver").newInstance();
            conexion = DriverManager.getConnection(url,username,password);
            sentencia = conexion.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("Ha conectado con la base de datos");
        } catch (InstantiationException e){
            System.out.println("No se ha podido conectar a la base de datos");
        } catch (IllegalAccessException e){
            System.out.println("No se ha podido conectar a la base de datos");
        } catch (ClassNotFoundException e){
            System.out.println("No se ha podido conectar a la base de datos");
        } catch (SQLException e){
            System.out.println("No se ha podido conectar a la base de datos");
        }
        
    }
  
}

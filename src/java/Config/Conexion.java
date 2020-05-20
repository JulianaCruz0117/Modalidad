
package Config;

import java.sql.*;

public class Conexion {
    Connection con;
    public Conexion(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gesprec","root","");            
        } catch (Exception e) {
            System.err.println("Error de Conexion"+e);
        }
    }
    public Connection getConnection(){
        return con;
    }
}

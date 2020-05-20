
package ModeloDAO;

import Config.Conexion;
import Modelo.Modalidad;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import Intefaces.ModalidadBuscar;

public class ModalidadDAO extends Conexion implements ModalidadBuscar{
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement puente;//puente
    ResultSet mensajero;//mensajero
    Modalidad m=new Modalidad();
    
    @Override
    public List listar() {
        ArrayList<Modalidad>list=new ArrayList<>();
        String sql="select * from modalidad";
        try {
            con=cn.getConnection();
            puente=con.prepareStatement(sql);
            mensajero=puente.executeQuery("CALL `SP_SELECTMODALIDAD` ");
            while(mensajero.next()){
                Modalidad mod=new Modalidad();
                mod.setId(mensajero.getInt("Id_Modalidad"));
                mod.setNom(mensajero.getString("Nombre_Modalidad"));
                
                list.add(mod);
            }
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    public Modalidad list(int id) {
        String sql="select * from modalidad where Id_Modalidad="+id;
        try {
            con=cn.getConnection();
            puente=con.prepareStatement(sql);
            mensajero=puente.executeQuery();
            while(mensajero.next()){                
                m.setId(mensajero.getInt("Id_Modalidad"));
                m.setNom(mensajero.getString("Nombre_Modalidad"));
                
                
            }
        } catch (Exception e) {
        }
        return m;
    }
}

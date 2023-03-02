package Model;



import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;


public class HistorialDao implements IHistorialDao{
    
        PreparedStatement parametro;
    ResultSet consulta;
    Conexion conexion;

    @Override
    public DefaultTableModel GetHistorial() {
         DefaultTableModel table = new DefaultTableModel();

        try {
            conexion = new Conexion();
            conexion.OpenConnection();

            String query = "select e.id_paciente id, p.nombre_paciente, t.tipo_examen, ti.tipo_atencion, d.descripcion, m.nombre from examen e, pacientes p, empleados em, clinica c, tipo_examenes t, citas ci, tipo_atenciones ti, diagnosticos d, medicinas m where e.id_paciente =  p.id_paciente  and e.id_tipo_examen = t.id_tipo_examen and ci.id_tipo_atencion = ti.id_tipo_atencion and e.id_paciente = d.id_paciente and m.id_medicina = d.id_medicina group by t.tipo_examen, t.tipo_examen, e.id_paciente;";

            consulta = conexion.conexionBD.createStatement().executeQuery(query);

            String header[] = {"id", "nombre_paciente", "tipo_examen", "tipo_atencion", "descripcion", "nombre"};

            table.setColumnIdentifiers(header);

            String datos[] = new String[6];

            while (consulta.next()) {
                datos[0] = consulta.getString("id");
                datos[1] = consulta.getString("nombre_paciente");
                datos[2] = consulta.getString("tipo_examen");
                datos[3] = consulta.getString("tipo_atencion");
                datos[4] = consulta.getString("descripcion");
                datos[5] = consulta.getString("nombre");
              

                table.addRow(datos);

              

            }

        } catch (SQLException e) {
            System.out.println("Error!!:" + e.getMessage());
        } finally {
            conexion.Closeconnection();
        }

        return table;
    
    }

    
    
    
}

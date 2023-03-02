package Model;

import java.util.HashMap;


public interface IExamenDao {
    
    public int SaveExamen(ExamenEntity examen);
    public HashMap GetEmployee();
    public HashMap GetExament();
    public HashMap GetClinic();
    public HashMap GetPaciente();
    
}

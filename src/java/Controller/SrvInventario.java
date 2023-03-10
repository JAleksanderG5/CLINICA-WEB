package Controller;

import Model.IInventoryDao;
import Model.InventoryDao;
import Model.MedicineEntity;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class SrvInventario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SrvInventario</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SrvInventario at " + request.getContextPath() + "</h1>");
            
            MedicineEntity medicina = new MedicineEntity();
            IInventoryDao dao = new InventoryDao();
            
            medicina.setIdInventory(Integer.valueOf(request.getParameter("txt_id")));
            medicina.setIdMedicine(Integer.valueOf(request.getParameter("drop_medicina")));
            medicina.setProveedor(request.getParameter("txt_proveedor"));
            medicina.setCantidad(Integer.valueOf(request.getParameter("txt_existencias")));
            medicina.setFechaVencimiento(request.getParameter("txt_fn"));
            
            
            //Botón Guardar
            if ("agregar".equals(request.getParameter("btn_agregar"))) {

                int contador = dao.AddMedicine(medicina);
                
                if (contador > 0) {
                    response.sendRedirect("inventario.jsp");

                } else {
                    out.println("<h1> xxxxxxx No se Ingreso xxxxxxxxxxxx </h1>");
                    out.println("<a href='index.jsp'>Regresar...</a>");
                }
            }
            
            
            out.println(request.getParameter("txt_id"));
            out.println(request.getParameter("drop_medicina"));
            
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

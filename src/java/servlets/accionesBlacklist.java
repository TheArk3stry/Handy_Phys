/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import classes.sql;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ivan-hdz
 */
public class accionesBlacklist extends HttpServlet {
    
    Connection con = sql.conectar();
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            switch(request.getParameter("cual")){
                case "nuevo":
                {
                    agregar(request.getParameter("palabra"));
                    response.sendRedirect("../jsp/admin_blacklist.jsp");
                    break;
                }
                case "existe":
                {
                    if(request.getParameter("accion").equals("true"))
                    {
                        estado(Integer.parseInt(request.getParameter("id")), true);
                        response.sendRedirect("../jsp/admin_blacklist.jsp");
                    }
                    else
                    {
                        if(request.getParameter("accion").equals("false"))
                        {
                            estado(Integer.parseInt(request.getParameter("id")), false);
                            response.sendRedirect("../jsp/admin_blacklist.jsp");
                        }
                        else
                        {
                            if(request.getParameter("accion").equals("del")){
                                eliminar(Integer.parseInt(request.getParameter("id")));
                                response.sendRedirect("../jsp/admin_blacklist.jsp");
                            }
                        }
                    }
                    break;
                }
                case "borrar":
                {
                    eliminarTodo();
                    response.sendRedirect("../jsp/admin_blacklist.jsp");
                    break;
                }
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    private void estado(int ID, boolean isActive){
        try{
        PreparedStatement ps = con.prepareStatement("call cambiar_blacklist(?, ?);");
        ps.setInt(1, ID);
        ps.setBoolean(2, isActive);
        ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    private void eliminar(int ID){
        try{
        PreparedStatement ps = con.prepareStatement("call eliminar_blacklist(?);");
        ps.setInt(1, ID);
        ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    private void agregar(String palabra){
        try{
        PreparedStatement ps = con.prepareStatement("call insertar_blacklist(?);");
        ps.setString(1, palabra);
        ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    private void eliminarTodo(){
        try{
            PreparedStatement ps = con.prepareStatement("call eliminarTodo_blacklist();");
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
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

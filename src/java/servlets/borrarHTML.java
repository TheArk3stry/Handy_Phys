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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Alumno
 */
public class borrarHTML extends HttpServlet {

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
        int tipoCont = Integer.parseInt(request.getParameter("tipoCont"));
        try (PrintWriter out = response.getWriter()) {
           try{
                Connection con = sql.conectar();
                PreparedStatement ps = con.prepareStatement("call borrarArticulo(?, ?)");
                ps.setInt(1, Integer.parseInt(request.getParameter("idArticulo")));
                ps.setInt(2, tipoCont);
                ps.executeUpdate();
                if(tipoCont == 1){
                     response.sendRedirect("../jsp/todo_articulos.jsp");
                }else{
                    if(tipoCont == 2){
                        response.sendRedirect("../jsp/todo_preguntas.jsp");
                    }else{
                        if(tipoCont == 3){
                            response.sendRedirect("../jsp/examenes.jsp");
                        }else{
                            if(tipoCont == 4){
                                response.sendRedirect("../jsp/todo_simulExam.jsp");
                            }
                        }
                    }
                }
           }catch(Exception e){
               e.printStackTrace();
           }
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.RegistrationDAO;
import dto.RegistrationDTO;
import dto.RegistrationErrorObject;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Calendar;

/**
 *
 * @author Admin
 */
@WebServlet(name = "InsertController", urlPatterns = {"/InsertController"})
public class InsertController extends HttpServlet {
    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "index.jsp";;
    private static final String INVALID = "insert.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String username = request.getParameter("txtUsername");
            String password = request.getParameter("txtPassword");
            String fullName = request.getParameter("txtFullname");
            String confirm = request.getParameter("txtConfirm");
            String role = request.getParameter("cboRole");
            
            RegistrationErrorObject errorObject = new RegistrationErrorObject();
            boolean valid = true;
            if(username.length() == 0 ) {
                valid = false;
                errorObject.setUsernameError("Username can't be blank");
            }
            if(fullName.length() == 0 ) {
                valid = false;
                errorObject.setFullnameError("FullName can't be blank");
            }
            if(password.length() == 0 ) {
                valid = false;
                errorObject.setPasswordError("Password can't be blank");
            }
            if(!confirm.equals(password)) {
                valid = false;
                errorObject.setConfirmPassword("Confirm must match password");
            }
            
            
            if(valid) {
                RegistrationDTO dto = new RegistrationDTO(username, fullName, role);
                dto.setPassword(password);
                RegistrationDAO dao = new RegistrationDAO();
                if(dao.insert(dto)) {
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("INVALID", errorObject);
                url = INVALID;
            }
            Date d=new Date(0);
            Timestamp dateTimestamp =new Timestamp(d.getTime());
            
            
            Calendar calDate=Calendar.getInstance();
            calDate.setTimeInMillis(d.getTime());
        } catch (Exception e) {
            log("ERROR at InsertController: " + e.getMessage());
            if(e.getMessage().contains("duplicate")) {
                url = INVALID;
                RegistrationErrorObject errorObject = new RegistrationErrorObject();
                errorObject.setUsernameError("Username is existed");
                request.setAttribute("INVALID", errorObject);
            }
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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

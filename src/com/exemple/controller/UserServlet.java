package com.exemple.controller;

import com.exemple.da.UserDAO;
import com.exemple.entity.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class UserServlet extends HttpServlet {
    private UserDAO userDAO;
    public  void  init (){ userDAO = new UserDAO();}
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doGet(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();
        try{
            switch (action){
                case "/new":
                showNewForm(request,response);
                break;
                case "/insert":
                insertUser(request,response);
                break;
                case "/delete":
                deleteUser(request,response);
                break;
                case "/edit":
                showEditForm(request,response);
                break;
                case "/update":
                UpdateUser(request,response);
                break;
            }
        }catch (SQLException | ClassNotFoundException ex){
            throw  new  ServletException(ex);
        }
    }

    private  void listUser(HttpServletRequest request , HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        List<User> listUser = userDAO.selectALLUser();
        request.setAttribute("listUser",listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user-list.jsp");
        dispatcher.forward(request,response);
    }
    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        RequestDispatcher dispatcher = request.getRequestDispatcher("user-form.jsp");
        dispatcher.forward(request,response);
    }
    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        User existingUser = userDAO.selectUser(id);
        RequestDispatcher dispatcher = request .getRequestDispatcher("user-form.jsp");
        request.setAttribute("user",existingUser);
        dispatcher.forward(request,
                response);
    }
    private void insertUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User newUser = new User(name,email,country);
        userDAO.insertUser(newUser);
        response.sendRedirect("list");
    }
    private void UpdateUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User book = new User(name,email,country);
        userDAO.UpdateUser(book);
        response.sendRedirect("list");

    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        userDAO.deleteUser(id);
        response.sendRedirect("list");
    }


}

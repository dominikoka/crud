package main.resources.controllers;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/CreateWindow")
public class CreatePersonWindow extends HttpServlet {

  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    String toModify = request.getParameter("toModify");

    if(toModify.equals("person")){
      System.out.println("perspn");
      RequestDispatcher req = request.getRequestDispatcher("WEB-INF/createPerson.jsp");

      try {

        req.forward(request,response);

      }catch(Exception e){
        e.printStackTrace();
      }
    }
    else
    {
      System.out.println("cos innego");
      RequestDispatcher req = request.getRequestDispatcher("WEB-INF/createItem.jsp");

      try {

        req.forward(request,response);

      }catch(Exception e){
        e.printStackTrace();
      }
    }


  }
}

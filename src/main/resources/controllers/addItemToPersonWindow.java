package main.resources.controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import main.resources.models.Item;
import main.resources.models.Read;

import java.io.IOException;
import java.util.List;

@WebServlet("/addItemToPerson")
public class addItemToPersonWindow extends HttpServlet {
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String numberDB = request.getParameter("toModify");

    Read read = new Read();
   List<Item> items = read.showAllItems();

    request.setAttribute("items", items);
    System.out.println("muj numer " + numberDB);

    request.setAttribute("numberDB", numberDB);
    RequestDispatcher req = request.getRequestDispatcher("WEB-INF/views/addItemToPerson.jsp");

    try {

      req.forward(request,response);

    }catch(Exception e){
      e.printStackTrace();
    }
  }
}

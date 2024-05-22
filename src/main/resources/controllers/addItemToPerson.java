package main.resources.controllers;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import main.resources.models.Create;


@WebServlet("/AddItem")
public class addItemToPerson extends HttpServlet {

  public void doGet(HttpServletRequest request, HttpServletResponse response)
  {
    int person = Integer.parseInt(request.getParameter("person"));
    int item = Integer.parseInt(request.getParameter("item"));

    System.out.println("oto muj item " + item + "oto muj person " + person);
    Create create = new Create();
    create.createOrder(person,item);
  }

}

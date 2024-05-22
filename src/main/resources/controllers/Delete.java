package main.resources.models;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/Delete")
public class Delete extends HttpServlet {

  public void doGet(HttpServletRequest request, HttpServletResponse response)
  {
    String type = request.getParameter("toModify");
    System.out.println(type);
    Integer id = Integer.valueOf(type.substring(1));
    if(type.substring(0,1).equals("Y"))
    {
      DeleteModel delete = new DeleteModel(id);
      delete.deletePerson();
    }
    else
    {
      System.out.println("wchodzi do kontrolera");
      DeleteModel delete = new DeleteModel(id);
      delete.deleteItem();
    }
  }

}
